import 'package:flutter/material.dart';
import 'package:musicplayer/widgets/magenta_button.dart';

class PlaylistPage extends StatefulWidget {
  const PlaylistPage({Key? key}) : super(key: key);

  @override
  _PlaylistPageState createState() => _PlaylistPageState();
}

class _PlaylistPageState extends State<PlaylistPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.transparent,
      appBar: AppBar(
        title: Text("Playlist"),
        elevation: 0,
        backgroundColor: Colors.transparent,
      ),
      body: Column(
        children: [
          Container(
            padding: EdgeInsets.zero,
            margin: EdgeInsets.fromLTRB(24, 10, 24, 10),
            height: 50,
            // width: 312,

            child: TextField(
              decoration: InputDecoration(
                focusedBorder: OutlineInputBorder(
                    borderSide: BorderSide(
                      width: 0,
                      color: Colors.transparent,
                    ),
                    borderRadius: BorderRadius.circular(40)),
                enabledBorder: OutlineInputBorder(
                  borderSide: BorderSide(
                    width: 0,
                    color: Colors.transparent,
                  ),
                  borderRadius: BorderRadius.circular(40),
                ),
                contentPadding: EdgeInsets.only(top: 0),
                alignLabelWithHint: true,
                fillColor: Colors.black.withOpacity(0.4),
                filled: true,
                hintText: "Search",
                prefixIcon: Icon(
                  Icons.search,
                  color: Colors.white54,
                ),
                border: InputBorder.none,
              ),
            ),
          ),
          Container(
            margin: EdgeInsets.all(10),
            child: MagentaButton(
              title: "Add New Playlist",
            ),
          )
        ],
      ),
    );
  }
}
