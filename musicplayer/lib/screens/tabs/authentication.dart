import 'package:flutter/material.dart';
import 'package:musicplayer/widgets/oval_button.dart';

class AuthenticationPage extends StatefulWidget {
  const AuthenticationPage({Key? key}) : super(key: key);

  @override
  _AuthenticationPageState createState() => _AuthenticationPageState();
}

class _AuthenticationPageState extends State<AuthenticationPage> {
  bool signInPageIsHidden = true;
  String? shortPasswordWarning;
  String? invalidEmailWarning;
  String? notCorrecspondingWarning;
  String emailAddress = "";
  String password = "";
  String repeatedPassword = "";
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
          child: signInPageIsHidden
              ? Column(
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
                          height: 60,
                          margin: EdgeInsets.symmetric(
                              horizontal: 20, vertical: 10),
                          child: TextField(
                            onChanged: (value) {
                              setState(() {
                                emailAddress = value;
                              });
                            },
                            decoration: InputDecoration(
                              border: OutlineInputBorder(
                                borderSide: BorderSide(
                                  width: 2,
                                  color: Colors.pink.shade900,
                                ),
                                borderRadius: BorderRadius.circular(100),
                              ),

                              prefixIcon: Icon(
                                Icons.mail,
                                color: Colors.pink.shade600,
                              ),

                              focusedBorder: OutlineInputBorder(
                                borderSide: BorderSide(
                                  width: 2,
                                  color: Colors.pink.shade900,
                                ),
                                borderRadius: BorderRadius.circular(100),
                              ),
                              enabledBorder: OutlineInputBorder(
                                borderSide: BorderSide(
                                    width: 2, color: Colors.transparent),
                                borderRadius: BorderRadius.circular(40),
                              ),
                              hintText: 'Email',

                              errorText: invalidEmailWarning,

                              filled: true,
                              contentPadding: EdgeInsets.only(
                                top: 20,
                                left: 20,
                                bottom: 10,
                              ),
                              alignLabelWithHint: true,
                              floatingLabelBehavior: FloatingLabelBehavior.auto,
                              // hintStyle: TextStyle(color: Colors.black),
                              // border: InputBorder.none,
                            ),
                          ),
                        ),
                        Container(
                          height: 60,
                          margin: EdgeInsets.symmetric(
                              horizontal: 20, vertical: 10),
                          child: Container(
                            child: TextField(
                              onChanged: (value) {
                                setState(() {
                                  password = value;
                                });
                              },
                              obscureText: true,
                              decoration: InputDecoration(
                                border: OutlineInputBorder(
                                  borderSide: BorderSide(
                                    width: 2,
                                    color: Colors.pink.shade900,
                                  ),
                                  borderRadius: BorderRadius.circular(100),
                                ),
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
                                  borderSide: BorderSide(
                                      width: 2, color: Colors.transparent),
                                  borderRadius: BorderRadius.circular(40),
                                ),
                                hintText: 'Password',
                                errorText: shortPasswordWarning,
                                filled: true,
                                contentPadding: EdgeInsets.only(
                                  top: 20,
                                  left: 20,
                                  bottom: 10,
                                ),
                                alignLabelWithHint: true,
                                // hintStyle: TextStyle(color: Colors.black),
                                // border: InputBorder.none,
                              ),
                            ),
                          ),
                        ),
                        Container(
                          width: double.infinity,
                          height: 60,
                          margin: EdgeInsets.symmetric(
                              horizontal: 20, vertical: 10),
                          child: OvalButton(
                            title: "Register",
                            onPressed: () {
                              setState(
                                () {
                                  invalidEmailWarning = isEmailValid()
                                      ? null
                                      : "Invalid email address.";
                                  shortPasswordWarning = isPasswordValid()
                                      ? null
                                      : "Password is short.";
                                  notCorrecspondingWarning =
                                      isCorrespondingPasswords()
                                          ? null
                                          : "Passwords should be same.";
                                },
                              );
                            },
                          ),
                        ),
                      ],
                    ),
                    Center(
                      child: Container(
                        margin:
                            EdgeInsets.symmetric(horizontal: 30, vertical: 20),
                        height: 2,
                        // width: 300,
                        decoration: BoxDecoration(
                          gradient: LinearGradient(
                            colors: [
                              Color.fromRGBO(227, 0, 152, 1),
                              Color.fromRGBO(227, 0, 152, 1),
                              Color.fromRGBO(75, 50, 250, 1),
                              Colors.lightBlue
                            ],
                          ),
                        ),
                      ),
                    ),
                    Container(
                      width: double.infinity,
                      height: 60,
                      margin: EdgeInsets.fromLTRB(20, 10, 20, 10),
                      child: ElevatedButton(
                        style: ElevatedButton.styleFrom(
                          primary: Colors.white,
                          shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(100),
                          ),
                        ),
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
                                style: TextStyle(
                                    fontSize: 20, color: Colors.purple),
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
                          Flexible(
                            flex: 3,
                            child: TextButton(
                              onPressed: () {
                                setState(() {
                                  invalidEmailWarning = null;
                                  shortPasswordWarning = null;
                                  notCorrecspondingWarning = null;
                                  signInPageIsHidden = false;
                                });
                              },
                              child: Text(
                                "Sign In",
                                style: TextStyle(
                                  fontSize: 15,
                                  color: Colors.white,
                                ),
                              ),
                            ),
                          ),
                          // Flexible(
                          //   flex: 1,
                          //   child: Container(
                          //     margin: EdgeInsets.symmetric(horizontal: 5),
                          //     height: 20,
                          //     width: 2,
                          //     color: Colors.white,
                          //   ),
                          // ),
                          // Flexible(
                          //   flex: 1,
                          //   child: TextButton(
                          //     onPressed: () {},
                          //     child: Text(
                          //       "Forgot Password",
                          //       maxLines: 1,
                          //       style: TextStyle(
                          //         color: Colors.white,
                          //       ),
                          //     ),
                          //   ),
                          // )
                        ],
                      ),
                    ),
                    // Spacer(),
                  ],
                )
              : Column(
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
                    Container(
                      height: 60,
                      margin:
                          EdgeInsets.symmetric(horizontal: 20, vertical: 10),
                      child: TextField(
                        onChanged: (value) {
                          setState(() {
                            emailAddress = value;
                          });
                        },
                        decoration: InputDecoration(
                          border: OutlineInputBorder(
                            borderSide: BorderSide(
                              width: 2,
                              color: Colors.pink.shade900,
                            ),
                            borderRadius: BorderRadius.circular(100),
                          ),
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
                          errorText: invalidEmailWarning,

                          filled: true,
                          contentPadding:
                              EdgeInsets.only(top: 20, left: 20, bottom: 10),
                          alignLabelWithHint: true,
                          // hintStyle: TextStyle(color: Colors.black),
                          // border: InputBorder.none,
                        ),
                      ),
                    ),
                    Container(
                      height: 60,
                      margin:
                          EdgeInsets.symmetric(horizontal: 20, vertical: 10),
                      child: Container(
                        child: TextField(
                          onChanged: (value) {
                            setState(() {
                              password = value;
                            });
                          },
                          obscureText: true,
                          decoration: InputDecoration(
                            border: OutlineInputBorder(
                              borderSide: BorderSide(
                                width: 2,
                                color: Colors.pink.shade900,
                              ),
                              borderRadius: BorderRadius.circular(100),
                            ),
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
                              borderSide: BorderSide(
                                  width: 2, color: Colors.transparent),
                              borderRadius: BorderRadius.circular(40),
                            ),
                            hintText: 'Password',
                            errorText: shortPasswordWarning,

                            filled: true,
                            contentPadding:
                                EdgeInsets.only(top: 20, left: 20, bottom: 10),
                            alignLabelWithHint: true,
                            // hintStyle: TextStyle(color: Colors.black),
                            // border: InputBorder.none,
                          ),
                        ),
                      ),
                    ),
                    Container(
                      height: 60,
                      margin:
                          EdgeInsets.symmetric(horizontal: 20, vertical: 10),
                      child: Container(
                        child: TextField(
                          onChanged: (value) {
                            setState(() {
                              repeatedPassword = value;
                            });
                          },
                          obscureText: true,
                          decoration: InputDecoration(
                            border: OutlineInputBorder(
                              borderSide: BorderSide(
                                width: 2,
                                color: Colors.pink.shade900,
                              ),
                              borderRadius: BorderRadius.circular(100),
                            ),
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
                              borderSide: BorderSide(
                                  width: 2, color: Colors.transparent),
                              borderRadius: BorderRadius.circular(40),
                            ),
                            hintText: 'Password',
                            errorText: notCorrecspondingWarning,
                            filled: true,
                            contentPadding:
                                EdgeInsets.only(top: 20, left: 20, bottom: 10),
                            alignLabelWithHint: true,
                            // hintStyle: TextStyle(color: Colors.black),
                            // border: InputBorder.none,
                          ),
                        ),
                      ),
                    ),
                    Container(
                      width: double.infinity,
                      height: 60,
                      margin:
                          EdgeInsets.symmetric(horizontal: 20, vertical: 10),
                      child: OvalButton(
                        title: "Sign In",
                        onPressed: () {
                          setState(() {
                            invalidEmailWarning = isEmailValid()
                                ? null
                                : "Invalid email address.";
                            shortPasswordWarning =
                                isPasswordValid() ? null : "Password is short.";
                            notCorrecspondingWarning =
                                isCorrespondingPasswords()
                                    ? null
                                    : "Passwords should be same.";
                          });
                        },
                      ),
                    ),
                    TextButton(
                      onPressed: () {
                        setState(() {
                          invalidEmailWarning = null;
                          shortPasswordWarning = null;
                          notCorrecspondingWarning = null;
                          signInPageIsHidden = true;
                        });
                      },
                      child: Text(
                        "Sign Up",
                        style: TextStyle(
                          fontSize: 15,
                          color: Colors.white,
                        ),
                      ),
                    ),
                  ],
                ),
        ),
      ),
    );
  }

  bool isPasswordValid() {
    return password.length >= 8;
  }

  bool isEmailValid() {
    bool emailValid = RegExp(
            r"^[a-zA-Z0-9.a-zA-Z0-9.!#$%&'*+-/=?^_`{|}~]+@[a-zA-Z0-9]+\.[a-zA-Z]+")
        .hasMatch(emailAddress);
    print(emailValid);
    return emailValid;
  }

  bool isCorrespondingPasswords() {
    return repeatedPassword == password;
  }
}
