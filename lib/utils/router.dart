import 'package:flutter/material.dart';

void navigateToPage(BuildContext context, Widget page) {
  Navigator.push(
    context,
    PageRouteBuilder(
      pageBuilder: (context, animation, secondaryAnimation) => page,
      transitionsBuilder: (context, animation, secondaryAnimation, child) {
        const begin = Offset(1.0, 0.0);
        const end = Offset.zero;
        const curve = Curves.easeInOut;

        var tween = Tween(
          begin: begin,
          end: end,
        ).chain(CurveTween(curve: curve));
        var offsetAnimation = animation.drive(tween);

        return SlideTransition(position: offsetAnimation, child: child);
      },
    ),
  );
}

void navigateToNextPageWithoutHistory(BuildContext context, String page) {
  Navigator.pushReplacementNamed(context, page);
}

void navigateToPageOutOfNavBar(BuildContext context, Widget page) {
  Navigator.of(
    context,
    rootNavigator: true,
  ).push(MaterialPageRoute(builder: (context) => page));
}
