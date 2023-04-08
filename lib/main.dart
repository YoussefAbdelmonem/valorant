import 'package:animated_splash_screen/animated_splash_screen.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:valorant/data/repo/repo_layer.dart';
import 'package:valorant/ui/screens/home/home_screen.dart';
import 'package:valorant/ui/screens/home_screen/home.dart';
import 'package:valorant/ui/screens/on_boarding/on_boarding_screen.dart';

import 'constant/constant.dart';
import 'cubit/character_cubit.dart';

void main() async{
  WidgetsFlutterBinding.ensureInitialized();
  SharedPreferences prefInst = await SharedPreferences.getInstance();
  prefInst.get('isIntroRead') ?? prefInst.setBool('isIntroRead', false);
  runApp(MultiBlocProvider(
    providers: [
      BlocProvider<CharacterCubit>(
        create: (context) => CharacterCubit(charactersRepository),
      ),
    ],
    child: MaterialApp(
      debugShowCheckedModeBanner: false,


      initialRoute: '/',
      routes: {
        '/': (context) => AnimatedSplashScreen(
            splashIconSize: 251,
            splash: 'assets/images/Valorant.png',
            nextScreen: prefInst.getBool('isIntroRead') == true
                ?   const App()
                :   OnBoardingScreen(),
            splashTransition: SplashTransition.fadeTransition,

            backgroundColor:   Colors.white
        ),

      },
    ),
  ));
}

class App extends StatefulWidget {
  const App({Key? key}) : super(key: key);
  @override
  State<App> createState() => _AppState();
}

class _AppState extends State<App> {
  TextEditingController usernameController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    GlobalKey<ScaffoldState> scaffoldKey = GlobalKey<ScaffoldState>();
    return Scaffold(
        key: scaffoldKey,
        backgroundColor: const Color.fromARGB(255, 27, 32, 35),
        body:const Home()
    );
  }
}



