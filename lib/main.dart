import 'package:flutter/material.dart';
import 'package:meditation_app_ui/provider/music/music.dart';
import 'package:meditation_app_ui/screens/music/music_screen.dart';
import 'package:provider/provider.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider<MusicState>(
      create: (context) => MusicState(),
      child: MaterialApp(
        title: 'Meditation App',
        debugShowCheckedModeBanner: false,
        theme: ThemeData(
          visualDensity: VisualDensity.adaptivePlatformDensity,
        ),
        home: MusicScreen(),
      ),
    );
  }
}
