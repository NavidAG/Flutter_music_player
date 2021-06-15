import 'package:flutter/material.dart';

class OvalButton extends StatelessWidget {
  final String title;
  final Function onPressed;
  const OvalButton({Key? key, required this.title, required this.onPressed})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ConstrainedBox(
      constraints: BoxConstraints(minWidth: 80),
      child: Container(
          // height: 28,
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(100),
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
          ),
          child: OutlinedButton(
            style: OutlinedButton.styleFrom(
                shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(100))),
            onPressed: () => this.onPressed(),
            child: Text(
              title,
              maxLines: 1,
              style: TextStyle(
                color: Colors.white,
                fontSize: 20,
              ),
            ),
          )),
    );
  }
}
