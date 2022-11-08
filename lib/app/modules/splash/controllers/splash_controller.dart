part of '../../app_modules.dart';

class SplashController extends GetxController {
  //TODO: Implement SplashController

  @override
  void onInit() {
    print('splash on init');
    super.onInit();
  }

  @override
  void onReady() {
    super.onReady();
    redirectToHome();
  }

  @override
  void onClose() {
    super.onClose();
  }

  Future<void> redirectToHome() async {
    Timer(const Duration(seconds: 2), () => Get.offAllNamed(Routes.HOME));
  }
}
