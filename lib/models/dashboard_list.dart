import 'package:flutter/material.dart';

final List<Map<String, dynamic>> dashboardStats = [
  {
    'svgAsset': 'assets/svgs/project.svg',
    'number': '14',
    'label': 'Projects',
    'backgroundColor': const Color.fromRGBO(252, 244, 240, 1),
    'avatarColor': const Color.fromRGBO(247, 163, 37, 1),
    'svgColor': Colors.white,
  },
  {
    'svgAsset': 'assets/svgs/task.svg',
    'number': '24',
    'label': 'Tasks',
    'backgroundColor': const Color.fromRGBO(244, 249, 255, 1),
    'avatarColor': const Color.fromRGBO(33, 122, 192, 1),
    'svgColor': Colors.white,
  },
  {
    'svgAsset': 'assets/svgs/check.svg',
    'number': '18',
    'label': 'Completed Tasks',
    'backgroundColor': const Color.fromRGBO(233, 255, 240, 1),
    'avatarColor': const Color.fromRGBO(18, 183, 106, 1),
    'svgColor': Colors.white,
  },
  {
    'svgAsset': 'assets/svgs/overdue.svg',
    'number': '7',
    'label': 'OverDue Tasks',
    'backgroundColor': const Color.fromRGBO(244, 241, 246, 1),
    'avatarColor': const Color.fromRGBO(209, 209, 209, 1),
    'svgColor': Colors.black,
  },
];
