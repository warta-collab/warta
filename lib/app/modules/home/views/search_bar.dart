part of '../../app_modules.dart';

class NewsSearch extends SearchDelegate {
  final controller = Get.find<HomeController>();

  NewsSearch() {
    controller.loadSearchNews(query);
  }

  @override
  List<Widget>? buildActions(BuildContext context) => [
        IconButton(
            onPressed: () {
              if (query.isEmpty)
                close(context, null);
              else
                query = '';
            },
            icon: Icon(Icons.clear))
      ];

  @override
  Widget? buildLeading(BuildContext context) => IconButton(
      onPressed: () => close(context, null), icon: Icon(Icons.arrow_back));

  @override
  Widget buildResults(BuildContext context) {
    return Center(
      child: Padding(
        padding: const EdgeInsets.all(8.0),
        child: SizedBox(
          child: ListView.builder(
            itemCount: controller.searchNews.length,
            itemBuilder: (context, index) {
              final data = controller.searchNews[index];
              return ItemView(data);
            },
          ),
        ),
      ),
    );
  }

  @override
  Widget buildSuggestions(BuildContext context) {
    List<String> suggestions = ['Teknik', 'White Hacker'];
    return ListView.builder(
      itemCount: suggestions.length,
      itemBuilder: (context, index) {
        final suggestion = suggestions[index];
        return ListTile(
            title: Text(suggestion),
            onTap: () {
              query = suggestion;
              controller.loadSearchNews(query);
              showResults(context);
            });
      },
    );
  }
}
