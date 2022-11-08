part of '../../app_modules.dart';

class HomeView extends GetView<HomeController> {
  const HomeView({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
          // leading: const Image(
          //   image: AssetImage('assets/img/profil1.png'),
          // ),
          leadingWidth: 100,
          leading: const Image(
            image: AssetImage('assets/img/warta lo.png'),
            width: 100,
          ),
          actions: [
            IconButton(onPressed: () => {}, icon: const Icon(Icons.search)),
            IconButton(onPressed: () => {}, icon: const Icon(Icons.menu)),
          ]),
      body: Obx(
        () => controller.news.isEmpty
            ? const Center(
                child: Text('BELUM ADA DATA'),
              )
            : ListView.builder(
                itemCount: controller.news.length,
                itemBuilder: (context, index) {
                  final data = controller.news[index];
                  return ItemView(data);
                },
              ),
      ),
    );
  }
}
