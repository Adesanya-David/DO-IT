// ignore_for_file: deprecated_member_use

import 'package:flutter/material.dart';

class TagChip extends StatelessWidget {
  final String text;
  final Color color;

  const TagChip({super.key, required this.text, required this.color});

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.only(right: 6),
      padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 5),
      decoration: BoxDecoration(
        color: color.withOpacity(0.15),
        borderRadius: BorderRadius.circular(20),
      ),
      child: Text(text, style: TextStyle(color: color)),
    );
  }
}
