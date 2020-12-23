import 'package:bubble_tab_indicator/bubble_tab_indicator.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:youtube/models/youtube_models.dart';

import '../video_list.dart';

class SubscriptionScreen extends StatefulWidget {
  final List<YoutubeModel> detail;

  const SubscriptionScreen({Key key, this.detail}) : super(key: key);

  @override
  _SubscriptionScreenState createState() => _SubscriptionScreenState();
}

class _SubscriptionScreenState extends State<SubscriptionScreen>
    with TickerProviderStateMixin {
  final List<Tab> tabs = <Tab>[
    /* Tab(child:Container(
      height: 35,

      decoration: BoxDecoration(borderRadius: BorderRadius.circular(35.0),color: Colors.grey),
      child: Align(
        child: Text("All"),
        alignment: Alignment.center,
      ),
    ),),
    Tab(child:Container(
      height: 35,
      width: 60,
      decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(35.0),color: Colors.grey.withOpacity(0.8)),
      child: Align(
        child: Text("Today"),
        alignment: Alignment.center,
      ),
    ),),
    Tab(child:Container(
      height: 35,
      width: 60,
      decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(35.0),color: Colors.grey.withOpacity(0.8)),
      child: Align(
        child: Text("Continue watching"),
        alignment: Alignment.center,
      ),
    ),),
    Tab(child:Container(
      height: 35,
      width: 60,
      decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(35.0),color: Colors.grey.withOpacity(0.8)),
      child: Align(
        child: Text("Unwatched"),
        alignment: Alignment.center,
      ),
    ),),
    Tab(child:Container(
      height: 35,
      width: 60,
      decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(35.0),color: Colors.grey.withOpacity(0.8)),
      child: Align(
        child: Text("Live"),
        alignment: Alignment.center,
      ),
    ),),
    Tab(child:Container(
      height: 35,
      width: 60,
      decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(35.0),color: Colors.grey.withOpacity(0.8)),
      child: Align(
        child: Text("Posts"),
        alignment: Alignment.center,
      ),
    ),),
    Tab(child:Container(
      height: 35,
      width: 60,
      decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(35.0),color: Colors.grey.withOpacity(0.8)),
      child: Align(
        child: Text("SETTINGS"),
        alignment: Alignment.center,
      ),
    ),),*/

    Tab(
      text: 'ALL',
    ),
    Tab(
      text: 'Continue watching',
    ),
    Tab(
      text: 'Unwatched',
    ),
    Tab(
      text: 'Live',
    ),
    Tab(
      text: 'Posts',
    ),
    Tab(
      text: 'SETTINGS',
    ),
  ];

  TabController _tabController;

  @override
  void initState() {
    super.initState();
    _tabController = TabController(vsync: this, length: tabs.length);
  }

  @override
  Widget build(BuildContext context) {
    return ListView(
      children: <Widget>[
        _buildSubscriptionChannel(),
        _buildMenuRow(),
        VideoList(
          listData: widget.detail,
        )
      ],
    );
  }

  Widget _buildSubscriptionChannel() {
    return Container(
      padding: EdgeInsets.only(top: 10),
      decoration: BoxDecoration(
          border: Border(
              bottom:
                  BorderSide(width: 1, color: Colors.grey.withOpacity(0.5)))),
      child: Row(
        children: <Widget>[
          Expanded(
            child: Container(
              height: 100,
              child: ListView(
                scrollDirection: Axis.horizontal,
                shrinkWrap: true,
                children: <Widget>[
                  _buildButtonColumn(
                      NetworkImage(widget.detail[0].channelAvatar),
                      widget.detail[0].channelTitle),
                  _buildButtonColumn(
                      NetworkImage(widget.detail[1].channelAvatar),
                      widget.detail[1].channelTitle),
                  _buildButtonColumn(
                      NetworkImage(widget.detail[2].channelAvatar),
                      widget.detail[2].channelTitle),
                  _buildButtonColumn(
                      NetworkImage(widget.detail[0].channelAvatar),
                      widget.detail[0].channelTitle),
                  _buildButtonColumn(
                      NetworkImage(widget.detail[1].channelAvatar),
                      widget.detail[1].channelTitle),
                  _buildButtonColumn(
                      NetworkImage(widget.detail[2].channelAvatar),
                      widget.detail[2].channelTitle),
                  _buildButtonColumn(
                      NetworkImage(widget.detail[2].channelAvatar),
                      widget.detail[2].channelTitle),
                ],
              ),
            ),
          ),
          Container(
            height: 100,
            width: 50,
            //color: Colors.red,
            alignment: Alignment.center,
            child: Text('ALL', style: (TextStyle(color: Color(0xF1185CE7)))),
          )
        ],
      ),
    );
  }

  Widget _buildButtonColumn(NetworkImage icon, String text) {
    return Padding(
      padding: const EdgeInsets.all(5),
      child: Column(
        children: <Widget>[
          Container(
            width: 60,
            height: 60,
            child: CircleAvatar(
              backgroundImage: icon,
            ),
          ),
          Container(
              width: 70,
              padding: const EdgeInsets.only(top: 8.0),
              child: Text(
                text,
                style: TextStyle(color: Colors.grey[700]),
                overflow: TextOverflow.ellipsis,
              )),
        ],
      ),
    );
  }

  Widget _buildMenuRow() {
    return Container(
      width: MediaQuery.of(context).size.width,
      height: 50,
      decoration: BoxDecoration(
        border: Border(
            bottom: BorderSide(width: 1, color: Colors.grey.withOpacity(.5))),
      ),
      child: TabBar(
        isScrollable: true,
        unselectedLabelColor: Colors.black,
        labelColor: Colors.white,
        indicatorSize: TabBarIndicatorSize.tab,
        indicator: BubbleTabIndicator(
            indicatorHeight: 35,
            indicatorRadius: 25,
            indicatorColor: Color(0xFF575C66),
            tabBarIndicatorSize: TabBarIndicatorSize.tab),
        tabs: tabs,
        controller: _tabController,
      ),
    );
  }
}
