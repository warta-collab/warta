part of '../../app_modules.dart';

class HomeView extends GetView<HomeController> {
  const HomeView({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
          leadingWidth: 100,
          leading: const Image(
            image: AssetImage('assets/img/warta lo.png'),
            width: 100,
          ),
          bottom: TabBar(
              controller: controller.tabController,
              isScrollable: true,
              tabs: controller.tabKtgr),
          actions: [
            IconButton(
                onPressed: () {
                  showSearch(
                    context: context,
                    delegate: NewsSearch(),
                  );
                },
                icon: const Icon(Icons.search)),
            PopupMenuButton(
                icon: Icon(Icons.menu),
                itemBuilder: (context) {
                  return [
                    PopupMenuItem<String>(
                      value: "id",
                      child: Container(
                        color: (controller.negara == "id")
                            ? Colors.black12
                            : Colors.white,
                        child: Padding(
                          padding: const EdgeInsets.all(8.0),
                          child: Row(
                            children: <Widget>[
                              Image(
                                  height: 25,
                                  width: 25,
                                  image: AssetImage('assets/img/id.png')),
                              SizedBox(width: 10),
                              Text("Indonesia"),
                            ],
                          ),
                        ),
                      ),
                    ),
                    PopupMenuItem<String>(
                      value: "",
                      child: Container(
                        color: (controller.negara != "id")
                            ? Colors.black12
                            : Colors.white,
                        child: Padding(
                          padding: const EdgeInsets.all(8.0),
                          child: Row(
                            children: <Widget>[
                              Image(
                                  height: 25,
                                  width: 25,
                                  image: AssetImage('assets/img/global.png')),
                              SizedBox(width: 10),
                              Text("Global"),
                            ],
                          ),
                        ),
                      ),
                    ),
                    PopupMenuItem<int>(
                      value: 0,
                      child: Padding(
                        padding: const EdgeInsets.all(8.0),
                        child: Row(
                          children: <Widget>[
                            Icon(Icons.logout),
                            SizedBox(width: 10),
                            Text("Logout"),
                          ],
                        ),
                      ),
                    ),
                  ];
                },
                onSelected: (value) {
                  if (value == "id") {
                    controller.negara.value = "id";
                    controller._onRefresh();
                  } else if (value == "") {
                    controller.negara.value = "";
                    controller._onRefresh();
                  } else if (value == 2) {
                    print("Logout menu is selected.");
                  }
                }),
          ]),
      body: TabBarView(controller: controller.tabController, children: [
        ListKategori("general"),
        ListKategori("business"),
        ListKategori("science"),
        ListKategori("technology"),
        ListKategori("health"),
        ListKategori("sports"),
        ListKategori("Entertainment"),
      ]),
    );
  }
}
