import 'package:flutter/material.dart';

class MusicTile extends StatelessWidget {
  const MusicTile({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        Container(
          margin: EdgeInsets.fromLTRB(10, 0, 10, 0),
          height: 160,
          width: 160,
          decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(20), color: Colors.yellow),
        ),
        Positioned(
          right: 10,
          bottom: 32,
          child: ElevatedButton(
            style: ElevatedButton.styleFrom(
              minimumSize: Size(45, 45),
              shape: CircleBorder(),
              primary: Color.fromRGBO(141, 52, 255, 1),
            ),
            onPressed: () {},
            child: Icon(
              Icons.play_arrow,
              size: 30,
            ),
          ),
        ),
        Positioned(
          bottom: 32,
          left: 12,
          child: Container(
            child: Text(
              "Music Name",
              style: TextStyle(fontWeight: FontWeight.w700, fontSize: 14),
            ),
          ),
        ),
        Positioned(
          bottom: 14,
          left: 12,
          child: Container(
            child: Text(
              "Artist Name",
              style: TextStyle(fontWeight: FontWeight.w300, fontSize: 12),
            ),
          ),
        )
      ],
    );
  }
}
