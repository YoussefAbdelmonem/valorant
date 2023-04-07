import 'package:valorant/data/model/ability_model.dart';
import 'package:valorant/data/model/role_model.dart';
import 'package:valorant/data/model/voice_line.dart';

class CharacterModel
{
  String fullPortrait,displayIcon,description,displayName;
List<Ability> abilities;
  VoiceLine voiceLine;
  Role role ;

  CharacterModel(
      {
        required this.fullPortrait,
        required this.displayIcon,
        required this.description,
        required  this.displayName,
        required this.abilities,
        required this.role,
        required this.voiceLine});
}