import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:youtube/models/youtube_models.dart';

import '../video_list.dart';

class VideoDetail extends StatefulWidget {
  final YoutubeModel detail;

  const VideoDetail({Key key, this.detail}) : super(key: key);

  @override
  _VideoDetailState createState() => _VideoDetailState();
}

class _VideoDetailState extends State<VideoDetail> {
  @override
  Widget build(BuildContext context) {
    List<Widget> _layout = [
      _videoInfo(),
      _buildChannelInfo(),
      _moreInfo(),
      VideoList(
        listData: youtubeData,
        isMiniList: true,
      ),
    ];

    if (MediaQuery.of(context).orientation == Orientation.landscape) {
      _layout.clear();
    }

    return Scaffold(
      body: Column(
        children: <Widget>[
          _buildVideoPlayer(context),
          Expanded(
            child: ListView(
              children: _layout,
            ),
          )
        ],
      ),
    );
  }

  Widget _buildVideoPlayer(BuildContext context) {
    return Container(
        margin: MediaQuery.of(context).orientation == Orientation.landscape
            ? EdgeInsets.all(0)
            : EdgeInsets.only(top: MediaQuery.of(context).padding.top),
        width: MediaQuery.of(context).size.width,
        height: MediaQuery.of(context).orientation == Orientation.portrait
            ? 200
            : MediaQuery.of(context).size.height,
        decoration: BoxDecoration(
            image: DecorationImage(
                image: NetworkImage(widget.detail.thumbNail),
                fit: BoxFit.cover)));
  }

  Widget _videoInfo() {
    return Column(
      children: <Widget>[
        ListTile(
          title: Text(
            widget.detail.title,
            style: TextStyle(color: Colors.black),
          ),
          subtitle: Text(widget.detail.viewCount),
          trailing: Icon(Icons.arrow_drop_down),
        ),
        Padding(
          padding: const EdgeInsets.all(16.0),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: <Widget>[
              _buildButtonColumn(Icons.thumb_up, widget.detail.likeCount),
              _buildButtonColumn(Icons.thumb_down, widget.detail.likeCount),
              _buildButtonColumn(Icons.share, 'Share'),
              _buildButtonColumn(Icons.save_alt, 'Download'),
              _buildButtonColumn(Icons.playlist_add, 'Save'),
            ],
          ),
        )
      ],
    );
  }

  Widget _buildButtonColumn(IconData icon, String text) {
    return Column(
      children: <Widget>[
        Padding(
          padding: EdgeInsets.only(bottom: 8.0),
          child: Icon(
            icon,
            color: Colors.grey[700].withOpacity(.5),
          ),
        ),
        Text(text, style: TextStyle(color: Colors.grey[700].withOpacity(.5))),
      ],
    );
  }

  Widget _buildChannelInfo() {
    return Container(
      decoration: BoxDecoration(
        border: Border(
            top: BorderSide(color: Colors.grey.withOpacity(0.5), width: 0.5),
            bottom:
                BorderSide(color: Colors.grey.withOpacity(0.5), width: 0.5)),
      ),
      child: Row(
        children: <Widget>[
          Expanded(
            child: ListTile(
              leading: CircleAvatar(
                backgroundImage: NetworkImage(widget.detail.channelAvatar),
              ),
              title: Text(
                widget.detail.channelTitle,
                overflow: TextOverflow.ellipsis,
              ),
              subtitle: Text('15,0000 Subscribers'),
            ),
          ),
          FlatButton.icon(
              onPressed: () {},
              icon: Icon(Icons.play_circle_filled, color: Colors.red),
              label: Text('SUBSCRIBE', style: TextStyle(color: Colors.red)))
        ],
      ),
    );
  }

  Widget _moreInfo() {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 16.0),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: <Widget>[
          Text(
            'Up next',
          ),
          Row(
            children: <Widget>[
              Text('Autoplay'),
              Switch(onChanged: (c) {}, value: true, activeColor: Colors.blue),
            ],
          )
        ],
      ),
    );
  }
}
