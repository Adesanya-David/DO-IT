import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';

class SvgCircleAvatarList extends StatelessWidget {
  final List<String> svgAssets;
  final double avatarRadius;
  final Color? backgroundColor;
  final Color? svgColor;

  const SvgCircleAvatarList({
    super.key,
    required this.svgAssets,
    this.avatarRadius = 24,
    this.backgroundColor,
    this.svgColor,
  });

  @override
  Widget build(BuildContext context) {
    return Row(
      children:
          svgAssets.map((asset) {
            return Padding(
              padding: const EdgeInsets.only(right: 8.0),
              child: CircleAvatar(
                radius: avatarRadius,
                backgroundColor: backgroundColor ?? Colors.grey.shade200,
                child: SvgPicture.asset(
                  asset,
                  height: avatarRadius,
                  width: avatarRadius,
                  // color: svgColor,
                ),
              ),
            );
          }).toList(),
    );
  }
}
