import 'package:flutter/material.dart';

class OvalButton extends StatefulWidget {
  final String title;
  final Function onPressed;
  const OvalButton({Key? key, required this.title, required this.onPressed})
      : super(key: key);

  @override
  _OvalButtonState createState() => _OvalButtonState();
}

class _OvalButtonState extends State<OvalButton> {
  @override
  Widget build(BuildContext context) {
    return ConstrainedBox(
      constraints: BoxConstraints(minWidth: 80),
      child: Container(
          height: 28,
          decoration: BoxDecoration(
              // border: Border.all(
              //   width: 2,
              //   color: Colors.pink.shade600,
              // ),
              gradient: LinearGradient(
                colors: [
                  Color.fromRGBO(227, 0, 152, 1),
                  Color.fromRGBO(227, 0, 152, 1),
                  Color.fromRGBO(75, 50, 250, 1),
                  Colors.lightBlue,
                ],
              ),
              borderRadius: BorderRadius.circular(100)),
          child: OutlinedButton(
            style: ButtonStyle(),
            onPressed: () => this.widget.onPressed(),
            child: Text(
              widget.title,
              maxLines: 1,
              style: TextStyle(
                color: Colors.white,
                fontSize: 25,
              ),
            ),
          )),
    );
  }
}
