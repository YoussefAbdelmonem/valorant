import 'package:valorant/data/model/ability_model.dart';
import 'package:valorant/data/model/role_model.dart';
import 'package:valorant/data/model/voice_line.dart';

class CharacterModel {
  CharacterModel(
      {
        // required this.id,
        required this.displayName,
        required this.description,
        required this.fullPortrait,
        required this.background,
        required this.role,
        required this.abilities,
        required this.voiceLine});

  // int id;
  String displayName;
  String description;
  String fullPortrait;
  String background;
  RoleModel role;
  List<Ability> abilities;
  VoiceLine voiceLine;
}