import 'package:do_it/screens/splash_page.dart';
import 'package:do_it/screens/welcome_page.dart';
import 'package:do_it/theme/app_theme.dart';
import 'package:do_it/theme/theme_service.dart';
import 'package:do_it/utils/app_constants.dart';
import 'package:flutter/material.dart';
import 'package:flutter/scheduler.dart';
import 'package:flutter_easyloading/flutter_easyloading.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get_navigation/src/root/get_material_app.dart';
import 'package:get/get_navigation/src/routes/get_route.dart';
import 'package:get/get_navigation/src/routes/transitions_type.dart';
import 'package:overlay_support/overlay_support.dart';

class DoIT extends StatefulWidget {
  const DoIT({super.key});

  @override
  State<DoIT> createState() => _DoITState();
}

class _DoITState extends State<DoIT> {
  late OverlayEntry _overlayEntry;
  bool _isOverlayVisible = false;

  @override
  void initState() {
    super.initState();
    _overlayEntry = _createOverlayEntry();
  }

  OverlayEntry _createOverlayEntry() {
    return OverlayEntry(
      builder:
          (context) => Positioned(
            top: 50.0,
            left: MediaQuery.of(context).size.width * 0.1,
            width: MediaQuery.of(context).size.width * 0.8,
            child: Material(
              elevation: 4.0,
              child: Column(
                children: [
                  const ListTile(title: Text('Overlay Header')),
                  ElevatedButton(
                    onPressed: _hideOverlay,
                    child: const Text('Hide Overlay'),
                  ),
                ],
              ),
            ),
          ),
    );
  }

  void _hideOverlay() {
    if (_isOverlayVisible) {
      SchedulerBinding.instance.addPostFrameCallback((_) {
        if (mounted) {
          _overlayEntry.remove();
          setState(() {
            _isOverlayVisible = false;
          });
        }
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    return ScreenUtilInit(
      designSize: const Size(393, 852),
      minTextAdapt: true,
      splitScreenMode: true,
      child: Builder(
        builder: (context) {
          return OverlaySupport(
            child: GetMaterialApp(
              title: appName,
              initialRoute: SplashPage.routeName,
              debugShowCheckedModeBanner: false,
              builder: EasyLoading.init(),
              getPages: [
                GetPage(
                  name: SplashPage.routeName,
                  page: () => const SplashPage(),
                  transition: Transition.rightToLeftWithFade,
                ),
                GetPage(
                  name: WelcomePage.routeName,
                  page: () => const WelcomePage(),
                  transition: Transition.rightToLeftWithFade,
                ),
              ],
              theme: AppTheme.light,
              darkTheme: AppTheme.dark,
              themeMode: ThemeService().getThemeMode(),
            ),
          );
        },
      ),
    );
  }
}
