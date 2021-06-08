import 'package:flutter/material.dart';
import 'package:musicplayer/widgets/music_tile.dart';
import 'package:musicplayer/widgets/trend_of_music_widget.dart';

class ExploreTab extends StatefulWidget {
  const ExploreTab({Key? key}) : super(key: key);

  @override
  _ExploreTabState createState() => _ExploreTabState();
}

class _ExploreTabState extends State<ExploreTab> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.transparent,
      body: ListView(
        children: [
          Container(
            margin: EdgeInsets.only(top: 10, left: 20),
            width: double.infinity,
            child: Text(
              "10st trend of music",
              textAlign: TextAlign.start,
              style: TextStyle(
                  color: Colors.white,
                  fontWeight: FontWeight.w600,
                  fontSize: 20),
            ),
          ),
          TrendOfMusicTile(),
          titleWidget("New Albums"),
          Container(
            // margin: EdgeInsets.symmetric(horizontal: 10),
            height: 220,
            child: ListView.builder(
              itemCount: 5,
              scrollDirection: Axis.horizontal,
              padding: EdgeInsets.all(10),
              itemBuilder: (context, index) {
                return Container(
                  margin: EdgeInsets.fromLTRB(10, 0, 10, 10),
                  height: 200,
                  width: 200,
                  decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(20),
                      color: Colors.cyan),
                );
              },
            ),
          ),
          titleWidget("Categories"),
          Container(
            height: 140,
            child: ListView.builder(
              itemCount: 6,
              scrollDirection: Axis.horizontal,
              padding: EdgeInsets.all(10),
              itemBuilder: (context, index) {
                return Container(
                  margin: EdgeInsets.fromLTRB(10, 0, 0, 0),
                  width: 100,
                  decoration: BoxDecoration(
                      shape: BoxShape.circle, color: Colors.blueAccent),
                );
              },
            ),
          ),
          titleWidget("New Music"),
          Container(
            height: 240,
            child: ListView.builder(
              padding: EdgeInsets.all(10),
              itemCount: 6,
              scrollDirection: Axis.horizontal,
              itemBuilder: (context, index) {
                return MusicTile();
              },
            ),
          ),
          titleWidget("Popular"),
          Container(
            height: 240,
            child: ListView.builder(
              padding: EdgeInsets.all(10),
              itemCount: 6,
              scrollDirection: Axis.horizontal,
              itemBuilder: (context, index) {
                return MusicTile();
              },
            ),
          ),
        ],
      ),
    );
  }

  titleWidget(String label) {
    return Container(
      margin: EdgeInsets.symmetric(horizontal: 20),
      height: 50,
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          Container(
            child: Text(
              label,
              textAlign: TextAlign.start,
              style: TextStyle(
                  color: Colors.white,
                  fontFamily: "SFProText-Bold",
                  fontWeight: FontWeight.w600,
                  fontSize: 20),
            ),
          ),
          TextButton(
            onPressed: () {},
            child: Text(
              "View All",
              textAlign: TextAlign.start,
              style: TextStyle(
                  color: Colors.white.withOpacity(0.4),
                  fontWeight: FontWeight.w500,
                  fontSize: 20),
            ),
          ),
        ],
      ),
    );
  }
}
