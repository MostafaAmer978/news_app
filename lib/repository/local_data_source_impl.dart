import 'package:news_app/models/news_data_model.dart';
import 'package:news_app/models/source_response.dart';
import 'package:news_app/repository/repository.dart';

class LocalDataSourceImpl implements HomeRepository{

  @override
  Future<SourceResponse> getSources(String categoryId) {
    // TODO: implement getSources
    throw UnimplementedError();
  }

  @override
  Future<NewsDataModel> getNewsData(String sourceId) {
    // TODO: implement getNewsData
    throw UnimplementedError();
  }

}