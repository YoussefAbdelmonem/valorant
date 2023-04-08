import 'package:animated_widgets/widgets/opacity_animated.dart';
import 'package:flutter/material.dart';

class SplashScreen extends StatelessWidget {
  const SplashScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: Stack(
        alignment: Alignment.center,
        children: [
         Container(
           color: Colors.white,
           width: MediaQuery.of(context).size.width,
           height: MediaQuery.of(context).size.height,
         ),
          OpacityAnimatedWidget.tween(
            opacityEnabled: 1,
            opacityDisabled: 0,
            duration: const Duration(milliseconds: 2000),
            enabled: true,
            animationFinished: (finished) {

             // Utils.openScreen(context, const CreateAccountScreen());
            },
            child: Image.asset(
              "assets/images/Valorant.png",
            ),
          ),
        ],
      ),
    );
  }
}