import 'package:waffarha_task/core/networking/api_helper.dart';
import 'package:waffarha_task/features/home/data/model/photo_model.dart';

abstract class HomeRemoteDataSources {
  Future<List<PhotoModel>> getPhotos();
}

class HomeRemoteDataSourcesImpl implements HomeRemoteDataSources {
  var apiHelper = ApiHelper();

  @override
  Future<List<PhotoModel>> getPhotos() {
    return apiHelper.handleDataSourceRequest(
      onTry: () async => apiHelper.dio.get(
        'photos',
      ),
      onSuccess: (response) {
        return response.data
            .map<PhotoModel>((e) => PhotoModel.fromJson(e))
            .toList();
      },
    );
  }
}
