part of '../../app_modules.dart';

class ItemView extends GetView {
  final data;
  ItemView(this.data);

  @override
  Widget build(BuildContext context) {
    return Card(
      child: ListTile(
        horizontalTitleGap: 10,
        leading: (data.urlToImage == null)
            ? const Image(image: AssetImage('assets/img/no image.png'))
            : Image.network(data.urlToImage),
        minLeadingWidth: 100,
        title: Text(data.title),
        subtitle: Text(data.publishedAt),
        onTap: () {
          Get.snackbar('Berita', 'Anda memilih berita');
        },
      ),
    );
  }
}
