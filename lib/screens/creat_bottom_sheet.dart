import 'package:flutter/material.dart';

class CreateBottomSheet {
  int x = 0;

  CreateBottomSheet(BuildContext context) {
    showModalBottomSheet(
      shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.vertical(top: Radius.circular(20.0))),
      backgroundColor: Colors.white,
      context: context,
      isScrollControlled: true,
      builder: (context) => Padding(
          padding: const EdgeInsets.symmetric(horizontal: 18),
          child: Text("Dummy Text")),
    );
  }
}

/*class CreateBottomSheet extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: (){
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
      },
      child: Text('Hello...'),

    );

  }

   _showModelBottomSheet(BuildContext context){
    showModalBottomSheet(context: context, builder: (context) => Container(
      height: 300,
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius:BorderRadius.only(topRight: Radius.circular(20),topLeft: Radius.circular(20)),
      ),
      */ /*child: Column(
        children: <Widget>[
          ListTile(
            title: Text('Create'),
            trailing: Icon(Icons.close),
          ),
          Text('Create'),
          ListTile(
            title: Text('Create'),
            leading: Icon(Icons.file_upload),
          ),
          ListTile(
            title: Text('Upload a video'),
            trailing: Icon(Icons.close),
          ),
        ],
      ),*/ /*

    ));
  }
}*/
