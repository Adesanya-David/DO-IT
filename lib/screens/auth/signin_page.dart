// ignore_for_file: use_build_context_synchronously

import 'package:do_it/screens/auth/signup_page.dart';
import 'package:do_it/utils/app_colors.dart';
import 'package:do_it/utils/app_constants.dart';
import 'package:do_it/utils/custom_appbar.dart';
import 'package:do_it/utils/custom_bordered_textformfield.dart';
import 'package:do_it/utils/custom_button.dart';
import 'package:do_it/utils/custom_form_validator.dart';
import 'package:do_it/utils/custom_text.dart';
import 'package:do_it/utils/custom_toast.dart';
import 'package:do_it/utils/logo_widget.dart';
import 'package:do_it/utils/page_wrapper.dart';
import 'package:do_it/utils/router.dart';
import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/flutter_svg.dart';

import '../../viewmodel/biometric_vm.dart';
import '../widgets/bottom_navbar.dart';

class SigninPage extends StatefulWidget {
  static const String routeName = "/signin";
  const SigninPage({super.key});

  @override
  State<SigninPage> createState() => _SigninPageState();
}

class _SigninPageState extends State<SigninPage> {
  @override
  Widget build(BuildContext context) {
    final authService = BiometricVM();
    return PageWrapper(
      appBar: CustomAppBar(text: ''),
      child: SingleChildScrollView(
        scrollDirection: Axis.vertical,
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            SizedBox(height: 99.h),
            DoItLogo(),
            SizedBox(height: 18),
            Center(
              child: BoldText(
                text: 'Welcome Back!',
                fontFamily: 'Mark Pro',
                fontSize: 24,
                fontWeight: FontWeight.w500,
              ),
            ),
            SizedBox(height: 36.h),
            CustomBorderedTextFormField(
              title: '',
              hintText: 'Email',
              validator: (value) => FormValidator.validateEmail(value),
            ),
            SizedBox(height: 16.h),
            CustomBorderedTextFormField(
              title: '',
              obscureText: true,
              hintText: 'Password',
              validator: (value) => FormValidator.validatePassword(value),
            ),
            SizedBox(height: 8.h),
            InkWell(
              onTap: () {
                ToastHelper.showToast(unavailable);
              },
              child: CustomText(
                text: 'Forgot Password?',
                color: Color.fromRGBO(129, 129, 129, 1),
              ),
            ),
            SizedBox(height: 100.h),
            Row(
              children: [
                Expanded(
                  child: CustomButton(
                    label: 'Sign In',
                    onPressed: () {
                      navigateToPage(context, BottomNavBar(selectedIndex: 0));
                    },
                  ),
                ),
                SizedBox(width: 16.w),
                InkWell(
                  onTap: () async {
                    final isAuthenticated = await authService.authenticate();
                    if (isAuthenticated) {
                      navigateToPage(context, BottomNavBar(selectedIndex: 0));
                    } else {
                      ToastHelper.showToast('Authentication failed');
                    }
                  },
                  child: Container(
                    padding: EdgeInsets.all(8),
                    height: 56.h,
                    width: 56.h,
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(16),
                      border: Border.all(color: blueBorderColor),
                    ),
                    child: SvgPicture.asset(
                      'assets/svgs/ion_finger-print-outline.svg',
                    ),
                  ),
                ),
              ],
            ),
            SizedBox(height: 12.h),
            Center(
              child: RichText(
                text: TextSpan(
                  children: [
                    const TextSpan(
                      text: 'Don\'t have an account? ',

                      style: TextStyle(
                        color: Color.fromRGBO(218, 218, 218, 1),
                        fontFamily: 'Sfpro',
                      ),
                    ),
                    TextSpan(
                      text: 'Create Account',
                      style: const TextStyle(
                        fontWeight: FontWeight.bold,
                        color: appColor,
                        fontFamily: 'Mark Pro',
                      ),
                      recognizer:
                          TapGestureRecognizer()
                            ..onTap = () {
                              navigateToPage(context, SignUpPage());
                            },
                    ),
                  ],
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
