import 'package:flutter/material.dart';

import '../../../widgets/music_card_wiget.dart';
import 'search_page.dart';

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
          Hero(
            tag: "searchBox",
            child: Container(
              height: 50,
              margin: EdgeInsets.symmetric(horizontal: 20, vertical: 10),
              child: Material(
                color: Colors.transparent,
                child: TextField(
                  onTap: () => Navigator.push(
                    context,
                    MaterialPageRoute(
                        builder: (context) => SearchPage(),
                        fullscreenDialog: true),
                  ),
                  readOnly: true,
                  decoration: InputDecoration(
                    prefixIcon: Icon(
                      Icons.search,
                      color: Colors.black.withOpacity(0.6),
                    ),

                    focusedBorder: OutlineInputBorder(
                        borderSide:
                            BorderSide(width: 0, color: Colors.transparent),
                        borderRadius: BorderRadius.circular(40)),
                    enabledBorder: OutlineInputBorder(
                      borderSide:
                          BorderSide(width: 0, color: Colors.transparent),
                      borderRadius: BorderRadius.circular(40),
                    ),
                    hintText: 'Search',
                    fillColor: Colors.white,
                    filled: true,
                    contentPadding: EdgeInsets.only(top: 0),
                    alignLabelWithHint: true,
                    hintStyle: TextStyle(color: Colors.black),
                    // border: InputBorder.none,
                  ),
                ),
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
