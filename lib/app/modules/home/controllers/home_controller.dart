part of '../../app_modules.dart';

class HomeController extends GetxController {
  NewsProvider newsProvider = NewsProvider();
  var news = List<News>.empty().obs;

  @override
  void onInit() {
    loadNews();
    super.onInit();
  }

  @override
  void onReady() {
    super.onReady();
  }

  // @override
  // void onClose() {
  //   super.onClose();
  // }

  Future<void> loadNews() async {
    Response response = await newsProvider.getTopNews();

    // print(response.statusCode);
    if (response.statusCode == 200) {
      Map<String, dynamic> json = jsonDecode(jsonEncode(response.body));
      List<dynamic> body = json['articles'];
      List<News> articles =
          body.map((dynamic item) => News.fromJson(item)).toList();
      news.addAll(articles);
    }
  }
}
