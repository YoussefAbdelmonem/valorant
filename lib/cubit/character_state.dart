part of 'character_cubit.dart';

@immutable
abstract class CharacterState {}

class CharacterInitial extends CharacterState {

  CharacterInitial();
}

class CharacterLoadingState extends CharacterState {

  CharacterLoadingState();
}
class CharacterSuccessState extends CharacterState {

  List<CharacterModel> characters;
  CharacterSuccessState({required this.characters});

  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      other is CharacterSuccessState &&
          runtimeType == other.runtimeType &&
          characters == other.characters;

  @override
  int get hashCode => characters.hashCode;

}

class CharacterErrorState extends CharacterState {
  String error;
  CharacterErrorState({required this.error});

  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      other is CharacterErrorState &&
          runtimeType == other.runtimeType &&
          error == other.error;
  @override
  int get hashCode => error.hashCode;

}
