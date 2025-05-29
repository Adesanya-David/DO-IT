import 'package:do_it/screens/auth/signin_page.dart';
import 'package:do_it/screens/auth/signup_page.dart';
import 'package:do_it/utils/app_colors.dart';
import 'package:do_it/utils/custom_button.dart';
import 'package:do_it/utils/custom_text.dart';
import 'package:do_it/utils/logo_widget.dart';
import 'package:do_it/utils/page_wrapper.dart';
import 'package:do_it/utils/router.dart';
import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import 'widgets/circular_image_shadow_widget.dart';

class WelcomePage extends StatefulWidget {
  static const String routeName = "/welcomePage";
  const WelcomePage({super.key});

  @override
  State<WelcomePage> createState() => _WelcomePageState();
}

class _WelcomePageState extends State<WelcomePage> {
  @override
  Widget build(BuildContext context) {
    return PageWrapper(
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.center,
        children: <Widget>[
          SizedBox(height: 51.h),
          DoItLogo(),
          SizedBox(height: 100.h),
          CircularImageWithShadow(imagePath: 'assets/svgs/Group 266.svg'),
          Stack(
            alignment: Alignment.topCenter,
            children: [
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  CircularImageWithShadow(
                    imagePath: 'assets/svgs/Group 267.svg',
                  ),
                  CircularImageWithShadow(
                    imagePath: 'assets/svgs/Group 268.svg',
                  ),
                ],
              ),
              SizedBox(
                width: 280,
                height: 200,
                child: ClipRRect(
                  borderRadius: BorderRadius.circular(12),
                  child: Image.asset(
                    'assets/images/817b4393c7f30ddf7909351924a54fde8a13644e.png',
                    fit: BoxFit.cover,
                  ),
                ),
              ),
            ],
          ),
          SizedBox(height: 40.h),
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              BoldText(
                text: 'Just ',
                fontFamily: 'Mark Pro',
                fontSize: 24,
                color: Colors.black,
                fontWeight: FontWeight.w900,
              ),
              BoldText(
                text: 'DO-IT',
                fontFamily: 'Mark Pro',
                fontSize: 24,
                color: CustomColors.primaryColor,
                fontWeight: FontWeight.w700,
              ),
            ],
          ),
          SizedBox(height: 17),
          CustomButton(
            label: 'Create Account',
            onPressed: () {
              navigateToPage(context, SignUpPage());
            },
          ),
          SizedBox(height: 7),
          Center(
            child: RichText(
              text: TextSpan(
                children: [
                  const TextSpan(
                    text: 'Already have an account? ',

                    style: TextStyle(
                      color: Color.fromRGBO(218, 218, 218, 1),
                      fontFamily: 'Sfpro',
                    ),
                  ),
                  TextSpan(
                    text: 'Sign In',
                    style: const TextStyle(
                      fontWeight: FontWeight.bold,
                      color: appColor,
                      fontFamily: 'Mark Pro',
                    ),
                    recognizer:
                        TapGestureRecognizer()
                          ..onTap = () {
                            navigateToPage(context, SigninPage());
                          },
                  ),
                ],
              ),
            ),
          ),
          // SizedBox(height: 137.h),
        ],
      ),
    );
  }
}
