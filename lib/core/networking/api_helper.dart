import 'package:dartz/dartz.dart';
import 'package:dio/dio.dart';
import 'package:internet_connection_checker/internet_connection_checker.dart';
import 'package:pretty_dio_logger/pretty_dio_logger.dart';
import 'package:waffarha_task/core/networking/exception.dart';
import 'package:waffarha_task/core/networking/failure.dart';
import 'package:waffarha_task/core/networking/network_checker.dart';

class ApiHelper {
  late final Dio dio;
  NetworkChecker networkChecker =
      NetworkCheckerImpl(connectionChecker: InternetConnectionChecker());

  ApiHelper() {
    dio = Dio();
    dio.options.baseUrl = 'https://jsonplaceholder.typicode.com/';
    dio.options.connectTimeout = const Duration(seconds: 30);
    dio.options.receiveTimeout = const Duration(seconds: 90);
    dio.interceptors.add(
      PrettyDioLogger(
        requestHeader: true,
        requestBody: true,
        responseBody: true,
        responseHeader: true,
        error: true,
        compact: true,
        maxWidth: 90,
      ),
    );
  }

  Future<T> handleDataSourceRequest<T>({
    required Function() onTry,
    required T Function(Response response) onSuccess,
  }) async {
    try {
      final Response response = await onTry();
      if (response.statusCode == 200 || response.statusCode == 201) {
        return onSuccess(response);
      } else {
        throw ServerException();
      }
    } on DioException {
      throw ServerException();
    }
  }

  Future<Either<Failure, T>> handleRepoFunction<T>({
    required Function() onTry,
  }) async {
    if (await networkChecker.isConnected) {
      try {
        return Right(await onTry());
      } on ServerException {
        return Left(ServerFailure());
      }
    } else {
      return Left(OfflineFailure());
    }
  }
}
