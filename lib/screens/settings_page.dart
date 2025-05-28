import 'package:do_it/utils/custom_text.dart';
import 'package:do_it/utils/page_wrapper.dart';
import 'package:flutter/material.dart';

class SettingsPage extends StatefulWidget {
  const SettingsPage({super.key});

  @override
  State<SettingsPage> createState() => _SettingsPageState();
}

class _SettingsPageState extends State<SettingsPage> {
  @override
  Widget build(BuildContext context) {
    return PageWrapper(
      // appBar: CustomAppBar(text: 'text'),
      child: Column(children: [CustomText(text: 'Settings')]),
    );
  }
}
