import 'package:flutter/material.dart';

class CourseTagChip extends StatelessWidget {
  final String text;
  final Color color;
  final bool expanded;

  const CourseTagChip(this.text, this.color, {Key? key, this.expanded = false}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final a = Container(
      alignment: Alignment.center,
      decoration: BoxDecoration(color: color, borderRadius: BorderRadius.circular(5)),
      padding: EdgeInsets.symmetric(vertical: expanded ? 10 : 5, horizontal: 10),
      child: Text(text, style: TextStyle(color: Colors.white, fontSize: expanded ? 16 : 12)),
    );
    return expanded ? Expanded(child: a, flex: 1) : a;
  }
}
