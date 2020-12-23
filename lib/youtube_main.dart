import 'package:flutter/material.dart';
import 'package:youtube/screens/explore.dart';
import 'package:youtube/screens/home.dart';
import 'package:youtube/screens/library.dart';
import 'package:youtube/screens/notification.dart';
import 'package:youtube/screens/search.dart';
import 'package:youtube/screens/subscriptions.dart';

import 'models/youtube_models.dart';

class YoutubeMain extends StatefulWidget {
  @override
  _YoutubeMainState createState() => _YoutubeMainState();
}

BuildContext context;
List<Widget> _screens = [
  HomeScreen(),
  ExploreScreen(),
  //CreateBottomSheet(context),
  HomeScreen(),
  SubscriptionScreen(
    detail: youtubeData,
  ),
  LibraryScreen(),
  //SearchScreen(),
  // NotificationScreen(),
];

/*CreateBottomSheet2(BuildContext context) {

  showModalBottomSheet(
    shape: RoundedRectangleBorder(
        borderRadius:
        BorderRadius.vertical(top: Radius.circular(20.0))),
    backgroundColor: Colors.white,
    context: context,
    isScrollControlled: true,
    builder: (context) => Padding(
        padding: const EdgeInsets.symmetric(horizontal: 18),
        child: Text("Dummy Text")),
  );
}*/
class _YoutubeMainState extends State<YoutubeMain> {
  //final white= Colors.white;
  bool darkThem = false;

  int _currentIndex = 0;

  void _onTapped(int index) {
    setState(() {
      _currentIndex = index;
      /*if(index == 2){
        showModalBottomSheet(
          shape: RoundedRectangleBorder(
              borderRadius:
              BorderRadius.vertical(top: Radius.circular(20.0))),
          backgroundColor: Colors.white,
          context: context,
          isScrollControlled: true,
          builder: (context) => Container(
              height: 300,
              padding: const EdgeInsets.symmetric(horizontal: 18),
              child: Text("Dummy Text")),
        );
      }*/
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: darkThem ? Colors.black54 : Colors.white,
        iconTheme:
            IconThemeData(color: darkThem ? Colors.white : Colors.black54),
        title: Image.asset(
          'assets/youtube_logo.png',
          width: 98,
          height: 22,
        ),
        actions: <Widget>[
          IconButton(
            icon: Icon(Icons.cast),
            onPressed: () {},
          ),
          IconButton(
              icon: Icon(Icons.notifications_none),
              onPressed: () {
                setState(() {
                  Navigator.push(
                      context,
                      MaterialPageRoute(
                          builder: (context) => NotificationScreen()));
                });
              }),
          IconButton(
              icon: Icon(Icons.search),
              onPressed: () {
                setState(() {
                  Navigator.push(context,
                      MaterialPageRoute(builder: (context) => SearchScreen()));
                });
              }),
          IconButton(icon: Icon(Icons.account_circle), onPressed: () {})
        ],
      ),
      body: _screens[_currentIndex],
      bottomNavigationBar: BottomNavigationBar(
        currentIndex: _currentIndex,
        type: BottomNavigationBarType.fixed,
        fixedColor: Colors.redAccent,
        onTap: _onTapped,
        items: [
          BottomNavigationBarItem(
              title: Text(
                'Home',
              ),
              icon: Icon(
                Icons.home,
              )),
          BottomNavigationBarItem(
              title: Text('Explore'), icon: Icon(Icons.explore)),
          BottomNavigationBarItem(
            title: Text(''),
            icon: Icon(
              Icons.add_circle_outline,
              size: 35,
            ),
          ),
          //IconButton(icon:Icon(Icons.add_circle_outline),
          BottomNavigationBarItem(
              title: Text(
                'Subscriptions',
                style: TextStyle(fontSize: 10),
              ),
              icon: Icon(
                Icons.subscriptions,
              )),
          BottomNavigationBarItem(
              title: Text('Library'), icon: Icon(Icons.video_library)),
        ],
      ),
    );
  }
}
