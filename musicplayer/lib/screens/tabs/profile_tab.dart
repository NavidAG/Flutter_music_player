import 'package:flutter/material.dart';
import 'package:musicplayer/socicon_icons.dart';
import 'package:musicplayer/widgets/magenta_button.dart';
import 'package:musicplayer/widgets/profile_widget.dart';

class ProfileTab extends StatelessWidget {
  const ProfileTab({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.transparent,
      appBar: AppBar(
        actions: [
          IconButton(
            onPressed: () {},
            icon: Icon(
              Icons.settings,
              color: Colors.white,
            ),
          )
        ],
        elevation: 0,
        centerTitle: false,
        title: Text("Anna"),
        backgroundColor: Colors.transparent,
      ),
      body: Column(
        children: [
          ProfileWidget(),
        ],
      ),
    );
  }
}
