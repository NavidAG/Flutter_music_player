import 'package:flutter/material.dart';
import 'package:musicplayer/widgets/music_card_wiget.dart';

class SearchTab extends StatefulWidget {
  const SearchTab({Key? key}) : super(key: key);

  @override
  _SearchTabState createState() => _SearchTabState();
}

class _SearchTabState extends State<SearchTab> {
  var sectionLabels = [
    "Recent Search",
    "Artists",
    "Songs",
    "Albums",
    "Podcasts"
  ];
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.transparent,
      appBar: AppBar(
        elevation: 0,
        backgroundColor: Colors.transparent,
        title: Container(
          margin: EdgeInsets.all(20),
          child: Text("Search"),
        ),
        centerTitle: false,
      ),
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Container(
            padding: EdgeInsets.zero,
            margin: EdgeInsets.fromLTRB(24, 10, 24, 10),
            height: 50,
            // width: 312,
            decoration: BoxDecoration(
              color: Colors.white,
              borderRadius: BorderRadius.circular(100),
            ),
            child: TextField(
              style: TextStyle(
                color: Colors.black,
              ),
              decoration: InputDecoration(
                fillColor: Colors.black,
                hintText: "Search",
                hintStyle: TextStyle(color: Colors.black),
                prefixIcon: Icon(
                  Icons.search,
                  color: Colors.black,
                ),
                border: InputBorder.none,
              ),
            ),
          ),
          Container(
            margin: EdgeInsets.all(20),
            child: Text(
              "Your Top Genres",
              style: TextStyle(fontSize: 20),
            ),
          ),
          Container(
            child: Expanded(
              child: GridView.count(
                crossAxisCount: 2,
                mainAxisSpacing: 20,
                crossAxisSpacing: 20,
                children: [
                  MusicCardWidget(
                    musicTypeName: "pop",
                  ),
                  MusicCardWidget(
                    musicTypeName: "pop",
                  ),
                  MusicCardWidget(
                    musicTypeName: "pop",
                  ),
                  MusicCardWidget(
                    musicTypeName: "pop",
                  ),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}
