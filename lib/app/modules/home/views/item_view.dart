part of '../../app_modules.dart';

class ItemView extends GetView {
  final data;
  String cek;
  ItemView(this.data, [this.cek = ""]);

  @override
  Widget build(BuildContext context) {
    final publish = DateTime.parse(data.publishedAt);
    String date = DateFormat('dd-MM-yyyy hh:mm').format(publish);
    return InkWell(
      onTap: () {
        //     // Get.snackbar('Berita', 'Anda memilih berita');
        Get.toNamed(Routes.DETAIL, arguments: [
          {"url": data.url, "source": data.source.name}
        ]);
      },
      child: Padding(
        padding: const EdgeInsets.all(5.0),
        child: Container(
          height: 135.0,
          decoration: BoxDecoration(
            color: Colors.white,
            borderRadius: BorderRadius.all(Radius.circular(10)),
            boxShadow: [
              BoxShadow(
                color: Colors.grey,
                offset: Offset(0.0, 1.0), //(x,y)
                blurRadius: 6.0,
              ),
            ],
          ),
          child: Padding(
            padding: const EdgeInsets.all(8.0),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.start,
              children: <Widget>[
                Container(
                  height: 100,
                  width: 135,
                  decoration: BoxDecoration(
                    color: Colors.white,
                    borderRadius: BorderRadius.all(Radius.circular(10)),
                  ),
                  child: (data.urlToImage == null)
                      ? const Image(
                          image: AssetImage('assets/img/no image.png'))
                      : ClipRRect(
                          borderRadius: BorderRadius.circular(10),
                          child: Image.network(
                            data.urlToImage,
                            fit: BoxFit.fill,
                            errorBuilder: (context, error, stackTrace) => Text(
                              'NOT FOUND',
                              textAlign: TextAlign.center,
                            ),
                          ),
                        ),
                ),
                SizedBox(
                  width: Get.width * 0.05,
                ),
                SingleChildScrollView(
                  child: Padding(
                    padding: const EdgeInsets.all(2.0),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      // mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: <Widget>[
                        Container(
                          width: Get.width * 0.5,
                          child: Text(
                            data.title,
                            style: TextStyle(fontWeight: FontWeight.bold),
                          ),
                        ),
                        SizedBox(
                          height: 25,
                        ),
                        Container(
                          child: Text(
                            date,
                            style: TextStyle(
                                fontSize: 11, fontStyle: FontStyle.italic),
                          ),
                        ),
                        Container(
                          child: Text(
                            data.source.name,
                            style: TextStyle(
                                fontSize: 11, fontWeight: FontWeight.bold),
                          ),
                        ),
                      ],
                    ),
                  ),
                )
              ],
            ),
          ),
        ),
      ),
    );
  }
}
