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
    return Scaffold(
      appBar: AppBar(
        title: Text("Download Center"),
        backgroundColor: Colors.deepPurple,
      ),
      backgroundColor: Color.fromRGBO(31, 33, 40, 1),
      body: Container(
        child: ListView(
          padding: EdgeInsets.all(10),
          children: [
            _customListtile(),
            _customListtile(),
          ],
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
