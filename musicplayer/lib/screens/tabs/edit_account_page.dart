import 'dart:typed_data';

import 'package:flutter/material.dart';

class EditAccountPage extends StatefulWidget {
  const EditAccountPage({Key? key}) : super(key: key);

  @override
  _EditAccountPageState createState() => _EditAccountPageState();
}

class _EditAccountPageState extends State<EditAccountPage> {
  DateTime selectedDate = DateTime.now();

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
          // leading: IconButton(
          //   splashRadius: 20,
          //   onPressed: () => Navigator.of(context).pop(),
          //   icon: Icon(Icons.arrow_back),
          // ),
          elevation: 0,
          backgroundColor: Colors.transparent,
          title: Text(
            "Edit",
            style: TextStyle(fontWeight: FontWeight.w400),
          ),
          actions: [
            IconButton(
              onPressed: () {},
              icon: Icon(Icons.check),
            )
          ],
        ),
        backgroundColor: Colors.transparent,
        body: SingleChildScrollView(
          padding: EdgeInsets.only(bottom: 50),
          child: Column(
            children: [
              Stack(
                alignment: Alignment.topCenter,
                children: [
                  Container(
                    margin: EdgeInsets.fromLTRB(20, 140, 20, 20),
                    padding: EdgeInsets.fromLTRB(20, 100, 20, 40),
                    decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(20),
                        color: Colors.white.withOpacity(0.2)),
                    child: Column(
                      children: [
                        ListTile(
                          title: Text(
                            "First Name",
                            style: TextStyle(
                                color: Colors.white.withOpacity(0.6),
                                fontWeight: FontWeight.w400),
                          ),
                          trailing: Container(
                            width: 200,
                            child: TextField(
                              textAlign: TextAlign.end,
                              decoration: InputDecoration(
                                  fillColor: Colors.red,
                                  contentPadding:
                                      EdgeInsets.fromLTRB(10, 10, 0, 10),
                                  focusedBorder: InputBorder.none,
                                  enabledBorder: InputBorder.none,
                                  hintText: "Emran",
                                  hintStyle: TextStyle(
                                      color: Colors.white,
                                      fontWeight: FontWeight.w600)
                                  // border: InputBorder.none,
                                  ),
                            ),
                          ),
                        ),
                        Padding(
                          padding: const EdgeInsets.fromLTRB(10, 0, 10, 20),
                          child: Divider(
                            color: Colors.black,
                            height: 0.2,
                          ),
                        ),
                        ListTile(
                          title: Text(
                            "Last Name",
                            style: TextStyle(
                                color: Colors.white.withOpacity(0.6),
                                fontWeight: FontWeight.w400),
                          ),
                          trailing: Container(
                            width: 200,
                            child: TextField(
                              textAlign: TextAlign.end,
                              decoration: InputDecoration(
                                  fillColor: Colors.red,
                                  contentPadding:
                                      EdgeInsets.fromLTRB(10, 10, 0, 10),
                                  focusedBorder: InputBorder.none,
                                  enabledBorder: InputBorder.none,
                                  hintText: "Montana",
                                  hintStyle: TextStyle(
                                      color: Colors.white,
                                      fontWeight: FontWeight.w600)
                                  // border: InputBorder.none,
                                  ),
                            ),
                          ),
                        ),
                        Padding(
                          padding: const EdgeInsets.fromLTRB(10, 0, 10, 20),
                          child: Divider(
                            color: Colors.black,
                            height: 0.2,
                          ),
                        ),
                        ListTile(
                          title: Text(
                            "Email",
                            style: TextStyle(
                                color: Colors.white.withOpacity(0.6),
                                fontWeight: FontWeight.w400),
                          ),
                          trailing: Container(
                            width: 200,
                            child: TextField(
                              textAlign: TextAlign.end,
                              decoration: InputDecoration(
                                  fillColor: Colors.red,
                                  contentPadding:
                                      EdgeInsets.fromLTRB(10, 10, 0, 10),
                                  focusedBorder: InputBorder.none,
                                  enabledBorder: InputBorder.none,
                                  hintText: "email@example.com",
                                  hintStyle: TextStyle(
                                      color: Colors.white,
                                      fontWeight: FontWeight.w600)
                                  // border: InputBorder.none,
                                  ),
                            ),
                          ),
                        ),
                        Padding(
                          padding: const EdgeInsets.fromLTRB(10, 0, 10, 20),
                          child: Divider(
                            color: Colors.black,
                            height: 0.2,
                          ),
                        ),
                        ListTile(
                          title: Text(
                            "User",
                            style: TextStyle(
                                color: Colors.white.withOpacity(0.6),
                                fontWeight: FontWeight.w400),
                          ),
                          trailing: PopupMenuButton<int>(
                            itemBuilder: (context) => [
                              PopupMenuItem(
                                value: 1,
                                child: Text("Female"),
                              ),
                              PopupMenuItem(
                                value: 2,
                                child: Text("Male"),
                              ),
                            ],
                            initialValue: 1,
                            onCanceled: () {
                              print("You have canceled the menu.");
                            },
                            onSelected: (value) {
                              print("value:$value");
                            },
                            child: Text("tap to choose"),
                          ),
                        ),
                        Padding(
                          padding: const EdgeInsets.fromLTRB(10, 0, 10, 20),
                          child: Divider(
                            color: Colors.black,
                            height: 0.2,
                          ),
                        ),
                        ListTile(
                            title: Text(
                              "Date of Birth",
                              style: TextStyle(
                                  color: Colors.white.withOpacity(0.6),
                                  fontWeight: FontWeight.w400),
                            ),
                            trailing: TextButton(
                              child: Text(
                                "choose the date",
                                style: TextStyle(color: Colors.white),
                              ),
                              onPressed: () {
                                _selectDate(context);
                              },
                            )),
                      ],
                    ),
                  ),
                  Positioned(
                    top: 40,
                    child: Container(
                      width: 160,
                      height: 160,
                      decoration: BoxDecoration(boxShadow: [
                        BoxShadow(
                            color: Colors.grey.withOpacity(0.5),
                            spreadRadius: 1,
                            offset: Offset(0, 10),
                            blurRadius: 30)
                      ], color: Colors.purple, shape: BoxShape.circle),
                    ),
                  ),
                  Positioned(
                    right: 130,
                    top: 160,
                    child: ElevatedButton(
                      style: ElevatedButton.styleFrom(
                        minimumSize: Size(35, 35),
                        shape: CircleBorder(),
                        primary: Color.fromRGBO(141, 52, 255, 1),
                      ),
                      onPressed: () {},
                      child: Icon(
                        Icons.camera_alt,
                        size: 20,
                      ),
                    ),
                  ),
                ],
              ),
              TextButton(
                child: Text(
                  "Change Password",
                  style: TextStyle(
                      color: Color.fromRGBO(227, 0, 152, 1),
                      fontSize: 18,
                      fontWeight: FontWeight.bold),
                ),
                onPressed: () {},
              ),
              Container(
                padding: EdgeInsets.symmetric(horizontal: 10),
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(8),
                  gradient: LinearGradient(
                    colors: [
                      Color.fromRGBO(227, 0, 152, 1),
                      Color.fromRGBO(114, 0, 76, 1),
                    ],
                  ),
                ),
                height: 40.0,
                child: TextButton(
                  onPressed: () {},
                  style: TextButton.styleFrom(
                      padding: EdgeInsets.symmetric(horizontal: 10)),
                  child: Text(
                    "Deactivate Account",
                    style: TextStyle(
                        fontSize: 16,
                        fontWeight: FontWeight.w500,
                        color: Colors.white),
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }

  Future<void> _selectDate(BuildContext context) async {
    final DateTime? picked = await showDatePicker(
        context: context,
        initialDate: selectedDate,
        firstDate: DateTime(2015, 8),
        lastDate: DateTime(2101));
    if (picked != null && picked != selectedDate)
      setState(() {
        selectedDate = picked;
      });
  }
}
