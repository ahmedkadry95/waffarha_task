import 'package:dartz/dartz.dart';
import 'package:waffarha_task/core/networking/api_helper.dart';
import 'package:waffarha_task/core/networking/failure.dart';
import 'package:waffarha_task/features/home/data/data_source/home_remote_data_sources.dart';
import 'package:waffarha_task/features/home/data/mapper/photos_mapper.dart';
import 'package:waffarha_task/features/home/domain/entities/photo.dart';
import 'package:waffarha_task/features/home/domain/repositories/home_repositories.dart';

class HomeRepositoryImpl implements HomeRepository {
  var apiHelper = ApiHelper();
  var homeRemoteData = HomeRemoteDataSourcesImpl();

  @override
  Future<Either<Failure, List<Photo>>> getPhotos() async {
    return await apiHelper.handleRepoFunction(
      onTry: () async {
        var photos = await homeRemoteData.getPhotos();
        return photos
            .map((photo) => PhotosMapper.toPhotoEntity(photo))
            .toList();
      },
    );
  }
}
