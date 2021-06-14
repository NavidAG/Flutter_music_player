import 'dart:ui';

import 'package:flutter/material.dart';

class AlbumPage extends StatefulWidget {
  const AlbumPage({Key? key}) : super(key: key);

  @override
  _AlbumPageState createState() => _AlbumPageState();
}

class _AlbumPageState extends State<AlbumPage> {
  ScrollController _scrollController = ScrollController();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        decoration: BoxDecoration(
          gradient: LinearGradient(
            begin: Alignment.topLeft,
            end: Alignment.bottomRight,
            colors: [
              Color.fromRGBO(41, 21, 107, 1),
              Color.fromRGBO(41, 21, 107, 1),
              Color.fromRGBO(31, 33, 40, 1)
            ],
          ),
        ),
        child: CustomScrollView(
          controller: _scrollController,
          slivers: <Widget>[
            SliverAppBar(
              backgroundColor: Colors.black,
              elevation: 0,

              // actions: <Widget>[
              //   IconButton(icon: Icon(Icons.favorite), onPressed: () {}),
              //   IconButton(icon: Icon(Icons.share), onPressed: () {})
              // ],
              bottom: PreferredSize(
                child: Container(),
                preferredSize: Size(0, 20),
              ),
              pinned: true,

              expandedHeight: 350,
              flexibleSpace: Stack(
                children: [
                  Container(
                    decoration: BoxDecoration(
                      image: DecorationImage(
                          image: NetworkImage(
                              "https://images.pexels.com/photos/62389/pexels-photo-62389.jpeg?auto=compress&cs=tinysrgb&dpr=2&h=750&w=1260"),
                          fit: BoxFit.cover),
                    ),
                    child: BackdropFilter(
                      filter: ImageFilter.blur(sigmaX: 10.0, sigmaY: 10.0),
                      child: Container(
                        decoration:
                            BoxDecoration(color: Colors.white.withOpacity(0.0)),
                      ),
                    ),
                  ),
                  Center(
                    child: Container(
                      child: FlexibleSpaceBar(
                        background: Image(
                          fit: BoxFit.fitHeight,
                          image: NetworkImage(
                            "https://images.pexels.com/photos/62389/pexels-photo-62389.jpeg?auto=compress&cs=tinysrgb&dpr=2&h=750&w=1260",
                          ),
                        ),
                      ),
                    ),
                  ),
                  Positioned(
                    child: Container(
                      height: 20,
                      decoration: BoxDecoration(
                        color: Color.fromRGBO(41, 21, 107, 1),
                        borderRadius: BorderRadius.vertical(
                          top: Radius.circular(30),
                        ),
                      ),
                    ),
                    bottom: -1,
                    left: 0,
                    right: 0,
                  ),
                ],
              ),
            ),
            SliverAppBar(
              // toolbarHeight: 0,
              elevation: 0,
              pinned: true,
              backgroundColor: Color.fromRGBO(41, 21, 107, 1),
              leading: Container(
                width: 1,
                height: 1,
              ),

              flexibleSpace: Padding(
                padding: const EdgeInsets.symmetric(horizontal: 30),
                child: Row(
                  children: [
                    Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Text(
                          "Name of the Album",
                          style: TextStyle(
                              fontWeight: FontWeight.w600, fontSize: 20),
                        ),
                        Text(
                          "Name of the Artist",
                          style: TextStyle(
                              fontWeight: FontWeight.w400, fontSize: 16),
                        ),
                      ],
                    ),
                    Spacer(),
                    Padding(
                      padding: EdgeInsets.symmetric(horizontal: 5),
                      child: ElevatedButton(
                        style: ElevatedButton.styleFrom(
                            padding: EdgeInsets.zero,
                            minimumSize: Size(40, 40),
                            shape: CircleBorder(),
                            primary: Color.fromRGBO(141, 52, 255, 1)),
                        onPressed: () {},
                        child: Icon(
                          Icons.play_arrow,
                          size: 30,
                        ),
                      ),
                    ),
                    Padding(
                      padding: EdgeInsets.symmetric(horizontal: 5),
                      child: ElevatedButton(
                        style: ElevatedButton.styleFrom(
                            padding: EdgeInsets.zero,
                            minimumSize: Size(40, 40),
                            shape: CircleBorder(),
                            primary: Color.fromRGBO(141, 52, 255, 1)),
                        onPressed: () {},
                        child: Icon(
                          Icons.play_arrow,
                          size: 30,
                        ),
                      ),
                    ),
                  ],
                ),
              ),
              bottom:
                  PreferredSize(child: Container(), preferredSize: Size(0, 0)),
            ),
            SliverFillRemaining(
              child: ListView.separated(
                padding: EdgeInsets.symmetric(horizontal: 20),
                itemCount: 50,
                //shrinkWrap: true,
                physics: NeverScrollableScrollPhysics(),
                //padding: EdgeInsets.all(0),
                separatorBuilder: (BuildContext context, int index) {
                  return Divider(
                    height: 5,
                    thickness: 1,
                  );
                },
                itemBuilder: (BuildContext context, int index) {
                  return Material(
                    color: Colors.transparent,
                    child: ListTile(
                      onTap: () {},
                      leading: Icon(Icons.play_arrow),
                      title: Text("Music number $index"),
                      trailing: TextButton(
                        style: TextButton.styleFrom(
                          padding: EdgeInsets.zero,
                          minimumSize: Size(30, 30),
                          shape: CircleBorder(),
                        ),
                        child: Icon(
                          Icons.more_horiz_outlined,
                          color: Colors.white,
                        ),
                        onPressed: () {},
                      ),
                    ),
                  );
                },
              ),
            ),
          ],
        ),
      ),
    );
  }
}
