import 'package:flutter/material.dart';

class MagentaButton extends StatefulWidget {
  final String title;
  const MagentaButton({Key? key, required this.title}) : super(key: key);

  @override
  _MagentaButtonState createState() => _MagentaButtonState();
}

class _MagentaButtonState extends State<MagentaButton> {
  @override
  Widget build(BuildContext context) {
    return Container(
        height: 28,
        width: 80,
        decoration: BoxDecoration(
            gradient: LinearGradient(
              colors: [
                Color.fromRGBO(227, 0, 152, 1),
                Color.fromRGBO(114, 0, 76, 1)
              ],
            ),
            borderRadius: BorderRadius.circular(5)),
        child: OutlinedButton(
          onPressed: () {},
          child: Text(
            widget.title,
            style: TextStyle(
              color: Colors.white,
            ),
          ),
        ));
  }
}
