// ignore_for_file: deprecated_member_use

import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';

class CircularImageWithShadow extends StatelessWidget {
  final String imagePath;

  const CircularImageWithShadow({super.key, required this.imagePath});

  @override
  Widget build(BuildContext context) {
    final isSvg = imagePath.toLowerCase().endsWith('.svg');

    return Container(
      width: 80,
      height: 80,
      decoration: BoxDecoration(
        shape: BoxShape.circle,
        boxShadow: [
          BoxShadow(
            color: Colors.black.withOpacity(0.15),
            blurRadius: 15,
            spreadRadius: 0.2,
            offset: const Offset(0, 1),
          ),
        ],
      ),
      child: ClipOval(
        child:
            isSvg
                ? SvgPicture.asset(imagePath, fit: BoxFit.cover)
                : Image.asset(imagePath, fit: BoxFit.cover),
      ),
    );
  }
}
