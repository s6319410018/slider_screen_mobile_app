import 'package:flutter/material.dart';

class SLIDER_TWO_UI extends StatefulWidget {
  const SLIDER_TWO_UI({super.key});

  @override
  State<SLIDER_TWO_UI> createState() => _SLIDER_TWO_UIState();
}

class _SLIDER_TWO_UIState extends State<SLIDER_TWO_UI> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.amber,
      appBar: AppBar(title: Text('Page Two')),
    );
  }
}
