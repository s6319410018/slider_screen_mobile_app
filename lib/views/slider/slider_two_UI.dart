import 'package:flutter/material.dart';
import 'package:flutter_animate/flutter_animate.dart';
import 'package:google_fonts/google_fonts.dart';

class SLIDER_TWO_UI extends StatefulWidget {
  const SLIDER_TWO_UI({super.key});

  @override
  State<SLIDER_TWO_UI> createState() => _SLIDER_TWO_UIState();
}

class _SLIDER_TWO_UIState extends State<SLIDER_TWO_UI> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        children: [
          Image.asset(
            'assets/images/screen_two_bg.jpg',
            fit: BoxFit.cover,
            width: double.infinity,
            height: double.infinity,
          ),
          Positioned(
            left: 0,
            right: 0,
            bottom: MediaQuery.of(context).size.height * 0.07,
            child: Align(
              alignment: Alignment.centerLeft,
              child: Padding(
                padding: EdgeInsets.only(
                  left: MediaQuery.of(context).size.width * 0.05,
                  right: MediaQuery.of(context).size.width * 0.05,
                ),
                child: Column(
                  children: [
                    Align(
                      alignment: FractionalOffset.centerLeft,
                      child: Animate(
                        child: Text(
                          "Haircut service",
                          style: GoogleFonts.kanit(
                            fontSize: MediaQuery.of(context).size.width * 0.09,
                            color: Colors.white,
                            shadows: [
                              Shadow(
                                color: Colors.black,
                                offset: Offset(2.0, 1.0),
                                blurRadius: 3.0,
                              ),
                            ],
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                      ).slideX(duration: 2000.ms).fade(duration: 1000.ms),
                    ),
                    Align(
                      alignment: Alignment.centerLeft,
                      child: Animate(
                        child: Text(
                          "A barbershop is a place where men and women go to get their hair done. To create a new hair style or maintain an existing hair style. It is also a place where people come to find beauty. There are haircuts, hair coloring, hair treatments, mustache or beard trimming, and other hair care services as the customer desires.",
                          style: GoogleFonts.kanit(
                            fontSize: MediaQuery.of(context).size.width * 0.035,
                            color: Colors.white,
                            shadows: [
                              Shadow(
                                color: Colors.black,
                                offset: Offset(1.0, 1.0),
                                blurRadius: 3.0,
                              ),
                            ],
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                      ).fade(duration: 3000.ms),
                    ),
                  ],
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
