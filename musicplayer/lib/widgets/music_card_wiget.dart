import 'package:flutter/material.dart';

class MusicCardWidget extends StatelessWidget {
  final String musicTypeName;
  const MusicCardWidget({Key? key, required this.musicTypeName})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.fromLTRB(10, 10, 10, 10),
      child: Container(
          color: Colors.red,
          height: 20,
          width: 20,
          child: Container(
            margin: EdgeInsets.only(top: 10, left: 10),
            child: Text(
              musicTypeName,
              style: TextStyle(fontSize: 20),
            ),
          )),
    );
  }
}
