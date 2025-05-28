import 'package:do_it/utils/custom_button.dart';
import 'package:do_it/utils/custom_text.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/svg.dart';

class CustomBackAppBar extends StatelessWidget {
  final String text;
  final IconData? icon;
  final Function()? onPressed;

  const CustomBackAppBar({
    required this.text,
    this.icon,
    this.onPressed,
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        CustomBackButton(onTap: onPressed),
        const SizedBox(width: 10),
        CustomText(text: text),
      ],
    );
  }
}

class CustomAppBar extends StatelessWidget implements PreferredSizeWidget {
  final String text;
  final IconData? icon;
  final Function()? onPressed;

  const CustomAppBar({
    required this.text,
    this.icon,
    this.onPressed,
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return AppBar(
      titleSpacing: 6,
      backgroundColor: Colors.white,
      title: Padding(
        padding: const EdgeInsets.all(8.0),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.start,
          children: [
            InkWell(
              onTap:
                  onPressed ??
                  () {
                    Navigator.pop(context);
                  },
              child: SvgPicture.asset(
                'assets/svgs/Button.svg',
                height: 40.spMax,
              ),
            ),
            const SizedBox(width: 10),
            BoldText(text: text, color: Colors.black),
          ],
        ),
      ),
      automaticallyImplyLeading: false,
    );
  }

  @override
  Size get preferredSize => const Size.fromHeight(kToolbarHeight);
}

class CustomWidgetAppBar extends StatelessWidget
    implements PreferredSizeWidget {
  final Widget content;
  final int? height;

  const CustomWidgetAppBar({super.key, required this.content, this.height});

  @override
  Widget build(BuildContext context) {
    return AppBar(
      titleSpacing: 0.0,
      title: content,
      automaticallyImplyLeading: false,
      backgroundColor: Colors.white,
      titleTextStyle: const TextStyle(color: Colors.black),
      foregroundColor: Colors.white,
      elevation: 0.0,
      toolbarHeight: 66,
    );
  }

  @override
  Size get preferredSize => Size.fromHeight(kToolbarHeight + (height ?? 10));
}
