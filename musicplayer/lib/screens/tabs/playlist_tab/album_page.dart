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
        color: Color.fromRGBO(31, 33, 40, 1),
        child: CustomScrollView(
          controller: _scrollController,
          slivers: <Widget>[
            SliverAppBar(
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
                  Positioned(
                      child: Image(
                        fit: BoxFit.cover,
                        image: NetworkImage(
                          "https://images.pexels.com/photos/62389/pexels-photo-62389.jpeg?auto=compress&cs=tinysrgb&dpr=2&h=750&w=1260",
                        ),
                      ),
                      top: 0,
                      left: 0,
                      right: 0,
                      bottom: 0),
                  Positioned(
                    child: Container(
                      height: 20,
                      decoration: BoxDecoration(
                        color: Color.fromRGBO(31, 33, 40, 1),
                        borderRadius: BorderRadius.vertical(
                          top: Radius.circular(25),
                        ),
                      ),
                      // child: ListTile(
                      //   horizontalTitleGap: 5,
                      //   leading: IconButton(
                      //       onPressed: () => Navigator.pop(context),
                      //       icon: Icon(Icons.close)),
                      //   title: Text(
                      //     "Album",
                      //     style: TextStyle(
                      //         fontWeight: FontWeight.w600, fontSize: 35),
                      //   ),
                      //   trailing: Container(
                      //     padding: EdgeInsets.symmetric(horizontal: 1),
                      //     width: 100,
                      //     child: Row(
                      //       children: [
                      // ElevatedButton(
                      //   style: ElevatedButton.styleFrom(
                      //       padding: EdgeInsets.zero,
                      //       minimumSize: Size(35, 35),
                      //       shape: CircleBorder(),
                      //       primary: Color.fromRGBO(141, 52, 255, 1)),
                      //   onPressed: () {},
                      //   child: Icon(
                      //     Icons.play_arrow,
                      //     size: 25,
                      //   ),
                      // ),
                      //         ElevatedButton(
                      //           style: ElevatedButton.styleFrom(
                      //               padding: EdgeInsets.zero,
                      //               minimumSize: Size(35, 35),
                      //               shape: CircleBorder(),
                      //               primary: Color.fromRGBO(141, 52, 255, 1)),
                      //           onPressed: () {},
                      //           child: Icon(
                      //             Icons.more_horiz_outlined,
                      //             size: 25,
                      //           ),
                      //         )
                      //       ],
                      //     ),
                      //   ),
                      // ),
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

              backgroundColor: Color.fromRGBO(31, 33, 40, 1),
            ),
            SliverFixedExtentList(
              itemExtent: 50.0,
              delegate: SliverChildBuilderDelegate(
                (BuildContext context, int index) {
                  return Container(
                    alignment: Alignment.center,
                    child: Text('List Item $index'),
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
