import 'package:flutter/material.dart';

class SLIDER_THREE_UI extends StatefulWidget {
  const SLIDER_THREE_UI({super.key});

  @override
  State<SLIDER_THREE_UI> createState() => _SLIDER_THREE_UIState();
}

class _SLIDER_THREE_UIState extends State<SLIDER_THREE_UI> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.blueAccent,
      appBar: AppBar(
        title: Text('Page Three'),
      ),
    );
  }
}
