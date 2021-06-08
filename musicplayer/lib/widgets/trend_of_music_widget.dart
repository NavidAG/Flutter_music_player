import 'package:flutter/material.dart';

class TrendOfMusicTile extends StatefulWidget {
  const TrendOfMusicTile({Key? key}) : super(key: key);

  @override
  _TrendOfMusicTileState createState() => _TrendOfMusicTileState();
}

class _TrendOfMusicTileState extends State<TrendOfMusicTile> {
  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        Container(
          padding: EdgeInsets.fromLTRB(20, 20, 20, 40),
          margin: EdgeInsets.fromLTRB(20, 10, 20, 40),
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
                child: ClipRRect(
                  borderRadius: BorderRadius.circular(20),
                  child: ListView.builder(
                    physics: NeverScrollableScrollPhysics(),
                    scrollDirection: Axis.horizontal,
                    itemCount: 10,
                    itemBuilder: (context, index) {
                      return Container(
                        margin: EdgeInsets.all(1),
                        color: Colors.red,
                        height: 100,
                        width: (MediaQuery.of(context).size.width - 100) / 10,
                      );
                    },
                  ),
                ),
              ),
              Container(
                margin: EdgeInsets.all(10),
                color: Colors.blue,
                height: 30,
                width: double.infinity,
              )
            ],
          ),
        ),
        Positioned(
            right: 30,
            bottom: 15,
            child: ElevatedButton(
              style: ElevatedButton.styleFrom(
                  minimumSize: Size(45, 45),
                  shape: CircleBorder(),
                  primary: Color.fromRGBO(141, 52, 255, 1)),
              onPressed: () {},
              child: Icon(
                Icons.play_arrow,
                size: 30,
              ),
            ))
      ],
    );
  }
}
