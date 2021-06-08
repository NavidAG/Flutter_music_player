import 'package:flutter/material.dart';
import 'package:musicplayer/widgets/magenta_button.dart';

class ProfileWidget extends StatelessWidget {
  const ProfileWidget({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      child: Row(
        children: [
          Container(
            margin: EdgeInsets.all(20),
            width: 80,
            height: 80,
            child: ClipOval(
              child: Container(
                color: Colors.red,
              ),
            ),
          ),
          Container(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Row(
                  children: [
                    Column(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Text(
                          "22",
                        ),
                        Text(
                          "Playlists",
                          style:
                              TextStyle(color: Colors.white.withOpacity(0.4)),
                        ),
                      ],
                    ),
                    Container(
                      margin: EdgeInsets.all(20),
                      color: Colors.white.withOpacity(0.1),
                      height: 40,
                      width: 2,
                    ),
                    Column(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Text(
                          "360 K",
                        ),
                        Text(
                          "Follower",
                          style:
                              TextStyle(color: Colors.white.withOpacity(0.4)),
                        ),
                      ],
                    ),
                    Container(
                      margin: EdgeInsets.all(20),
                      color: Colors.white.withOpacity(0.1),
                      height: 40,
                      width: 2,
                    ),
                    Column(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Text(
                          "56",
                        ),
                        Text(
                          "Following",
                          style:
                              TextStyle(color: Colors.white.withOpacity(0.4)),
                        ),
                      ],
                    ),
                  ],
                ),
                Container(
                  alignment: Alignment.centerLeft,
                  padding: EdgeInsets.all(0),
                  child: MagentaButton(title: "Edit"),
                )
              ],
            ),
          )
        ],
      ),
    );
  }
}
