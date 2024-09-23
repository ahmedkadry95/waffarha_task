part of 'home_cubit.dart';

@immutable
sealed class HomeState {}

final class HomeInitial extends HomeState {}

final class PhotosLoadedSuccessfully extends HomeState {
  final List<Photo> photos;

  PhotosLoadedSuccessfully(
    this.photos,
  );
}

final class PhotosLoadingFailed extends HomeState {}

final class PhotosPageOffline extends HomeState {}
