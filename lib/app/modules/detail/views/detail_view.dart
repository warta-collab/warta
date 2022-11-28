part of '../../app_modules.dart';

class DetailView extends GetView<DetailController> {
  const DetailView({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(controller.source),
        centerTitle: true,
      ),
      body: Center(
        child: WebView(
          initialUrl: controller.url,
          javascriptMode: JavascriptMode.unrestricted,
          onWebViewCreated: (WebViewController webViewController) {
            controller.webviewcontroller = webViewController;
          },
        ),
      ),
    );
  }
}
