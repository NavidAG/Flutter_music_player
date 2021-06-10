import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';

class NowPlayingPage extends StatefulWidget {
  const NowPlayingPage({Key? key}) : super(key: key);

  @override
  _NowPlayingPageState createState() => _NowPlayingPageState();
}

class _NowPlayingPageState extends State<NowPlayingPage> {
  double sliderValue = 0;
  final controller = PageController(
    initialPage: 0,
  );
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.transparent,
      appBar: AppBar(
        elevation: 0,
        backgroundColor: Colors.transparent,
        actions: [
          IconButton(
            onPressed: () {},
            icon: SvgPicture.asset(
              "assets/icons/gear.svg",
              color: Colors.white,
            ),
          )
        ],
      ),
      body: Column(
        children: [
          Container(
            height: 400,
            child: Expanded(
              child: PageView(
                controller: controller,
                children: [
                  MusicInfoWidget(),
                  LyricWidget(),
                  Container(
                    color: Colors.yellow,
                  ),
                ],
              ),
            ),
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceAround,
            children: [
              Container(
                // margin: EdgeInsets.all(20),
                child: Icon(Icons.share_outlined),
              ),
              Container(
                child: Icon(Icons.playlist_add),
              ),
              Container(child: Icon(Icons.favorite_outline)),
              Container(
                child: Icon(Icons.download),
              ),
            ],
          ),
          Container(
            margin: EdgeInsets.fromLTRB(10, 20, 10, 0),
            child: Slider(
              min: 0,
              max: 100,
              value: sliderValue,
              onChanged: (value) => setState(() => sliderValue = value),
              activeColor: Color.fromRGBO(141, 52, 255, 1),
            ),
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Container(
                margin: EdgeInsets.only(left: 30),
                child: Text("00:00"),
              ),
              Container(
                margin: EdgeInsets.only(right: 30),
                child: Text("05:02"),
              )
            ],
          ),
          Container(
            margin: EdgeInsets.all(20),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceAround,
              children: [
                Container(
                  // margin: EdgeInsets.all(20),
                  child: Icon(Icons.shuffle),
                ),
                Container(
                  // margin: EdgeInsets.all(20),
                  child: Icon(Icons.skip_previous),
                ),
                Container(
                  decoration: BoxDecoration(
                    border: Border.all(
                        color: Color.fromRGBO(141, 100, 255, 0.5), width: 2),
                    shape: BoxShape.circle,
                    color: Color.fromRGBO(141, 52, 255, 1),
                    boxShadow: [
                      BoxShadow(
                        color: Color.fromRGBO(141, 52, 255, 0.5),
                        spreadRadius: 2,
                        blurRadius: 3,
                        offset: Offset(0, 0), // changes position of shadow
                      ),
                    ],
                  ),
                  width: 72,
                  height: 72,
                  child: IconButton(
                    onPressed: () {},
                    icon: Icon(
                      Icons.play_arrow,
                      size: 40,
                    ),
                  ),
                ),
                Container(
                  // margin: EdgeInsets.all(20),
                  child: Icon(Icons.skip_next),
                ),
                Container(
                  // margin: EdgeInsets.all(20),
                  child: Icon(Icons.loop),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}

class MusicInfoWidget extends StatelessWidget {
  const MusicInfoWidget({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      child: Column(
        children: [
          ClipOval(
            child: Container(
              color: Colors.white,
              width: 200,
              height: 200,
            ),
          ),
          Container(
            margin: EdgeInsets.fromLTRB(20, 30, 20, 5),
            child: Text(
              "Ghalbe Banafsh",
              style: TextStyle(fontSize: 30),
            ),
          ),
          Container(
            margin: EdgeInsets.fromLTRB(20, 5, 20, 10),
            child: Text(
              "Ali Ardavan & Sepehr Khalse",
              style: TextStyle(fontSize: 16),
            ),
          ),
        ],
      ),
    );
  }
}

class LyricWidget extends StatelessWidget {
  const LyricWidget({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    List<String> texts = [
      "Cause I'm on top of the world\n",
      "I'm on top of the world\n",
      "Waiting on this for a while now\n",
      "Paying my dues to the dirt\n"
    ];
    return Center(
      child: Container(
        margin: EdgeInsets.all(20),
        child: RichText(
          overflow: TextOverflow.fade,
          textAlign: TextAlign.center,
          text: TextSpan(
              style: TextStyle(fontSize: 20, color: Colors.white24),
              children: [
                TextSpan(text: texts[0]),
                TextSpan(text: texts[1]),
                TextSpan(text: texts[2]),
                TextSpan(text: texts[3]),
                TextSpan(text: texts[0]),
                TextSpan(text: texts[0]),
                TextSpan(text: texts[1]),
                TextSpan(text: texts[2], style: TextStyle(color: Colors.white)),
                TextSpan(text: texts[3]),
                TextSpan(text: texts[0]),
                TextSpan(text: texts[0]),
                TextSpan(text: texts[1]),
                TextSpan(text: texts[2]),
                TextSpan(text: texts[3]),
                TextSpan(text: texts[0]),
              ]),
        ),
      ),
    );
  }
}
