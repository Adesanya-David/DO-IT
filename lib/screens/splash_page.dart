// ignore_for_file: use_build_context_synchronously
import 'package:do_it/screens/welcome_page.dart';
import 'package:do_it/utils/logo_widget.dart';
import 'package:do_it/utils/router.dart';
import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';

class SplashPage extends StatefulWidget {
  static const String routeName = "/splashPage";
  const SplashPage({super.key});

  @override
  State<SplashPage> createState() => _SplashPageState();
}

class _SplashPageState extends State<SplashPage> {
  @override
  void initState() {
    super.initState();

    _checkFirstTime().then((isFirstTime) {
      Future.delayed(const Duration(seconds: 2), () {
        if (isFirstTime) {
          navigateToNextPageWithoutHistory(context, WelcomePage.routeName);
        } else {
          navigateToNextPageWithoutHistory(context, WelcomePage.routeName);
        }
      });
    });
  }

  Future<bool> _checkFirstTime() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    bool? isFirstTime = prefs.getBool('isFirstTime') ?? true;
    if (isFirstTime) {
      await prefs.setBool('isFirstTime', false);
    }
    return isFirstTime;
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [DoItLogo()],
      ),
    );
  }
}
