import 'package:device_info_plus/device_info_plus.dart';
import 'package:flutter/material.dart';

Future<double> getInchWidth(
    BuildContext context, BoxConstraints constraints, Axis axis) async {
  final mediaQuery = MediaQuery.of(context);
  final dpr = mediaQuery.devicePixelRatio;

  switch (Theme.of(context).platform) {
    case TargetPlatform.android:
      final androidInfo = await DeviceInfoPlugin().androidInfo;
      return androidInfo.displayMetrics.yDpi / dpr;
    case TargetPlatform.fuchsia:
      return 240;
    case TargetPlatform.iOS:
      return 240;
    case TargetPlatform.linux:
      return 240;
    case TargetPlatform.macOS:
      return 132;
    case TargetPlatform.windows:
      return 240;
  }
}
