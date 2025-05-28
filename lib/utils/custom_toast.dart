import 'package:flutter_easyloading/flutter_easyloading.dart';

class ToastHelper {
  static void showToast(
    String message, {
    EasyLoadingToastPosition position = EasyLoadingToastPosition.bottom,
    int duration = 2,
  }) {
    EasyLoading.showToast(
      message,
      toastPosition: position,
      duration: Duration(seconds: duration),
    );
  }

  static void showCenterToast(
    String message, {
    EasyLoadingToastPosition position = EasyLoadingToastPosition.center,
    Duration duration = const Duration(seconds: 2),
  }) {
    EasyLoading.showToast(message, toastPosition: position);
  }

  static void showTopToast(
    String message, {
    EasyLoadingToastPosition position = EasyLoadingToastPosition.top,
    int duration = 2,
  }) {
    EasyLoading.showToast(
      message,
      toastPosition: position,
      duration: Duration(seconds: duration),
    );
  }
}
