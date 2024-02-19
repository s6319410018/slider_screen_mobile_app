import 'package:flutter/material.dart';

class SLIDER_ONE_UI extends StatefulWidget {
  const SLIDER_ONE_UI({super.key});

  @override
  State<SLIDER_ONE_UI> createState() => _SLIDER_ONE_UIState();
}

class _SLIDER_ONE_UIState extends State<SLIDER_ONE_UI> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.redAccent,
      appBar: AppBar(title: Text('Page One')),
    );
  }
}
