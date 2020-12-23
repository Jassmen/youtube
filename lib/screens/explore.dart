import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:youtube/models/youtube_models.dart';
import 'package:youtube/video_list.dart';

class ExploreScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return ListView(
      children: <Widget>[
        Container(
          height: 100,
          child: ListView(
            scrollDirection: Axis.horizontal,
            children: <Widget>[
              _buildButtonColumn(Icons.music_note, 'Music'),
              _buildButtonColumn(Icons.live_tv, 'Live'),
              _buildButtonColumn(Icons.videogame_asset, 'Gaming'),
              _buildButtonColumn(Icons.insert_drive_file, 'News'),
              _buildButtonColumn(Icons.local_movies, 'Films'),
            ],
          ),
        ),
        VideoList(
          listData: youtubeData,
        ),
      ],
    );
  }

  Widget _buildButtonColumn(IconData icon, String text) {
    return Padding(
      padding: const EdgeInsets.all(10),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: <Widget>[
          Container(
            width: 50,
            height: 50,
            decoration: BoxDecoration(
                color: Color.fromRGBO(0, 0, 0, 0.7), shape: BoxShape.circle),
            child: Padding(
              padding: EdgeInsets.only(bottom: 8.0),
              child: Icon(
                icon,
                color: Colors.white,
                size: 30,
              ),
            ),
          ),
          Text(text, style: TextStyle(color: Colors.grey[700])),
        ],
      ),
    );
  }
}
