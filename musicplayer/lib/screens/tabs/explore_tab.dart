import 'package:flutter/material.dart';
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
      body: SingleChildScrollView(
        child: Column(
          children: [
            Container(
              margin: EdgeInsets.fromLTRB(20, 10, 0, 0),
              width: double.infinity,
              child: Text(
                "10st trend of music",
                textAlign: TextAlign.start,
                style: TextStyle(
                    color: Colors.white,
                    fontFamily: "SFProText-Bold",
                    fontWeight: FontWeight.w600,
                    fontSize: 20),
              ),
            ),
            TrendOfMusicTile()
          ],
        ),
      ),
    );
  }
}
