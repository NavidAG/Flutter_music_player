import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';

import '../../../widgets/magenta_button.dart';
import '../../../widgets/profile_widget.dart';
import 'audio_setting_page.dart';

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
      body: Container(
        child: ListView(
          padding: EdgeInsets.fromLTRB(20, 10, 20, 80),
          children: [
            ProfileWidget(),
            Container(
              padding: EdgeInsets.zero,
              margin: EdgeInsets.symmetric(vertical: 10),
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
                  hintText: "Search Your Setting",
                  prefixIcon: Icon(
                    Icons.search,
                    color: Colors.white54,
                  ),
                  border: InputBorder.none,
                ),
              ),
            ),
            Container(
              margin: EdgeInsets.symmetric(vertical: 10),
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
                    margin: EdgeInsets.all(20),
                    child: Text(
                      "Octave Premium",
                      style: TextStyle(fontSize: 15),
                    ),
                  ),
                  Container(
                    margin: EdgeInsets.only(right: 15),
                    child: MagentaButton(
                      title: "Get",
                      onPressed: () {},
                    ),
                  ),
                ],
              ),
            ),
            ListTile(
              trailing: Icon(Icons.chevron_right),
              leading: Container(
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
            ),
            ListTile(
              onTap: () => Navigator.push(
                context,
                MaterialPageRoute(
                    builder: (context) => AudioSettingPage(),
                    fullscreenDialog: true),
              ),
              trailing: Icon(Icons.chevron_right),
              leading: Container(
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
            ),
            ListTile(
              trailing: Icon(Icons.chevron_right),
              leading: Container(
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
            ),
            ListTile(
              onTap: () => _onShareButtonPressed(context),
              trailing: Icon(Icons.chevron_right),
              leading: Container(
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
            ),
            ListTile(
              trailing: Icon(Icons.chevron_right),
              leading: Container(
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
            ),
            ListTile(
              trailing: Icon(Icons.chevron_right),
              leading: Container(
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
            ),
            ListTile(
              trailing: Icon(Icons.chevron_right),
              leading: Container(
                child: SvgPicture.asset(
                  "assets/icons/shield.svg",
                  color: Colors.white,
                ),
              ),
              title: Text("Privacy and Policy"),
            ),
            ListTile(
              trailing: Icon(Icons.chevron_right),
              leading: Container(
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
            ),
          ],
        ),
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
