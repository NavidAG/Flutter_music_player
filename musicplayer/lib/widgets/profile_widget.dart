import 'package:flutter/material.dart';
import 'package:musicplayer/widgets/magenta_button.dart';

class ProfileWidget extends StatelessWidget {
  const ProfileWidget({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceAround,
        children: [
          Container(
            margin: EdgeInsets.only(left: 20, right: 10),
            width: MediaQuery.of(context).size.width / 4,
            height: MediaQuery.of(context).size.width / 4,
            decoration: BoxDecoration(
              shape: BoxShape.circle,
              color: Colors.white,
            ),
          ),
          Container(
            margin: EdgeInsets.fromLTRB(0, 20, 20, 5),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Center(
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Column(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Text(
                            "22",
                          ),
                          Text(
                            "Playlists",
                            style: TextStyle(
                              color: Colors.white.withOpacity(0.4),
                              fontSize:
                                  MediaQuery.of(context).textScaleFactor * 12,
                            ),
                          ),
                        ],
                      ),
                      Container(
                        margin: EdgeInsets.all(8),
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
                            style: TextStyle(
                              color: Colors.white.withOpacity(0.4),
                              fontSize:
                                  MediaQuery.of(context).textScaleFactor * 12,
                            ),
                          ),
                        ],
                      ),
                      Container(
                        margin: EdgeInsets.all(8),
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
                            style: TextStyle(
                              color: Colors.white.withOpacity(0.4),
                              fontSize:
                                  MediaQuery.of(context).textScaleFactor * 12,
                            ),
                          ),
                        ],
                      ),
                    ],
                  ),
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
