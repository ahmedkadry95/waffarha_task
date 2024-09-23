import 'package:dartz/dartz.dart';
import 'package:waffarha_task/core/networking/failure.dart';
import 'package:waffarha_task/features/home/domain/entities/photo.dart';

abstract class HomeRepository {
  Future<Either<Failure, List<Photo>>> getPhotos();
}
