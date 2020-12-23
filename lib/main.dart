import 'package:flutter/material.dart';
import 'package:youtube/youtube_main.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      // title: 'Youtube',
      debugShowCheckedModeBanner: false,
      home: YoutubeMain(),
    );
  }
}
