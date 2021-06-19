import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:http/http.dart';
import 'package:musicplayer/models/bloc/search_bloc.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import 'package:musicplayer/models/http_request.dart';

class SearchPage extends StatefulWidget {
  const SearchPage({Key? key}) : super(key: key);

  @override
  _SearchPageState createState() => _SearchPageState();
}

class _SearchPageState extends State<SearchPage> {
  var bloc = SearchBloc();
  String textFieldValue = "";
  var sectionLabels = [
    "Recent Search",
    "Artists",
    "Songs",
    "Albums",
    "Podcasts"
  ];
  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => bloc,
      child: Container(
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
          backgroundColor: Colors.transparent,
          body: SafeArea(
            child: DefaultTabController(
              length: 5,
              child: Column(
                children: [
                  Hero(
                    tag: "searchBox",
                    child: Container(
                      height: 50,
                      margin:
                          EdgeInsets.symmetric(horizontal: 20, vertical: 10),
                      child: Material(
                        color: Colors.transparent,
                        child: TextField(
                          onSubmitted: (value) =>
                              bloc..add(SearchPhraseEvent(phrase: value)),
                          // onChanged: (value) {
                          //   textFieldValue = value;
                          // },
                          decoration: InputDecoration(
                            prefixIcon: Icon(
                              Icons.search,
                              color: Colors.white.withOpacity(0.6),
                            ),
                            suffixIcon: IconButton(
                                splashRadius: 20,
                                onPressed: () {
                                  Navigator.pop(context);
                                },
                                icon: Icon(
                                  Icons.close,
                                  color: Colors.white.withOpacity(0.6),
                                )),
                            focusedBorder: OutlineInputBorder(
                                borderSide: BorderSide(
                                    width: 0, color: Colors.transparent),
                                borderRadius: BorderRadius.circular(40)),
                            enabledBorder: OutlineInputBorder(
                              borderSide: BorderSide(
                                  width: 0, color: Colors.transparent),
                              borderRadius: BorderRadius.circular(40),
                            ),
                            hintText: 'Search',
                            fillColor: Colors.black.withOpacity(0.4),
                            filled: true,
                            contentPadding: EdgeInsets.only(top: 0),
                            alignLabelWithHint: true,
                            hintStyle: TextStyle(color: Colors.white),
                            // border: InputBorder.none,
                          ),
                        ),
                      ),
                    ),
                  ),
                  Container(
                    child: TabBar(
                      labelPadding: EdgeInsets.symmetric(horizontal: 20),
                      indicatorSize: TabBarIndicatorSize.label,
                      indicatorColor: Color.fromRGBO(1, 200, 239, 1),
                      indicatorWeight: 4,
                      isScrollable: true,
                      labelColor: Color.fromRGBO(1, 200, 239, 1),
                      labelStyle: TextStyle(
                        fontWeight: FontWeight.w600,
                        fontSize: 18,
                      ),
                      tabs: [
                        Tab(
                          child: Container(
                            width: 40,
                            child: Center(
                              child: Text(
                                "All",
                              ),
                            ),
                          ),
                        ),
                        Tab(
                          child: Container(
                            width: 60,
                            child: Center(
                              child: Text(
                                "Artists",
                              ),
                            ),
                          ),
                        ),
                        Tab(
                          child: Container(
                            width: 60,
                            child: Center(
                              child: Text(
                                "Songs",
                              ),
                            ),
                          ),
                        ),
                        Tab(
                          child: Container(
                            width: 70,
                            child: Center(
                              child: Text(
                                "Albums",
                              ),
                            ),
                          ),
                        ),
                        Tab(
                          child: Container(
                            width: 90,
                            child: Center(
                              child: Text(
                                "Podcasts",
                              ),
                            ),
                          ),
                        ),
                      ],
                    ),
                  ),
                  Flexible(
                    child: TabBarView(
                      children: <Widget>[
                        _allTabListView(),
                        Icon(Icons.directions_car, size: 350),
                        BlocBuilder<SearchBloc, SearchState>(
                          builder: (context, state) {
                            print("----------------------------");
                            if (state is SearchInitialState) {
                              return Center(child: Text("Search something."));
                            } else if (state is SearchSucceedState) {
                              return ListView.builder(
                                itemCount: state.result.length,
                                itemBuilder: (BuildContext context, int index) {
                                  return ListTile(
                                    leading: Image.network(
                                        "${state.result[index]["artist"]["picture_small"]}"),
                                    title:
                                        Text("${state.result[index]["title"]}"),
                                    subtitle: Text(
                                        "${state.result[index]["artist"]["name"]}"),
                                  );
                                },
                              );
                            } else if (state is SearchFailedState) {
                              Center(
                                child: Text("Something went wrong."),
                              );
                            } else {
                              return Center(child: CircularProgressIndicator());
                            }
                            return Container();
                          },
                        ),
                        Icon(Icons.directions_bike, size: 350),
                        Icon(Icons.directions_boat, size: 350),
                      ],
                    ),
                  ),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }

  _allTabListView() {
    return ListView.builder(
      padding: EdgeInsets.fromLTRB(10, 20, 10, 80),
      itemCount: 5,
      itemBuilder: (BuildContext context, int index) {
        return Column(
          children: [
            Container(
              margin: EdgeInsets.all(10),
              width: double.infinity,
              child: Text(
                sectionLabels[index],
                style: TextStyle(fontWeight: FontWeight.w400, fontSize: 20),
              ),
            ),
            Container(
              height: 90,
              child: ListView.builder(
                itemCount: index == 0 ? 3 : 2,
                physics: NeverScrollableScrollPhysics(),
                itemBuilder: (BuildContext context, int subListIndex) {
                  if (index == 0)
                    return Container(
                      margin: EdgeInsets.symmetric(horizontal: 20),
                      height: 30,
                      child: TextButton(
                        style: TextButton.styleFrom(
                          alignment: Alignment.centerLeft,
                        ),
                        child: Text(
                          subListIndex.toString(),
                          textAlign: TextAlign.start,
                          style:
                              TextStyle(color: Colors.white.withOpacity(0.6)),
                        ),
                        onPressed: () {},
                      ),
                    );
                  else
                    return ListTile(
                      leading: Container(
                        width: 50,
                        height: 50,
                        color: Colors.red,
                      ),
                      title: Text("hi"),
                    );
                },
              ),
            ),
          ],
        );
      },
    );
  }
}
