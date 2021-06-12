import 'package:flutter/material.dart';
import 'package:musicplayer/screens/now_playing.dart';

class NowPlayingWidget extends StatefulWidget {
  const NowPlayingWidget({Key? key}) : super(key: key);

  @override
  _NowPlayingWidgetState createState() => _NowPlayingWidgetState();
}

class _NowPlayingWidgetState extends State<NowPlayingWidget> {
  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () => Navigator.push(
          context,
          MaterialPageRoute(
            builder: (context) => NowPlayingPage(),
            fullscreenDialog: true,
          )),
      child: Container(
        width: double.infinity,
        height: 60,
        color: Colors.black,
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Container(
              width: double.infinity,
              height: 3,
              color: Color.fromRGBO(80, 80, 80, 1),
              child: LinearProgressIndicator(
                value: 0.4,
                color: Colors.white,
              ),
            ),
            Expanded(
              child: Row(
                children: [
                  Hero(
                    tag: "now_playing",
                    child: Container(
                      height: double.infinity,
                      width: 57,
                      color: Colors.red,
                    ),
                  ),
                  Container(
                    padding: EdgeInsets.symmetric(horizontal: 10, vertical: 5),
                    child: ConstrainedBox(
                      constraints: BoxConstraints(maxWidth: 110),
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.center,
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          FittedBox(
                            child: Text(
                              "Ghalbe Banafsh",
                              maxLines: 2,
                              style: TextStyle(
                                  fontWeight: FontWeight.w600, fontSize: 15),
                            ),
                          ),
                          Text(
                            "00:24 / 03:17",
                            style: TextStyle(
                                fontWeight: FontWeight.w300, fontSize: 15),
                          )
                        ],
                      ),
                    ),
                  ),
                  Spacer(),
                  Container(
                    padding: EdgeInsets.only(right: 5),
                    child: Row(
                      children: [
                        Container(
                          width: 40,
                          child: ElevatedButton(
                            style: ElevatedButton.styleFrom(
                              shape: CircleBorder(),
                              primary: Colors.transparent,
                            ),
                            child: Icon(Icons.skip_previous),
                            onPressed: () {},
                          ),
                        ),
                        Container(
                          width: 40,
                          child: ElevatedButton(
                            style: ElevatedButton.styleFrom(
                              shape: CircleBorder(),
                              primary: Colors.transparent,
                            ),
                            child: Icon(Icons.pause_circle_outline_outlined),
                            onPressed: () {},
                          ),
                        ),
                        Container(
                          width: 40,
                          child: ElevatedButton(
                            style: ElevatedButton.styleFrom(
                              shape: CircleBorder(),
                              primary: Colors.transparent,
                            ),
                            child: Icon(Icons.skip_next),
                            onPressed: () {},
                          ),
                        ),
                      ],
                    ),
                  )
                ],
              ),
            )
          ],
        ),
      ),
    );
  }
}
