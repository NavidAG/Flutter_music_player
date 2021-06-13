import 'package:flutter/foundation.dart';
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
    return Padding(
      padding: EdgeInsets.only(bottom: 80),
      child: Scaffold(
        backgroundColor: Colors.transparent,
        appBar: AppBar(
          elevation: 0,
          backgroundColor: Colors.transparent,
          title: Text("Search"),
          centerTitle: false,
        ),
        body: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Hero(
              tag: "searchBox",
              child: Container(
                height: 50,
                margin: EdgeInsets.symmetric(horizontal: 20, vertical: 20),
                child: Material(
                  color: Colors.transparent,
                  child: Container(
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
                  mainAxisSpacing: 0,
                  crossAxisSpacing: 0,
                  children: [
                    CustomPaint(
                      size: Size(20, (20 * 1.0).toDouble()),
                      painter: MusicCardWidget(
                        colors: [Colors.red, Colors.black],
                      ),
                    ),
                    Stack(
                      alignment: Alignment.topLeft,
                      children: [
                        Container(
                          width: double.infinity,
                          height: double.infinity,
                        ),
                        CustomPaint(
                          size: Size(
                              MediaQuery.of(context).size.width / 2,
                              MediaQuery.of(context).size.width /
                                  2), //You can Replace [WIDTH] with your desired width for Custom Paint and height will be calculated automatically
                          painter: MusicCardWidget(
                            colors: [Colors.red, Colors.black],
                          ),
                        ),
                        Container(
                          margin: EdgeInsets.only(left: 30, top: 30),
                          child: Text(
                            "Pop",
                            style: TextStyle(fontSize: 20),
                          ),
                        )
                      ],
                    ),
                    CustomPaint(
                      size: Size(20, (20 * 1.0).toDouble()),
                      painter: MusicCardWidget(
                        colors: [Colors.red, Colors.orange],
                      ),
                    ),
                    CustomPaint(
                      size: Size(20, (20 * 1.0).toDouble()),
                      painter: MusicCardWidget(
                        colors: [Colors.red, Colors.orange],
                      ),
                    ),
                  ],
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
