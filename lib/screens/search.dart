import 'package:flutter/material.dart';

class SearchScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return Scaffold(
      appBar: AppBar(
          //elevation: .5,
          iconTheme: IconThemeData(color: Colors.black),
          backgroundColor: Colors.white,
          title: Container(
            //color: Colors.grey.withOpacity(.1),
            width: MediaQuery.of(context).size.width,
            decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(5),
                color: Colors.grey.withOpacity(.1)),
            child: TextField(
              decoration: InputDecoration(
                  contentPadding: EdgeInsets.symmetric(
                    horizontal: 10,
                    vertical: 10,
                  ),
                  border: InputBorder.none,
                  focusedBorder: InputBorder.none,
                  enabledBorder: InputBorder.none,
                  hintText: 'Search YouTube'),
            ),
          ),
          actions: <Widget>[
            Padding(
              padding: const EdgeInsets.all(5),
              child: Container(
                // padding: EdgeInsets.only(top: 10,bottom: 10),
                alignment: Alignment.center,
                decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(50),
                    color: Colors.grey.withOpacity(.1)),
                child: IconButton(
                  onPressed: () {},
                  icon: Icon(
                    Icons.mic_none,
                  ),
                ),
              ),
            ),
          ]),
    );
  }
}
