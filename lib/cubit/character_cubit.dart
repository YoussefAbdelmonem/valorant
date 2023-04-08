import 'dart:convert';

import 'package:bloc/bloc.dart';
import 'package:meta/meta.dart';
import 'package:valorant/data/model/role_model.dart';
import 'package:valorant/data/repo/repo_layer.dart';

import '../data/model/ability_model.dart';
import '../data/model/all_date/role_model.dart';
import '../data/model/character_model.dart';
import '../data/model/voice_line.dart';

part 'character_state.dart';

class CharacterCubit extends Cubit<CharacterState> {
  CharacterCubit(this.repoLayer) : super(CharacterInitial());
  final RepoLayer repoLayer;

  Future<List<CharacterModel>> requestCharacter() async {
    try {
      final response = await repoLayer.getAgentData();
      if (response == null) {
        return [];
      }
      final listOfCharacters = json.decode(response.body);
      final owo = listOfCharacters['data'] as List<dynamic>;
      final list = owo
          .map((dynamic e)
      {
        //Role
        final roles = e['role'] ?? {};
        final roleInfo = RoleModel(
            displayName: roles['displayName'] ?? '',
            description: roles['description'] ?? '',
            displayIcon: roles['displayIcon'] ?? '',
            id: roles['uuid'] ?? '');

        //Abilities
        final abilities = e['abilities'] as List<dynamic>;
        final abilitiesInfo = abilities
            .map((dynamic a) => Ability(
          slot: a['slot'] ?? '',
          displayName: a['displayName'] ?? '',
          description: a['description'] ?? '',
          displayIcon: a['displayIcon'] ?? '',
        ))
            .toList();
        abilitiesInfo.retainWhere((x) => x.displayIcon.isNotEmpty);

        //VoiceLine
        final voiceLine = e['voiceLine'] ?? {};
        final voiceMediaList = voiceLine['mediaList'] as List;
        final voiceMedia =
        VoiceLine(voiceLine: voiceMediaList[0]['wave']);

        return CharacterModel(
          displayName: e['displayName'] ?? '',
          description: e['description'] ?? '',
          background: e['background'] ?? '',
          fullPortrait: e['fullPortrait'] ?? '',
          role: roleInfo,
          abilities: abilitiesInfo,
          voiceLine: voiceMedia,
        );
      }
      ).toSet()
          .toList();

      list.retainWhere((x) => x.fullPortrait.isNotEmpty);
      return list;
    } catch (e) {
      print(e);
      throw Exception(e.toString());
    }
  }

  Future<void> getCharacter()async{
    emit(CharacterLoadingState());
    try {
      final characters = await requestCharacter();
      emit(CharacterSuccessState(characters: characters));
    }catch (e) {
      emit(CharacterErrorState(error: e.toString()));
    }
  }
}
