import 'package:audioplayers/audioplayers.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:slider_screen/views/slider/slider_one_UI.dart';
import 'package:slider_screen/views/slider/slider_three_UI.dart';
import 'package:slider_screen/views/slider/slider_two_UI.dart';

class SLIDER_UI extends StatefulWidget {
  const SLIDER_UI({Key? key}) : super(key: key);

  @override
  State<SLIDER_UI> createState() => _SLIDER_UIState();
}

class _SLIDER_UIState extends State<SLIDER_UI> {
  final List<Widget> pages = [
    SLIDER_ONE_UI(),
    SLIDER_TWO_UI(),
    SLIDER_THREE_UI(),
  ];

  int _currentPage = 0;
  final PageController _pageController = PageController(initialPage: 0);
  final ScrollController _scrollController = ScrollController();
  //final player = AudioPlayer();

  Widget buildIndicator(int index) {
    return AnimatedContainer(
      duration: Duration(milliseconds: 1000),
      width: MediaQuery.of(context).size.width * 0.04,
      height: MediaQuery.of(context).size.height * 0.04,
      margin: EdgeInsets.symmetric(horizontal: 4),
      decoration: BoxDecoration(
        shape: BoxShape.circle,
        color: _currentPage == index ? Colors.white : Colors.grey,
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    SystemChrome.setPreferredOrientations([
      DeviceOrientation.portraitUp,
      DeviceOrientation.portraitDown,
    ]);
    return Scaffold(
      body: SingleChildScrollView(
        controller: _scrollController,
        child: Container(
          height: MediaQuery.of(context).size.height,
          child: Stack(
            children: [
              Positioned(
                top: 0,
                bottom: 0,
                left: 0,
                right: 0,
                child: PageView.builder(
                  itemCount: pages.length,
                  controller: _pageController,
                  onPageChanged: (value) {
                    setState(() {
                      _currentPage = value;
                    });
                  },
                  itemBuilder: (context, index) {
                    //player.play(AssetSource('assets/audio/sound_bg.mp3'));
                    return pages[index];
                  },
                ),
              ),
              Positioned(
                left: 0,
                right: 0,
                bottom: MediaQuery.of(context).size.height * 0.002,
                child: Container(
                  color: Colors.transparent,
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: List.generate(
                      pages.length,
                      (index) => buildIndicator(index),
                    ),
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
