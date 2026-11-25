import 'package:flutter/material.dart';

class DeviceScreenInfo {
  static final MediaQueryData _mediaQueryData = MediaQueryData.fromView(
    WidgetsBinding.instance.platformDispatcher.views.first,
  );
  static double screenHeight() {
    return _mediaQueryData.size.height;
  }

  static double screenWidth() {
    return _mediaQueryData.size.width;
  }

 
  
}