import 'package:do_it/utils/app_colors.dart';
import 'package:do_it/utils/app_constants.dart';
import 'package:do_it/utils/custom_appbar.dart';
import 'package:do_it/utils/custom_bordered_textformfield.dart';
import 'package:do_it/utils/custom_button.dart';
import 'package:do_it/utils/custom_text.dart';
import 'package:do_it/utils/custom_toast.dart';
import 'package:do_it/utils/page_wrapper.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:intl_phone_number_input/intl_phone_number_input.dart';

import '../../utils/custom_form_validator.dart';

class SignUpPage extends StatefulWidget {
  static const String routeName = "/signUpPage";
  const SignUpPage({super.key});

  @override
  State<SignUpPage> createState() => _SignUpPageState();
}

class _SignUpPageState extends State<SignUpPage> {
  String initialCountry = 'US';
  String? phoneCode;
  @override
  Widget build(BuildContext context) {
    return PageWrapper(
      appBar: CustomAppBar(text: ''),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          BoldText(
            text: 'Create\nAccount',
            fontFamily: 'SF Pro Display',
            fontWeight: FontWeight.w600,
            fontSize: 24.spMax,
          ),
          SizedBox(height: 16.h),
          RichText(
            text: TextSpan(
              children: [
                const TextSpan(
                  text: 'Please fill the details below to \ncreate a ',

                  style: TextStyle(color: Colors.black, fontFamily: 'Mark Pro'),
                ),
                TextSpan(
                  text: 'Do-IT',
                  style: const TextStyle(
                    fontWeight: FontWeight.bold,
                    color: appColor,
                    fontFamily: 'Mark Pro',
                    letterSpacing: -0.24,
                  ),
                ),
                const TextSpan(
                  text: ' account',

                  style: TextStyle(color: Colors.black, fontFamily: 'Mark Pro'),
                ),
              ],
            ),
          ),
          SizedBox(height: 24.h),
          CustomBorderedTextFormField(
            title: '',
            hintText: 'Name',
            validator: (value) => FormValidator.validateRequired(value, 'Name'),
          ),
          SizedBox(height: 24.h),
          CustomBorderedTextFormField(
            title: '',
            hintText: 'Email',
            validator: (value) => FormValidator.validateEmail(value),
          ),
          SizedBox(height: 24.h),
          Container(
            padding: EdgeInsets.only(left: 10.w),
            child: InternationalPhoneNumberInput(
              onInputChanged: (PhoneNumber number) {
                phoneCode = number.phoneNumber;
              },
              selectorConfig: const SelectorConfig(
                selectorType: PhoneInputSelectorType.BOTTOM_SHEET,
              ),
              ignoreBlank: false,
              autoValidateMode: AutovalidateMode.onUserInteraction,

              initialValue: PhoneNumber(isoCode: initialCountry),
              searchBoxDecoration: InputDecoration(
                hintText: 'Search',
                prefixIcon: Icon(CupertinoIcons.search, size: 18.w),
                contentPadding: EdgeInsets.all(14.w),
                enabledBorder: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(10),
                  borderSide: BorderSide(
                    color: Color.fromRGBO(233, 235, 238, 1),
                    width: 1.5,
                  ),
                ),
                focusedBorder: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(10.0),
                  borderSide: BorderSide(
                    color: CustomColors.primaryColor,
                    width: 1.w,
                  ),
                ),
              ),
              inputDecoration: InputDecoration(
                hintText: 'Mobile Number',
                contentPadding: EdgeInsets.all(14.w),
                enabledBorder: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(10),
                  borderSide: BorderSide(
                    color: Color.fromRGBO(233, 235, 238, 1),
                    width: 1.5,
                  ),
                ),
                focusedBorder: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(10.0),
                  borderSide: BorderSide(
                    color: CustomColors.primaryColor,
                    width: 1.w,
                  ),
                ),
              ),
            ),
          ),
          SizedBox(height: 24.h),
          CustomBorderedTextFormField(
            title: '',
            obscureText: true,
            hintText: 'Password',
            validator: (value) => FormValidator.validatePassword(value),
          ),
          SizedBox(height: 68.h),
          CustomButton(label: 'Create Account', onPressed: () {}),
          SizedBox(height: 12.h),
          Center(
            child: InkWell(
              onTap: () {
                ToastHelper.showToast(unavailable);
              },
              child: CustomText(
                text: 'Privacy Policy',
                decoration: TextDecoration.underline,
                color: greyTextColor,
                fontSize: 12,
              ),
            ),
          ),
        ],
      ),
    );
  }
}
