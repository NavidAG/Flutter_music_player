import 'package:flutter/material.dart';

class TableCell extends StatelessWidget {
  final String title;
  final String description;
  final IconData icon;
  const TableCell({
    Key? key,
    required this.title,
    required this.description,
    required this.icon,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Container(
          child: Icon(icon),
        ),
        Column(
          children: [
            Container(
              child: Text(title),
            ),
            Container(
              child: Text(description),
            ),
          ],
        )
      ],
    );
  }
}
