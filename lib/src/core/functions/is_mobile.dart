import 'package:flutter/material.dart';

class IsItPhone {
  IsItPhone._();

  static bool getDeviceType() {
    final data = MediaQueryData.fromView(WidgetsBinding.instance.window);
    return data.size.shortestSide < 600 ? true : false;
  }
}
