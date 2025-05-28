import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class CircularPercentIndicator extends StatelessWidget {
  final double percent;
  final double radius;
  final double lineWidth;
  final Color progressColor;
  final Color backgroundColor;
  final TextStyle? textStyle;

  const CircularPercentIndicator({
    super.key,
    required this.percent,
    this.radius = 120,
    this.lineWidth = 4,
    this.progressColor = Colors.blue,
    this.backgroundColor = Colors.grey,
    this.textStyle,
  });

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: radius * 2,
      child: Stack(
        alignment: Alignment.center,
        children: [
          CircularProgressIndicator(
            value: 1.0,
            strokeWidth: lineWidth,
            valueColor: AlwaysStoppedAnimation<Color>(
              Color.fromRGBO(89, 178, 0, 1),
            ),
          ),

          CircularProgressIndicator(
            value: percent,
            strokeWidth: lineWidth,
            valueColor: AlwaysStoppedAnimation<Color>(progressColor),
            backgroundColor: Color.fromRGBO(214, 255, 174, 1),
          ),

          Text(
            '${(percent * 100).toInt()}%',
            style:
                textStyle ??
                TextStyle(
                  fontSize: 10.sp,
                  fontWeight: FontWeight.bold,
                  color: progressColor,
                ),
          ),
        ],
      ),
    );
  }
}
