import 'package:flutter/material.dart';

class MagentaButton extends StatelessWidget {
  final String title;
  final Function onPressed;
  const MagentaButton({Key? key, required this.title, required this.onPressed})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ConstrainedBox(
      constraints: BoxConstraints(minWidth: 80),
      child: Container(
        height: 28,
        decoration: BoxDecoration(
            gradient: LinearGradient(
              colors: [
                Color.fromRGBO(227, 0, 152, 1),
                Color.fromRGBO(114, 0, 76, 1)
              ],
            ),
            borderRadius: BorderRadius.circular(5)),
        child: OutlinedButton(
          onPressed: () => this.onPressed(),
          child: Text(
            title,
            maxLines: 1,
            style: TextStyle(
              color: Colors.white,
            ),
          ),
        ),
      ),
    );
  }
}
