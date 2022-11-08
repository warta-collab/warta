part of '../../app_modules.dart';

class SplashBinding extends Bindings {
  @override
  void dependencies() {
    Get.put(
      SplashController(),
    );
  }
}
