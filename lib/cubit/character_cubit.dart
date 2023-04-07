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
      final responseDecoded = json.decode(response.body);
      final data = responseDecoded["data"] as List<dynamic>;
      final list = data.map((e) {
        final role = e["role"] ?? {};
        final roleInfo = Role(
          displayIcon: role["displayIcon"] ?? "",
          description: role["description"] ?? "",
          displayName: role["displayName"] ?? "",
          uuid: role["uuid"] ?? "",
        );

        /// abilities
        final abilities = e["abilities"] as List<dynamic>;
        final abilitiesList = abilities.map((a) {
          return Ability(
            displayIcon: a["displayIcon"] ?? "",
            description: a["description"] ?? "",
            displayName: a["displayName"] ?? "",
            slot: a["slot"] ?? "",
          );
        }).toList();
        abilitiesList.retainWhere((element) => element.displayName.isNotEmpty);

        /// voice line
        final voiceLine = e["voiceLine"] ?? {};
        final voiceMediaList = voiceLine["mediaList"] as List;
        final voiceMedia = VoiceLine(
          voiceLine: voiceMediaList[0]["wave"] ?? "",
        );

        return CharacterModel(
          fullPortrait: e["fullPortrait"] ?? "",
          displayIcon: e["displayIcon"] ?? "",
          description: e["description"] ?? "",
          displayName: e["displayName"] ?? "",
          abilities: abilitiesList,
          voiceLine: voiceMedia,
          role: roleInfo,
        );
      }).toSet().toList();
      list.retainWhere((element) => element.fullPortrait.isNotEmpty);
      return list ;
    } catch ( e) {
      print(e);
      throw Exception(e);

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
