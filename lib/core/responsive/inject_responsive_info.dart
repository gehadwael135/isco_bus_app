
import 'device_screen_info.dart';

extension Resposive on num {
  double get h {
    return DeviceScreenInfo.screenHeight() * this;
  }

  double get w {
    return DeviceScreenInfo.screenWidth() * this;
  }

}