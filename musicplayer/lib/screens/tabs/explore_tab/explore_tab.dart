import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';

import '../../../widgets/music_tile.dart';
import '../../../widgets/trend_of_music_widget.dart';

class ExploreTab extends StatefulWidget {
  const ExploreTab({Key? key}) : super(key: key);

  @override
  _ExploreTabState createState() => _ExploreTabState();
}

class _ExploreTabState extends State<ExploreTab> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        elevation: 0,
        backgroundColor: Colors.transparent,
        centerTitle: false,
        title: Container(
          child: Image.asset(
            "assets/images/octave_logo.png",
            fit: BoxFit.fitHeight,
            alignment: Alignment.centerLeft,
            width: 120,
          ),
        ),
        actions: [
          IconButton(
            splashRadius: 20,
            onPressed: () {},
            icon: SvgPicture.asset(
              "assets/icons/bell.svg",
              color: Colors.white,
            ),
          ),
          IconButton(
            splashRadius: 20,
            onPressed: () {},
            icon: SvgPicture.asset(
              "assets/icons/content.svg",
              color: Colors.white,
            ),
          ),
        ],
      ),
      backgroundColor: Colors.transparent,
      body: ListView(
        padding: EdgeInsets.only(bottom: 80),
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
          Container(
            margin: EdgeInsets.all(20),
            child: Text(
              "Recently Played",
              textAlign: TextAlign.start,
              style: TextStyle(
                  color: Colors.white,
                  fontFamily: "SFProText-Bold",
                  fontWeight: FontWeight.w600,
                  fontSize: 20),
            ),
          ),
          Container(
            margin: EdgeInsets.symmetric(horizontal: 20),
            height: 5 * 85, //equals item count
            child: ListView.builder(
                physics: NeverScrollableScrollPhysics(),
                itemCount: 5,
                itemBuilder: (_, index) {
                  return ListTile(
                    horizontalTitleGap: 0,
                    contentPadding: EdgeInsets.symmetric(vertical: 0),
                    title: ListTile(
                      contentPadding: EdgeInsets.zero,
                      leading: Container(
                        height: 35,
                        width: 35,
                        color: Colors.pink,
                      ),
                      title: Text(
                        "Title Number ${index + 1}",
                        style: TextStyle(
                            fontSize: 20, fontWeight: FontWeight.w600),
                      ),
                      subtitle: Text(
                        "Artist ${index + 1}",
                        style: TextStyle(
                            fontSize: 16, fontWeight: FontWeight.w400),
                      ),
                    ),
                    leading: Container(
                      margin: EdgeInsets.symmetric(vertical: 10),
                      child: Text(
                        "${index + 1}",
                        style: TextStyle(
                            fontWeight: FontWeight.w400, fontSize: 16),
                      ),
                    ),
                    trailing: IconButton(
                      splashRadius: 20,
                      icon: Icon(Icons.more_horiz_rounded),
                      onPressed: () {},
                    ),
                  );
                }),
          )
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
                  fontWeight: FontWeight.w300,
                  fontSize: 16),
            ),
          ),
        ],
      ),
    );
  }
}
