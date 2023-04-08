import 'package:flutter/material.dart';
import 'package:valorant/ui/widgets/voice_widget.dart';

import '../../data/model/ability_model.dart';
import '../../data/model/character_model.dart';
import '../../data/model/voice_line.dart';

class AgentsList extends StatefulWidget {
  AgentsList({Key? key, required this.data, required this.count})
      : super(key: key);
  List<CharacterModel> data;
  int count = 2;
  @override
  State<AgentsList> createState() => _AgentsListState();
}

class _AgentsListState extends State<AgentsList> {
  @override
  Widget build(BuildContext context) {
    return Material(child: screen(widget.data));
  }

  screen(dynamic data) {
    return Container(
      color: const Color(0xffBD3944),
      child: GridView.builder(
        cacheExtent: 1800000000,
        // shrinkWrap: true,
        gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
          childAspectRatio: 0.8,
          // crossAxisSpacing: 20,
          crossAxisCount: widget.count,
          // mainAxisExtent: 20
        ),
        itemCount: data.length,
        itemBuilder: (context, index) {
          if (data[index] != null) {
            return GestureDetector(
              onTap: () {
                Navigator.of(context).push(MaterialPageRoute(
                    builder: (context) => dataAbilities(data, index)));
              },
              child: Container(
                decoration: BoxDecoration(
                  // color: const Color(0xffBD3944),
                  // borderRadius: BorderRadius.circular(20),
                  image: DecorationImage(
                    image: NetworkImage(data[index].background),
                    fit: BoxFit.cover,
                  ),
                ),
                child: Column(
                  children: [
                    Stack(children: [
                      Image.network(data[index].fullPortrait),
                      Padding(
                        padding: const EdgeInsets.all(16.0),
                        child: Image.network(
                          data[index].role.displayIcon ?? '',
                          width: 0.08 * MediaQuery.of(context).size.width,
                          height: 0.08 * MediaQuery.of(context).size.width,
                        ),
                      ),
                    ]),
                    Text(
                      data[index].displayName ?? 'No name',
                      style: const TextStyle(
                          color: Color(0xFFFFFBF5),
                          fontWeight: FontWeight.w600,
                          fontSize: 25),
                    ),
                  ],
                ),
              ),
            );
          }
          return const Center(
            child: CircularProgressIndicator(color: Colors.red),
          );
        },
      ),
    );
  }

  dataAbilities(data, index) {
    List<Ability> ability = data[index].abilities;
    VoiceLine voiceLinePlay = data[index].voiceLine;
    return Material(
        child: Scaffold(
          appBar: AppBar(
            leading: IconButton(
                icon: const Icon(
                  Icons.arrow_back_ios,
                  // size: 30,
                  color: Color.fromARGB(255, 211, 101, 110),
                ),
                onPressed: () => Navigator.of(context).pop()),
            leadingWidth: 50,
            elevation: 0,
            backgroundColor: const Color(0xFF53212B),
            title: Padding(
              padding: const EdgeInsets.only(right: 50.0, top: 16),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  iconInfo(data, index),
                  Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: Text(
                      data[index].displayName ?? 'No name',
                      style: const TextStyle(
                          color: Color(0xFFFFFBF5),
                          fontWeight: FontWeight.w600,
                          fontSize: 40),
                    ),
                  )
                ],
              ),
            ),
          ),
          body: Container(
            color: const Color(0xFF53212B),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.spaceAround,
              children: [
                Container(
                  decoration: BoxDecoration(
                    // color: Colors.red,
                      image: DecorationImage(
                          fit: BoxFit.cover,
                          image: NetworkImage(data[index].background))),
                  child: Image.network(data[index].fullPortrait, fit: BoxFit.cover),
                ),
                Column(
                  children: [
                    VoiceWidget(url: voiceLinePlay.voiceLine),
                    GridView.builder(
                      shrinkWrap: true,
                      gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                        crossAxisCount: ability.length == 4 ? 4 : 5,
                      ),
                      itemCount: ability.length,
                      itemBuilder: ((context, index) => ListTile(
                        title: GestureDetector(
                          onTap: (() {
                            showDialog(
                                context: context,
                                builder: (context) {
                                  return AlertDialog(
                                    shape: RoundedRectangleBorder(
                                        borderRadius:
                                        BorderRadius.circular(20)),
                                    title: Text(ability[index].displayName,
                                        style: const TextStyle(
                                            color: Color(0xFFFD4556),
                                            fontSize: 20,
                                            fontWeight: FontWeight.w800)),
                                    content:
                                    Text(ability[index].description),
                                    backgroundColor: const Color(0xFF53212B),
                                    contentTextStyle:
                                    const TextStyle(color: Colors.white),
                                    elevation: 2,
                                  );
                                });
                          }),
                          child: Container(
                            // width: 50,
                            // height: 50,
                              color: Colors.transparent,
                              child: Image.network(
                                  ability[index].displayIcon)),
                        ),
                      )),
                    ),
                  ],
                )
              ],
            ),
          ),
        ));
  }

  iconInfo(data, index) {
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: Container(
          color: Colors.transparent,
          child: GestureDetector(
              onTap: () {
                showDialog(
                    context: context,
                    builder: (context) {
                      return AlertDialog(
                        title: Text(data[index].role.displayName ?? '',
                            style: const TextStyle(
                                color: Color(0xFFFD4556),
                                fontSize: 20,
                                fontWeight: FontWeight.w800)),
                        content: Text(data[index].role.description ?? ''),
                        backgroundColor: const Color(0xFF53212B),
                        contentTextStyle: const TextStyle(color: Colors.white),
                        elevation: 2,
                      );
                    });
              },
              child: Image.network(
                data[index].role.displayIcon ?? '',
                width: 0.1 * MediaQuery.of(context).size.width,
                height: 0.1 * MediaQuery.of(context).size.width,
              ))),
    );
  }
}
