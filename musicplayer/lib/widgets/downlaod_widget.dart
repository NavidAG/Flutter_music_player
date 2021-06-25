import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:musicplayer/models/bloc/download_bloc.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class DownloadWidget extends StatefulWidget {
  final String uri;
  final String finaName;
  const DownloadWidget({required this.uri, required this.finaName});

  @override
  DownloadWidgetState createState() => DownloadWidgetState();
}

class DownloadWidgetState extends State<DownloadWidget> {
  var bloc = DownloadBloc();

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => bloc
        ..add(DownloadSongEvent(
            fileName: this.widget.finaName, urlString: this.widget.uri)),
      child: Container(
        decoration: BoxDecoration(
          gradient: RadialGradient(
            center: Alignment.topLeft,
            radius: 0.9,
            colors: [
              Color.fromRGBO(41, 21, 107, 1),
              Color.fromRGBO(31, 33, 40, 1)
            ],
          ),
        ),
        child: Scaffold(
          appBar: AppBar(
            title: Text("Download Center"),
            backgroundColor: Colors.transparent,
            elevation: 0,
          ),
          backgroundColor: Colors.transparent,
          body: BlocBuilder<DownloadBloc, DownloadState>(
            builder: (context, state) {
              if (state is DownloadInitial) {
                return Center(
                  child: Text("Nothing is being downloaded!"),
                );
              }
              return Container(
                child: ListView(
                  padding: EdgeInsets.all(10),
                  children: [
                    _customListtile(),
                  ],
                ),
              );
            },
          ),
        ),
      ),
    );
  }

  _customListtile() {
    return BlocBuilder<DownloadBloc, DownloadState>(
      builder: (context, state) {
        return StreamBuilder<double>(
            stream:
                (state as DownloadInProgressState).stream.asBroadcastStream(),
            builder: (context, snapshot) {
              return Container(
                margin: EdgeInsets.symmetric(vertical: 5),
                child: ClipRRect(
                  borderRadius: BorderRadius.circular(20),
                  child: Stack(
                    alignment: Alignment.center,
                    children: [
                      LinearProgressIndicator(
                        value: snapshot.data,
                        minHeight: 80,
                        color: Colors.deepPurple[900],
                      ),
                      ListTile(
                        title: Text("The music"),
                        subtitle: Text(snapshot.data.toString()),
                        trailing: TextButton(
                          style: TextButton.styleFrom(shape: CircleBorder()),
                          onPressed: () {},
                          child: Icon(
                            Icons.pause,
                            color: Colors.white,
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
              );
            });
      },
    );
  }
}
