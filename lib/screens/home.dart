import 'package:flutter/material.dart';
import 'package:youtube/models/youtube_models.dart';

import '../video_list.dart';

class HomeScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return VideoList(
      listData: youtubeData,
    );
  }
}
