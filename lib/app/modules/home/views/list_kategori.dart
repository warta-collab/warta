part of '../../app_modules.dart';

class ListKategori extends GetView<HomeController> {
  final String ktgori;
  ListKategori(this.ktgori);

  @override
  Widget build(BuildContext context) {
    controller.ktgr.value = ktgori;
    return RefreshIndicator(
      onRefresh: controller._onRefresh,
      child: Obx(
        () => controller.news.isEmpty
            ? Center(
                child: Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: SizedBox(
                    child: ListView.builder(
                      itemCount: 8,
                      itemBuilder: (_, __) {
                        return item_view_shimmer();
                      },
                    ),
                  ),
                ),
              )
            : Center(
                child: Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: SizedBox(
                    child: ListView.builder(
                      itemCount: controller.news.length,
                      itemBuilder: (context, index) {
                        final data = controller.news[index];
                        return ItemView(data, ktgori);
                      },
                    ),
                  ),
                ),
              ),
      ),
    );
  }
}
