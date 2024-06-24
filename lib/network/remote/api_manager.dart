import 'dart:convert';
import 'package:http/http.dart' as http;
import 'package:news_app/models/news_data_model.dart';
import 'package:news_app/models/source_response.dart';

class ApiManager {
  /// GetSources
   Future<SourceResponse> getSources(String categoryId) async {
    Uri url = Uri.https("newsapi.org", "/v2/top-headlines/sources", {
      "apiKey": "59723f7b42ad41d0bff602290a709e69",
      "category": categoryId
    });
    http.Response response = await http.get(url);
    if (response.statusCode == 200) {
      var responseBody = response.body;  // String
      var json = jsonDecode(responseBody);  // String => Json
      return SourceResponse.fromJson(json);  // Json => Object
    } else {
      throw Exception("Error in Fetching to getSources");
    }
  }

  /// GetNewsData
    Future<NewsDataModel> getNewsData(String sourceId) async {
    Uri url = Uri.https("newsapi.org", "/v2/everything", {
      "apiKey": "59723f7b42ad41d0bff602290a709e69",
      "sources": sourceId,
    });
    http.Response response = await http.get(url);
    if (response.statusCode == 200) {
      var responseBody = response.body;  // String
      var json = jsonDecode(responseBody);  // String => Json
      return NewsDataModel.fromJson(json);  // Json => Object
    } else {
      throw Exception("Error in Fetching to getNewsData");
    }
  }

  /// getSearch
  static Future<NewsDataModel> getSearch(String query) async {
    Uri url = Uri.https("newsapi.org", "/v2/everything", {
      "q": query,
      "apiKey": "59723f7b42ad41d0bff602290a709e69",
    });
    http.Response response = await http.get(url);
    if (response.statusCode == 200) {
      var json = jsonDecode(response.body);
      return NewsDataModel.fromJson(json);
    } else {
      throw Exception("Error in Fetching to getSearch");
    }
  }
}
