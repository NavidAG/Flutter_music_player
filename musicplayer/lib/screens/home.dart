import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_svg/svg.dart';

import '../widgets/now_playing_widget.dart';
import 'tabs/explore_tab/explore_tab.dart';
import 'tabs/playlist_tab/playlist_tab.dart';
import 'tabs/profile_tab/profile_tab.dart';
import 'tabs/search_tab/Search_tab.dart';

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
        bottomNavigationBar: BottomNavigationBar(
          type: BottomNavigationBarType.fixed,
          showSelectedLabels: false,
          showUnselectedLabels: false,
          currentIndex: _currentIndex,
          items: [
            BottomNavigationBarItem(
              icon: SvgPicture.asset(
                "assets/icons/home.svg",
                color: _currentIndex == 0 ? Colors.white : Colors.grey,
              ),
              label: "Explore",
            ),
            BottomNavigationBarItem(
              icon: SvgPicture.asset(
                "assets/icons/search.svg",
                color: _currentIndex == 1 ? Colors.white : Colors.grey,
              ),
              label: "Search",
            ),
            BottomNavigationBarItem(
              icon: SvgPicture.asset(
                "assets/icons/library.svg",
                color: _currentIndex == 2 ? Colors.white : Colors.grey,
              ),
              label: "library",
            ),
            BottomNavigationBarItem(
              //TODO: user icon is missing and should be replaced
              icon: Icon(
                Icons.warning_rounded,
                color: _currentIndex == 3 ? Colors.white : Colors.grey,
              ),
              label: "profile",
            ),
          ],
          onTap: (selectedIndex) {
            setState(() {
              _currentIndex = selectedIndex;
            });
          },
        ),
        body: Stack(
          alignment: Alignment.bottomCenter,
          children: [
            _body(),
            NowPlayingWidget(),
          ],
        ),
      ),
    );
  }

  _body() {
    if (_currentIndex == 0) return ExploreTab();
    if (_currentIndex == 1) return SearchTab();
    if (_currentIndex == 2) return PlaylistTab();
    if (_currentIndex == 3) return ProfileTab();
  }
}
