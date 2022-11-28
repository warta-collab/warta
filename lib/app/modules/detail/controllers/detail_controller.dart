part of '../../app_modules.dart';

class DetailController extends GetxController {
  late WebViewController webviewcontroller;
  late String url = "";
  late String source = "";

  @override
  void onInit() {
    super.onInit();
    url = Get.arguments[0]["url"];
    source = Get.arguments[0]["source"];
  }

  @override
  void onReady() {
    super.onReady();
  }

  @override
  void onClose() {
    super.onClose();
  }
}
