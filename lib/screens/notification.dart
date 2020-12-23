import 'package:flutter/material.dart';
import 'package:youtube/screens/turn_on_notifications.dart';

class NotificationScreen extends StatelessWidget {
  static String route = './notification';

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        iconTheme: IconThemeData(color: Colors.black.withOpacity(.7)),
        backgroundColor: Colors.white,
        title: Text(
          'Notification',
          style: TextStyle(color: Colors.black),
        ),
        actions: <Widget>[
          IconButton(
            onPressed: () {},
            icon: Icon(Icons.cast),
          ),
          IconButton(
            onPressed: () {},
            icon: Icon(Icons.search),
          ),
          IconButton(
            onPressed: () {},
            icon: Icon(Icons.more_vert),
          ),
        ],
      ),
      body: Column(
        // mainAxisAlignment: MainAxisAlignment.center,
        children: <Widget>[
          SizedBox(
            height: 50,
          ),
          Container(
              width: MediaQuery.of(context).size.width,
              height: 150,
              child: Icon(
                Icons.notifications,
                size: 120,
                color: Colors.grey.withOpacity(.5),
              )),
          SizedBox(
            height: 20,
          ),
          Text(
            'Your notifications live here',
            style: TextStyle(
                color: Colors.black, fontSize: 20, fontWeight: FontWeight.w600),
          ),
          SizedBox(
            height: 5,
          ),
          Text(
            ' Don\'t miss the latest videos and',
            style:
                TextStyle(color: Colors.black87.withOpacity(.6), fontSize: 16),
          ),
          SizedBox(
            height: 5,
          ),
          Text(
            'more form your favorite channels.',
            style:
                TextStyle(color: Colors.black87.withOpacity(.5), fontSize: 16),
          ),
          SizedBox(height: 20),
          FlatButton(
            onPressed: () {
              Navigator.push(
                  context,
                  MaterialPageRoute(
                      builder: (context) => TurnOnNotifications()));
            },
            child: Text(
              'TURN ON NOTIFICATIONS',
              style: TextStyle(color: Colors.white),
            ),
            color: Color(0xF1185CE7),
          )
        ],
      ),
    );
  }
}
