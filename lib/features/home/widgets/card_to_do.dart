import 'package:flutter/material.dart';
import 'package:todo/constants/color.dart';

class CardToDo extends StatelessWidget {
  const CardToDo({
    super.key,
    required this.title,
  });

  final String title;

  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.infinity,
      decoration: BoxDecoration(borderRadius: BorderRadius.circular(10), color: grey),
      child: Container(
        margin: EdgeInsets.all(8),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [Text(title, style: TextStyle(fontWeight: FontWeight.bold, fontSize: 18)), Text('Friday, 21 Feb 2025 at 12:42 PM')],
        ),
      ),
    );
  }
}
