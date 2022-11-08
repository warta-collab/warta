part of '../app_data.dart';

class NewsProvider extends GetConnect {
  @override
  void onInit() {
    httpClient.baseUrl = AppConfig.API_ENDPOINT;

    httpClient.defaultDecoder = (map) {
      if (map is Map<String, dynamic>) return News.fromJson(map);
      if (map is List) return map.map((item) => News.fromJson(item)).toList();
    };

    httpClient.addRequestModifier<void>((request) {
      request.headers['Authorization'] = 'Bearer ${AppConfig.Key}';
      return request;
    });
  }

  Future<Response> getTopNews() =>
      // get<List<News>>('v2/top-headlines?country=id');
      get("${AppConfig.API_ENDPOINT}v2/top-headlines?country=id", headers: {
        "Content-Type": "application/json",
        "Authorization": "Bearer ${AppConfig.Key}",
      });
}
