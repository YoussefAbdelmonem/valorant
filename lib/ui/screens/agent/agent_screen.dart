

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:valorant/cubit/character_cubit.dart';

import '../../../data/model/character_model.dart';
import '../../widgets/agent_list_widget.dart';

class AgentsScreen extends StatefulWidget {
  const AgentsScreen({Key? key}) : super(key: key);

  @override
  State<AgentsScreen> createState() => _AgentsScreenState();
}

class _AgentsScreenState extends State<AgentsScreen> {
  List<CharacterModel> characters = [];

  @override
  Widget build(BuildContext context) {
    return AgentsList(data: characters, count: 2);
  }

  @override
  void initState() {
    // context.read<CharactersCubit>().getCharacters();
    final cubitData = context.read<CharacterCubit>();
    if (cubitData.state is CharacterSuccessState) {
      characters = (cubitData.state as CharacterSuccessState).characters;
      // print(characters);
    }
    super.initState();
  }
}
