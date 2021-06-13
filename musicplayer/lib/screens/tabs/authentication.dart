import 'package:flutter/material.dart';
import 'package:musicplayer/widgets/oval_button.dart';

class AuthenticationPage extends StatefulWidget {
  const AuthenticationPage({Key? key}) : super(key: key);

  @override
  _AuthenticationPageState createState() => _AuthenticationPageState();
}

class _AuthenticationPageState extends State<AuthenticationPage> {
  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        gradient: RadialGradient(
          center: Alignment.topCenter,
          radius: 4,
          colors: [
            Color.fromRGBO(41, 21, 107, 1),
            Color.fromRGBO(31, 33, 40, 1)
          ],
        ),
      ),
      child: Scaffold(
        backgroundColor: Colors.transparent,
        body: SingleChildScrollView(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.spaceAround,
            children: [
              Container(
                height: MediaQuery.of(context).size.height / 4,
                width: MediaQuery.of(context).size.width - 100,
                margin: EdgeInsets.only(top: 30, bottom: 10),
                child: Center(
                  child: Image.asset(
                    "assets/images/octave_logo.png",
                    fit: BoxFit.fill,
                    alignment: Alignment.centerLeft,
                  ),
                ),
              ),
              Column(
                mainAxisAlignment: MainAxisAlignment.spaceAround,
                children: [
                  Container(
                    height: 50,
                    margin: EdgeInsets.symmetric(horizontal: 20, vertical: 10),
                    child: TextField(
                      decoration: InputDecoration(
                        prefixIcon: Icon(
                          Icons.mail,
                          color: Colors.pink.shade600,
                        ),

                        focusedBorder: OutlineInputBorder(
                            borderSide: BorderSide(
                              width: 2,
                              color: Colors.pink.shade900,
                            ),
                            borderRadius: BorderRadius.circular(40)),
                        enabledBorder: OutlineInputBorder(
                          borderSide:
                              BorderSide(width: 2, color: Colors.transparent),
                          borderRadius: BorderRadius.circular(40),
                        ),
                        hintText: 'Email',

                        filled: true,
                        contentPadding:
                            EdgeInsets.only(top: 0, left: 20, bottom: 20),
                        alignLabelWithHint: true,
                        // hintStyle: TextStyle(color: Colors.black),
                        // border: InputBorder.none,
                      ),
                    ),
                  ),
                  Container(
                    height: 50,
                    margin: EdgeInsets.symmetric(horizontal: 20, vertical: 10),
                    child: Container(
                      child: TextField(
                        obscureText: true,
                        decoration: InputDecoration(
                          prefixIcon: Icon(
                            Icons.lock,
                            color: Colors.pink.shade600,
                          ),

                          focusedBorder: OutlineInputBorder(
                              borderSide: BorderSide(
                                width: 2,
                                color: Colors.pink.shade600,
                              ),
                              borderRadius: BorderRadius.circular(40)),
                          enabledBorder: OutlineInputBorder(
                            borderSide:
                                BorderSide(width: 2, color: Colors.transparent),
                            borderRadius: BorderRadius.circular(40),
                          ),
                          hintText: 'Password',

                          filled: true,
                          contentPadding:
                              EdgeInsets.only(top: 0, left: 20, bottom: 20),
                          alignLabelWithHint: true,
                          // hintStyle: TextStyle(color: Colors.black),
                          // border: InputBorder.none,
                        ),
                      ),
                    ),
                  ),
                  Container(
                    width: double.infinity,
                    height: 50,
                    margin: EdgeInsets.symmetric(horizontal: 20, vertical: 10),
                    child: OvalButton(
                      title: "Register",
                      onPressed: () {},
                    ),
                  ),
                ],
              ),
              Center(
                child: Container(
                  margin: EdgeInsets.symmetric(horizontal: 30, vertical: 20),
                  height: 2,
                  // width: 300,
                  decoration: BoxDecoration(
                    gradient: LinearGradient(
                      colors: [
                        Color.fromRGBO(227, 0, 152, 1),
                        Color.fromRGBO(114, 0, 76, 1),
                        Colors.lightBlue
                      ],
                    ),
                  ),
                ),
              ),
              Container(
                width: double.infinity,
                height: 50,
                margin: EdgeInsets.fromLTRB(20, 10, 20, 10),
                decoration: BoxDecoration(
                    color: Colors.white,
                    borderRadius: BorderRadius.circular(100)),
                child: OutlinedButton(
                  onPressed: () {},
                  child: Row(
                    children: [
                      Container(
                          width: 40,
                          height: 40,
                          // margin: EdgeInsets.only(top: 0),
                          child: Image.asset("assets/images/google.png")),
                      Container(
                        margin: EdgeInsets.only(left: 20),
                        child: Text(
                          "Sign in with Google",
                          style: TextStyle(fontSize: 20, color: Colors.purple),
                        ),
                      ),
                    ],
                  ),
                ),
              ),
              Container(
                // margin: EdgeInsets.all(20),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    TextButton(
                      onPressed: () {},
                      child: Text(
                        "Already a user? Sign In",
                        style: TextStyle(
                          fontSize: 15,
                          color: Colors.white,
                        ),
                      ),
                    ),
                    // Container(
                    //   margin: EdgeInsets.symmetric(horizontal: 20),
                    //   height: 20,
                    //   width: 2,
                    //   color: Colors.white,
                    // ),
                    // TextButton(
                    //   onPressed: () {},
                    //   child: Text(
                    //     "Forgot Password",
                    //     style: TextStyle(
                    //       color: Colors.white,
                    //     ),
                    //   ),
                    // )
                  ],
                ),
              ),
              // Spacer(),
            ],
          ),
        ),
      ),
    );
  }
}
