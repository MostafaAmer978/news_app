import 'package:news_app/models/news_data_model.dart';
import 'package:news_app/models/source_response.dart';

abstract class HomeRepository {
  Future<SourceResponse> getSources(String categoryId);

  Future<NewsDataModel> getNewsData(String sourceId);
}