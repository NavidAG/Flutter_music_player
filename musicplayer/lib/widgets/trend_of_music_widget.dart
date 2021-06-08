import 'package:flutter/material.dart';

class TrendOfMusicTile extends StatefulWidget {
  const TrendOfMusicTile({Key? key}) : super(key: key);

  @override
  _TrendOfMusicTileState createState() => _TrendOfMusicTileState();
}

class _TrendOfMusicTileState extends State<TrendOfMusicTile> {
  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.fromLTRB(10, 10, 10, 40),
      margin: EdgeInsets.symmetric(horizontal: 20, vertical: 10),
      width: double.infinity,
      height: 250,
      decoration: BoxDecoration(
          color: Colors.white.withOpacity(0.2),
          borderRadius: BorderRadius.circular(20)),
      child: Column(
        children: [
          // Container(
          //   height: 44,
          //   child: ListView.builder(
          //     scrollDirection: Axis.horizontal,
          //     itemBuilder: (index, context) {
          //       return Image.asset("assets/images/trend_images/File$index.png");
          //     },
          //   ),
          // ),
          Flexible(
              child: ListView.builder(
                  scrollDirection: Axis.horizontal,
                  itemCount: 5,
                  itemBuilder: (index, context) {
                    return Image.asset(
                      "assets/images/trend_images/File1.png",
                      fit: BoxFit.fitHeight,
                    );
                  })),
          Container(
            margin: EdgeInsets.all(10),
            color: Colors.blue,
            height: 30,
            width: double.infinity,
          )
        ],
      ),
    );
  }
}
