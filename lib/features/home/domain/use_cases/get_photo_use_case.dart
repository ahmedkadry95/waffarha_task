import 'dart:isolate';

import 'package:dartz/dartz.dart';
import 'package:waffarha_task/core/networking/failure.dart';
import 'package:waffarha_task/features/home/data/repository/home_repo_impl.dart';
import 'package:waffarha_task/features/home/domain/entities/photo.dart';

class GetPhotosUseCase {
  final HomeRepositoryImpl repository = HomeRepositoryImpl();

  Future<Either<Failure, List<Photo>>> call() async {
    return await repository.getPhotos();
  }
}

void getPhotosInOtherIsolate(SendPort sendPort) async {
  GetPhotosUseCase getPhotosUseCase = GetPhotosUseCase();
  var response = await getPhotosUseCase.call();
  response.fold(
    (fail) {
      sendPort.send(fail);
    },
    (success) {
      sendPort.send(success);
    },
  );
}
