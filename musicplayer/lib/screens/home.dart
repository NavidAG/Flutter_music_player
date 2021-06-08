import 'package:flutter/material.dart';
import 'package:musicplayer/screens/tabs/explore_tab.dart';
import 'package:musicplayer/socicon_icons.dart';

class Home extends StatefulWidget {
  const Home({Key? key}) : super(key: key);

  @override
  _HomeState createState() => _HomeState();
}

class _HomeState extends State<Home> {
  int _currentIndex = 0;

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
          ])),
      child: Scaffold(
        backgroundColor: Colors.transparent,
        appBar: AppBar(
          elevation: 0,
          backgroundColor: Colors.transparent,
          centerTitle: false,
          title: Container(
            child: Image.asset(
              "assets/images/octave_logo.png",
              fit: BoxFit.fitHeight,
              alignment: Alignment.centerLeft,
              width: 120,
            ),
          ),
          actions: [
            IconButton(
                splashRadius: 20, onPressed: () {}, icon: Icon(Socicon.bell)),
            IconButton(
                splashRadius: 20, onPressed: () {}, icon: Icon(Socicon.lyrics))
          ],
        ),
        bottomNavigationBar: BottomNavigationBar(
          //TODO: set the selected icons' image
          selectedItemColor: Colors.white,
          unselectedItemColor: Colors.grey,
          type: BottomNavigationBarType.fixed,
          showSelectedLabels: false,
          showUnselectedLabels: false,
          currentIndex: _currentIndex,
          items: [
            BottomNavigationBarItem(
              icon: Icon(Socicon.home),
              label: "Explore",
            ),
            BottomNavigationBarItem(
              icon: Icon(Socicon.magnifier),
              label: "Search",
            ),
            BottomNavigationBarItem(
              icon: Icon(Socicon.library),
              label: "library",
            ),
            BottomNavigationBarItem(
              icon: Icon(Socicon.group_12632),
              label: "profile",
            ),
          ],
          onTap: (selectedIndex) {
            setState(() {
              _currentIndex = selectedIndex;
            });
          },
        ),
        body: _body(),
      ),
    );
  }

  _body() {
    if (_currentIndex == 0) return ExploreTab();
    if (_currentIndex == 1) return Container();
    if (_currentIndex == 2) return Container();
    if (_currentIndex == 3) return Container();
  }
}