
import 'package:news_app/models/news_data_model.dart';
import 'package:news_app/models/source_response.dart';
import 'package:news_app/network/remote/api_manager.dart';
import 'package:news_app/repository/repository.dart';

class RemoteDataSourceImpl implements HomeRepository {
  ApiManager apiManager;
  RemoteDataSourceImpl({required this.apiManager});
  @override
  Future<NewsDataModel> getNewsData(String sourceId) async {
    var response = await apiManager.getNewsData(sourceId);
    return response ;
  }

  @override
  Future<SourceResponse> getSources(String categoryId) async {
   var response = await apiManager.getSources(categoryId);
   return response ;
  }
}
