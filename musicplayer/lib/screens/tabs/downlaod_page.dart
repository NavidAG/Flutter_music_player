import 'dart:ffi';

import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:lottie/lottie.dart';

class DownlaodPage extends StatefulWidget {
  const DownlaodPage({Key? key}) : super(key: key);

  @override
  DownlaodPageState createState() => DownlaodPageState();
}

class DownlaodPageState extends State<DownlaodPage> {
  @override
  Widget build(BuildContext context) {
    return Container(
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
        body: Container(
          child: ListView(
            padding: EdgeInsets.all(10),
            children: [
              _customListtile(),
              _customListtile(),
            ],
          ),
        ),
      ),
    );
  }

  _customListtile() {
    return Container(
      margin: EdgeInsets.symmetric(vertical: 5),
      child: ClipRRect(
        borderRadius: BorderRadius.circular(20),
        child: Stack(
          alignment: Alignment.center,
          children: [
            LinearProgressIndicator(
              value: 0.3,
              minHeight: 80,
              color: Colors.deepPurple[900],
            ),
            ListTile(
              title: Text("The music"),
              subtitle: Text("30% is downloaded."),
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
  }
}
