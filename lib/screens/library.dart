import 'package:flutter/material.dart';

class LibraryScreen extends StatefulWidget {
  @override
  _LibraryScreenState createState() => _LibraryScreenState();
}

class _LibraryScreenState extends State<LibraryScreen> {
  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: Column(
        children: <Widget>[
          _buildListTailRow(Icons.history, 'History', ''),
          _buildListTailRow(Icons.slideshow, 'Your videos', ''),
          _buildListTailRow(Icons.file_download, 'Downloads', '1 video',
              icon2: Icons.check_circle),
          _buildListTailRow(Icons.local_movies, 'Your movies', ''),
          Container(
              decoration: BoxDecoration(
                  border: Border(
                      bottom: BorderSide(
                          width: 1, color: Colors.grey.withOpacity(0.5)))),
              child: _buildListTailRow(
                  Icons.access_time, 'Watch later', '5 unwatched videos')),
          Padding(
            padding: const EdgeInsets.all(15),
            child: Row(
              children: <Widget>[
                Expanded(child: Text('Playlist')),
                Text('Recently added'),
                Icon(Icons.keyboard_arrow_down),
              ],
            ),
          ),
          _buildListTailRow(Icons.add, 'New playlist', '', blueColor: true),
          _buildListTailRow(Icons.thumb_up, 'Liked video', '104 videos'),
        ],
      ),
    );
  }

  Widget _buildListTailRow(IconData icon, String title, String subTitle,
      {IconData icon2, bool blueColor = false}) {
    return ListTile(
      leading: Icon(
        icon,
        color: blueColor ? Color(0xF1185CE7) : Colors.black,
      ),
      title: blueColor
          ? Text(
              title,
              style: TextStyle(color: Color(0xF1185CE7)),
            )
          : Text(
              title,
            ),
      subtitle: Text(subTitle),
      trailing: Icon(
        icon2,
        color: Colors.black,
      ),
    );
  }
}
