import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';

import 'package:just_audio/just_audio.dart';
import 'package:musicplayer/models/bloc/now_playing_bloc.dart';
import 'package:musicplayer/models/bloc/search_bloc.dart';
import 'package:musicplayer/models/http_request.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class NowPlayingPage extends StatefulWidget {
  const NowPlayingPage({Key? key}) : super(key: key);

  @override
  _NowPlayingPageState createState() => _NowPlayingPageState();
}

class _NowPlayingPageState extends State<NowPlayingPage> {
  var nowPlayingBloc = NowPlayingBloc()..add(GetSongEvent(id: 63510362));
  Duration? duration;
  String url = "";

  @override
  void dispose() {
    nowPlayingBloc.audioPlayer.dispose();
    super.dispose();
  }

  double sliderValue = 0;
  final controller = PageController(
    initialPage: 0,
  );
  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => nowPlayingBloc,
      child: Scaffold(
        backgroundColor: Colors.black,
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
        body: SingleChildScrollView(
          child: Column(
            children: [
              Container(
                height: MediaQuery.of(context).size.height / 2.5,
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
              Container(
                margin: EdgeInsets.fromLTRB(5, 10, 5, 5),
                child: Row(
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
              ),
              Container(
                margin: EdgeInsets.fromLTRB(10, 5, 10, 0),
                child: Slider(
                  min: 0,
                  max: 100,
                  value: sliderValue,
                  onChanged: (value) => setState(() => sliderValue = value),
                  activeColor: Color.fromRGBO(141, 52, 255, 1),
                ),
              ),
              Container(
                margin: EdgeInsets.fromLTRB(5, 2, 5, 5),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Container(
                      margin: EdgeInsets.only(left: 30),
                      child: Text("00:00"),
                    ),
                    Container(
                      margin: EdgeInsets.only(right: 30),
                      child: Text((duration ?? "00:00").toString()),
                    )
                  ],
                ),
              ),
              Container(
                // margin: EdgeInsets.all(20),
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
                            color: Color.fromRGBO(141, 100, 255, 0.5),
                            width: 2),
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
                      child: BlocBuilder<NowPlayingBloc, NowPlayingState>(
                        builder: (context, state) {
                          return IconButton(
                            onPressed: () {
                              if (state is SongIsPausedState ||
                                  state is SongIsLoadedState) {
                                nowPlayingBloc..add(PlaySongEvent());
                              }
                              if (state is SongIsPlayingState) {
                                nowPlayingBloc..add(PauseSongEvent());
                              }
                            },
                            icon: Icon(
                              state is SongIsPlayingState
                                  ? Icons.pause
                                  : Icons.play_arrow,
                              size: 40,
                            ),
                          );
                        },
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
        ),
      ),
    );
  }
}

class MusicInfoWidget extends StatelessWidget {
  const MusicInfoWidget({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      child: BlocBuilder<NowPlayingBloc, NowPlayingState>(
        builder: (context, state) {
          if (state is LoadSongInProgress) {
            return Center(
              child: CircularProgressIndicator(),
            );
          }
          if (state is GetSongFailed) {
            return Center(
              child: Text("Something went wrong."),
            );
          } else {
            return Container(
              child: Column(
                children: [
                  Hero(
                    tag: "now_playing",
                    child: Material(
                      color: Colors.transparent,
                      child: ClipOval(
                        child: Container(
                          decoration: BoxDecoration(
                            image: DecorationImage(
                              image: NetworkImage(
                                  BlocProvider.of<NowPlayingBloc>(context)
                                      .songJson["album"]["cover_medium"]),
                            ),
                          ),
                          // color: Colors.white,
                          width: MediaQuery.of(context).size.width / 2,
                          height: MediaQuery.of(context).size.width / 2,
                        ),
                      ),
                    ),
                  ),
                  Container(
                    margin: EdgeInsets.fromLTRB(10, 5, 20, 0),
                    child: Text(
                      BlocProvider.of<NowPlayingBloc>(context)
                          .songJson["title"],
                      style: TextStyle(
                          fontSize:
                              MediaQuery.of(context).textScaleFactor * 25),
                    ),
                  ),
                  Container(
                    margin: EdgeInsets.all(5),
                    child: Text(
                      BlocProvider.of<NowPlayingBloc>(context)
                          .songJson["artist"]["name"],
                      style: TextStyle(
                          fontSize:
                              MediaQuery.of(context).textScaleFactor * 15),
                    ),
                  ),
                ],
              ),
            );
          }
        },
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
