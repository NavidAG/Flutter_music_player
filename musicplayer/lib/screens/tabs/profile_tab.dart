import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:musicplayer/socicon_icons.dart';
import 'package:musicplayer/widgets/magenta_button.dart';
import 'package:musicplayer/widgets/profile_widget.dart';

// ignore: must_be_immutable
class ProfileTab extends StatelessWidget {
  List<String> modalOptionsString = [
    "Share",
    "Add to Playlist",
    "Save to My Music",
    "Go to Artist",
    "View Info",
    "Sleep timer",
  ];
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.transparent,
      appBar: AppBar(
        actions: [
          IconButton(
            onPressed: () {},
            icon: SvgPicture.asset(
              "assets/icons/gear.svg",
              color: Colors.white,
            ),
          )
        ],
        elevation: 0,
        centerTitle: false,
        title: Container(
          margin: EdgeInsets.all(10),
          child: Text("Hanna"),
        ),
        backgroundColor: Colors.transparent,
      ),
      body: Column(
        children: [
          ProfileWidget(),
          Container(
            padding: EdgeInsets.zero,
            margin: EdgeInsets.fromLTRB(24, 10, 24, 10),
            height: 50,
            // width: 312,
            decoration: BoxDecoration(
              color: Colors.black.withOpacity(0.3),
              borderRadius: BorderRadius.circular(100),
            ),
            child: TextField(
              decoration: InputDecoration(
                hintText: "search your setting",
                prefixIcon: Icon(
                  Socicon.magnifier,
                  color: Colors.white54,
                ),
                border: InputBorder.none,
              ),
            ),
          ),
          Container(
            margin: EdgeInsets.fromLTRB(24, 10, 24, 10),
            height: 72,
            // width: 312,
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(20),
              color: Colors.white12,
            ),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Container(
                  margin: EdgeInsets.all(25),
                  child: Text(
                    "Octave Premium",
                    style: TextStyle(fontSize: 15),
                  ),
                ),
                Container(
                  margin: EdgeInsets.all(20),
                  child: MagentaButton(title: "Get"),
                ),
              ],
            ),
          ),
          Expanded(
            child: ListView.separated(
                itemBuilder: (BuildContext context, int index) {
                  switch (index) {
                    case 0:
                      return ListTile(
                        trailing: Icon(Icons.chevron_right),
                        leading: Container(
                          margin: EdgeInsets.only(left: 10, right: 10),
                          child: SvgPicture.asset(
                            "assets/icons/lock_home.svg",
                            color: Colors.white,
                          ),
                        ),
                        title: Text("Privacy Setting"),
                        subtitle: Text(
                          "Music Privacy & Sharing",
                          style: TextStyle(fontSize: 12, color: Colors.white24),
                        ),
                      );
                    case 1:
                      return ListTile(
                        trailing: Icon(Icons.chevron_right),
                        leading: Container(
                          margin: EdgeInsets.only(left: 10, right: 10),
                          child: SvgPicture.asset(
                            "assets/icons/double_music.svg",
                            color: Colors.white,
                          ),
                        ),
                        title: Text("Music Setting"),
                        subtitle: Text(
                          "Audio quality and music behavior",
                          style: TextStyle(fontSize: 12, color: Colors.white24),
                        ),
                      );
                    case 2:
                      return ListTile(
                        trailing: Icon(Icons.chevron_right),
                        leading: Container(
                          margin: EdgeInsets.only(left: 10, right: 10),
                          child: SvgPicture.asset(
                            "assets/icons/plus_option.svg",
                            color: Colors.white,
                          ),
                        ),
                        title: Text("App Setting"),
                        subtitle: Text(
                          "Dark mode and language",
                          style: TextStyle(fontSize: 12, color: Colors.white24),
                        ),
                      );
                    case 3:
                      return ListTile(
                        onTap: () => _onShareButtonPressed(context),
                        trailing: Icon(Icons.chevron_right),
                        leading: Container(
                          margin: EdgeInsets.only(left: 10, right: 10),
                          child: SvgPicture.asset(
                            "assets/icons/device_bell.svg",
                            color: Colors.white,
                          ),
                        ),
                        title: Text("Notifications"),
                        subtitle: Text(
                          "Recommendations, chat and activities",
                          style: TextStyle(fontSize: 12, color: Colors.white24),
                        ),
                      );
                    case 4:
                      return ListTile(
                        trailing: Icon(Icons.chevron_right),
                        leading: Container(
                          margin: EdgeInsets.only(left: 10, right: 10),
                          child: SvgPicture.asset(
                            "assets/icons/display.svg",
                            color: Colors.white,
                          ),
                        ),
                        title: Text("Connect to another device"),
                        subtitle: Text(
                          "Connect to you TV, Sound bar & others",
                          style: TextStyle(fontSize: 12, color: Colors.white24),
                        ),
                      );
                    case 5:
                      return ListTile(
                        trailing: Icon(Icons.chevron_right),
                        leading: Container(
                          margin: EdgeInsets.only(left: 10, right: 10),
                          child: SvgPicture.asset(
                            "assets/icons/share_chain.svg",
                            color: Colors.white,
                          ),
                        ),
                        title: Text("Socilize with us"),
                        subtitle: Text(
                          "Follow us on social media",
                          style: TextStyle(fontSize: 12, color: Colors.white24),
                        ),
                      );
                    case 6:
                      return ListTile(
                        trailing: Icon(Icons.chevron_right),
                        leading: Container(
                          margin: EdgeInsets.only(left: 10, right: 10),
                          child: SvgPicture.asset(
                            "assets/icons/1828427.svg",
                            color: Colors.white,
                          ),
                        ),
                        title: Text("Privacy and Policy"),
                      );
                    case 7:
                      return ListTile(
                        trailing: Icon(Icons.chevron_right),
                        leading: Container(
                          margin: EdgeInsets.only(left: 10, right: 10),
                          child: SvgPicture.asset(
                            "assets/icons/1828427.svg",
                            color: Colors.white,
                          ),
                        ),
                        title: Text("Logout"),
                        subtitle: Text(
                          "hannamontana@gmail.com",
                          style: TextStyle(fontSize: 12, color: Colors.white24),
                        ),
                      );
                    default:
                      return ListTile();
                  }
                },
                separatorBuilder: (BuildContext context, int index) =>
                    const Divider(),
                itemCount: 8),
          )
        ],
      ),
    );
  }

  void _onShareButtonPressed(context) {
    print("d");
    showModalBottomSheet(
      context: context,
      builder: (context) {
        return Container(
          color: Colors.transparent,
          child: Container(
            height: 500,
            decoration: BoxDecoration(
              gradient: LinearGradient(
                colors: [
                  Color.fromRGBO(227, 87, 172, 1),

                  // Color.fromRGBO(200, 0, 100, 1).withOpacity(1),
                  Color.fromRGBO(151, 80, 125, 1)
                ],
              ),
              borderRadius: BorderRadius.only(
                topLeft: Radius.circular(30),
                topRight: Radius.circular(30),
              ),
            ),
            child: ListView.separated(
              itemBuilder: (BuildContext context, int index) {
                return index == 0
                    ? Container(
                        margin: EdgeInsets.fromLTRB(0, 10, 10, 0),
                        width: double.infinity,
                        child: ListTile(
                          title: Text(
                            "Ghalbe Banafsh",
                          ),
                          subtitle: Text("Ali Ardavan & Sepehr Khalse"),
                          leading: Container(
                            width: 75,
                            height: 100,
                            decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(10),
                              color: Colors.red,
                            ),
                          ),
                        ),
                      )
                    : Container(
                        height: 45,
                        child: ListTile(
                          leading: Container(
                            margin: EdgeInsets.only(left: 10, right: 10),
                            child: SvgPicture.asset(
                              "assets/icons/1828427.svg",
                              color: Colors.white,
                            ),
                          ),
                          title: Text(modalOptionsString[index - 1]),
                        ),
                      );
                //
              },
              separatorBuilder: (BuildContext context, int index) => index > 0
                  ? const Divider(
                      thickness: 1,
                      indent: 80,
                      endIndent: 80,
                    )
                  : Container(),
              itemCount: modalOptionsString.length + 1,
            ),
          ),
        );
      },
    );
  }
}
