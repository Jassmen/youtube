import 'package:flutter/material.dart';
import 'package:youtube/models/youtube_models.dart';
import 'package:youtube/screens/video_detail.dart';

class VideoList extends StatelessWidget {
  final List<YoutubeModel> listData;
  final bool isMiniList;

  const VideoList({this.listData, this.isMiniList = false});

  @override
  Widget build(BuildContext context) {
    final deviceOrientation = MediaQuery.of(context).orientation;
    return ListView.separated(
        shrinkWrap: true,
        physics: ClampingScrollPhysics(),
        itemBuilder: (context, int index) {
          if (deviceOrientation == Orientation.landscape || isMiniList) {
            return InkWell(
                onTap: () {
                  Navigator.of(context).push(MaterialPageRoute(
                      builder: (context) => VideoDetail(
                            detail: listData[index],
                          )));
                },
                child: _buildLandScapeMode(context, index));
          } else {
            return InkWell(
                onTap: () {
                  Navigator.of(context).push(MaterialPageRoute(
                      builder: (context) => VideoDetail(
                            detail: listData[index],
                          )));
                },
                child: _buildLandMode(context, index));
          }
        },
        separatorBuilder: (context, index) => Divider(
              height: 1,
              color: Colors.grey,
            ),
        itemCount: listData.length);
  }

  Widget _buildLandMode(BuildContext context, int index) {
    return Column(
      children: <Widget>[
        Container(
          width: MediaQuery.of(context).size.width,
          height: 200,
          decoration: BoxDecoration(
              image: DecorationImage(
                  image: NetworkImage(listData[index].thumbNail),
                  fit: BoxFit.cover)),
        ),
        ListTile(
          contentPadding: const EdgeInsets.all(8),
          dense: true,
          // to make size of text little more
          leading: CircleAvatar(
            backgroundImage: NetworkImage(listData[index].channelAvatar),
          ),
          title: Padding(
            padding: const EdgeInsets.only(bottom: 4),
            child: Text(listData[index].title),
          ),
          subtitle: Text('${listData[index].channelTitle} '
              '.${listData[index].viewCount} .${listData[index].publishedTime}'),
          trailing: Container(
              margin: const EdgeInsets.only(bottom: 20),
              child: Icon(Icons.more_vert)),
        )
      ],
    );
  }

  Widget _buildLandScapeMode(BuildContext context, int index) {
    return Container(
      padding: EdgeInsets.all(12),
      child: Row(
        children: <Widget>[
          Container(
            width: isMiniList
                ? MediaQuery.of(context).size.width / 2
                : 336.0 / 1.5,
            height: isMiniList ? 100 : 188.0 / 1.5,
            decoration: BoxDecoration(
                image: DecorationImage(
                    image: NetworkImage(listData[index].thumbNail),
                    fit: BoxFit.cover)),
          ),
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: <Widget>[
                ListTile(
                  contentPadding: EdgeInsets.only(left: 8, right: 8, top: 8),
                  dense: isMiniList ? true : false,
                  // coz we are on landScape mode wna it more little bit
                  title: Padding(
                    padding: const EdgeInsets.only(bottom: 4),
                    child: Text(listData[index].title),
                  ),
                  subtitle: isMiniList
                      ? Text(
                          '${listData[index].channelTitle} .${listData[index].viewCount} ')
                      : Text('${listData[index].channelTitle} '
                          '.${listData[index].viewCount} .${listData[index].publishedTime}'),
                  trailing: Container(
                      margin: const EdgeInsets.only(bottom: 10),
                      child: Icon(Icons.more_vert)),
                ),
                Container(
                    padding: EdgeInsets.only(left: 8),
                    child: isMiniList
                        ? SizedBox()
                        : CircleAvatar(
                            backgroundImage:
                                NetworkImage(listData[index].channelAvatar),
                          )),
              ],
            ),
          )
        ],
      ),
    );
  }
}
