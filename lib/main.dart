import 'package:flutter/material.dart';
import 'package:music_app/screens/music_screen2.dart';
import 'screens/home_screen.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      initialRoute: 'home_screen',
      routes: {
        'music_screen': (context) => MusicScreen2(),
        'home_screen' : (context) => Home(),
      },
    );
  }
}
