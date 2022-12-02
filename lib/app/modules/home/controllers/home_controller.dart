part of '../../app_modules.dart';

class HomeController extends GetxController {
  NewsProvider newsProvider = NewsProvider();
  late TabController tabController;
  var news = List<News>.empty().obs;
  var searchNews = List<News>.empty().obs;
  var ktgr = "".obs;
  var negara = "id".obs;
  List<Tab> tabKtgr = <Tab>[
    Tab(
      text: 'General',
    ),
    Tab(
      text: 'Business',
    ),
    Tab(
      text: 'Science',
    ),
    Tab(
      text: 'Technology',
    ),
    Tab(
      text: 'Health',
    ),
    Tab(
      text: 'Sports',
    ),
    Tab(
      text: 'Entertainment',
    ),
  ];

  @override
  void onInit() {
    super.onInit();
    tabController = TabController(length: tabKtgr.length, vsync: this);
    tabController.addListener(_onTabChanged);
    loadNews();
  }

  @override
  void onReady() {
    super.onReady();
  }

  @override
  void onClose() {
    super.onClose();
    tabController.dispose();
  }

  void _onTabChanged() {
    if (!tabController.indexIsChanging) {
      news.clear();
      // loadSearchNews("tek");
      loadNews();
      print("indeks berubah $ktgr");
    }
  }

  Future<void> _onRefresh() async {
    news.clear();
    await loadNews();
  }

  void logout() {
    _googleSignIn.disconnect().then((value) {
      if (currentUser == null) Get.offAllNamed(Routes.LOGIN);
    });
  }

  Future<void> loadNews() async {
    Response response = await newsProvider.getTopNews(negara, ktgr);

    if (response.statusCode == 200) {
      Map<String, dynamic> json = jsonDecode(jsonEncode(response.body));
      List<dynamic> body = json['articles'];
      List<News> articles =
          body.map((dynamic item) => News.fromJson(item)).toList();
      news.addAll(articles);
    }
  }

  Future<void> loadSearchNews(String qword) async {
    Response response = await newsProvider.getNewsByQword(qword);

    if (response.statusCode == 200) {
      Map<String, dynamic> json = jsonDecode(jsonEncode(response.body));
      List<dynamic> body = json['articles'];
      List<News> articles =
          body.map((dynamic item) => News.fromJson(item)).toList();
      searchNews.addAll(articles);
    }
  }
}
