import 'dart:ui';

import 'package:flutter/material.dart';
import 'package:youtube/screens/notification.dart';

class TurnOnNotifications extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    NotificationScreen routeScreen = NotificationScreen();
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.white,
        iconTheme: IconThemeData(color: Colors.black.withOpacity(.7)),
        title: Text(
          'Settings',
          style: TextStyle(color: Colors.black),
        ),
        leading: IconButton(
          onPressed: () {
            Navigator.pop(context,
                MaterialPageRoute(builder: (context) => TurnOnNotifications()));
            Navigator.push(context,
                MaterialPageRoute(builder: (context) => NotificationScreen()));
          },
          icon: Icon(Icons.arrow_back_ios),
          color: Colors.green,
        ),
      ),
      body: SingleChildScrollView(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            SizedBox(
              height: 20,
            ),
            Container(
              width: 45,
              height: 45,
              alignment: Alignment.center,
              decoration: BoxDecoration(boxShadow: [
                BoxShadow(
                    color: Colors.grey.withOpacity(.1),
                    spreadRadius: 2,
                    blurRadius: 5,
                    offset: Offset(0, 3))
              ], borderRadius: BorderRadius.circular(30), color: Colors.white),
              child: CircleAvatar(
                backgroundColor: Colors.white.withOpacity(.1),
                radius: 20,
                child: Image.asset('assets/youtube.png'),
              ),
            ),
            SizedBox(
              height: 20,
            ),
            Text(
              'YouTube',
              style: TextStyle(fontSize: 20, fontWeight: FontWeight.w800),
            ),
            Container(
              padding: EdgeInsets.all(10),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: <Widget>[
                  Text(
                    'Show notifications',
                    style: TextStyle(fontSize: 16, fontWeight: FontWeight.w500),
                  ),
                  Switch(
                    value: false,
                  ),
                ],
              ),
            ),
            ListTile(
              leading: Icon(Icons.error_outline),
              subtitle: Text(
                  'At your request, Android is blocking this\napp\' notifications from appearing on this\ndevice'),
            )
          ],
        ),
      ),
    );
  }
}
