import 'dart:async';
import 'package:animated_background/animated_background.dart';
import 'package:flutter/material.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
import 'package:get/get.dart';
import 'package:slider_screen/views/slider/slider_screen.dart';

class SPLASH_UI extends StatefulWidget {
  const SPLASH_UI({Key? key}) : super(key: key);

  @override
  State<SPLASH_UI> createState() => _SPLASH_UIState();
}

class _SPLASH_UIState extends State<SPLASH_UI> with TickerProviderStateMixin {
  @override
  void initState() {
    super.initState();
    // Add a delay for splash screen effect
    Future.delayed(
      Duration(seconds: 3),
      () {
        navigateToSliderScreen();
      },
    );
  }

  void navigateToSliderScreen() {
    Navigator.pushReplacement(
      context,
      PageRouteBuilder(
        pageBuilder: (context, animation, secondaryAnimation) => SLIDER_UI(),
        transitionsBuilder: (context, animation, secondaryAnimation, child) {
          const begin = 0.0;
          const end = 1.0;
          const curve = Curves.linear;

          var tween =
              Tween(begin: begin, end: end).chain(CurveTween(curve: curve));
          var opacityAnimation = animation.drive(tween);

          return FadeTransition(
            opacity: opacityAnimation,
            child: child,
          );
        },
        transitionDuration: Duration(seconds: 3),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: AnimatedBackground(
        behaviour: RandomParticleBehaviour(
          options: ParticleOptions(
            baseColor: Color(0xFFE7C1E9),
            spawnOpacity: 0.0,
            opacityChangeRate: 0.25,
            minOpacity: 0.1,
            maxOpacity: 0.4,
            spawnMinSpeed: 30.0,
            spawnMaxSpeed: 40.0,
            spawnMinRadius: 7.0,
            spawnMaxRadius: 15.0,
            particleCount: 20,
          ),
        ),
        vsync: this,
        child: Container(
          height: MediaQuery.of(context).size.height,
          child: Center(
            child: SingleChildScrollView(
              scrollDirection: Axis.horizontal,
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Image.asset(
                    'assets/images/logo.gif',
                    width: MediaQuery.of(context).size.width * 0.8,
                  ),
                  SizedBox(height: MediaQuery.of(context).size.width * 0.02),
                  SpinKitThreeBounce(
                    color: Color.fromARGB(255, 227, 116, 232),
                    size: MediaQuery.of(context).size.width * 0.1,
                    duration: Duration(seconds: 1),
                  ),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}
