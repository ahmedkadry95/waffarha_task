import 'dart:isolate';

import 'package:bloc/bloc.dart';
import 'package:flutter/material.dart';
import 'package:waffarha_task/core/enums/sort_criteria_enum.dart';
import 'package:waffarha_task/features/home/domain/entities/photo.dart';
import 'package:waffarha_task/features/home/domain/use_cases/get_photo_use_case.dart';

import '../../../../core/networking/failure.dart';

part 'home_state.dart';

class HomeCubit extends Cubit<HomeState> {
  HomeCubit() : super(HomeInitial());

  int currentPage = 0;
  int pagesCount = 1;
  final int photosPerPage = 10;
  List<int> albumIds = [];
  List<Photo> allPhotos = [];
  List<Photo> filteredPhotos = [];

  final ScrollController scrollController = ScrollController();

  void getPhotosInIsolate() async {
    ReceivePort receivePort = ReceivePort();
    await Isolate.spawn(getPhotosInOtherIsolate, receivePort.sendPort);
    receivePort.listen(
      (message) {
        if (message is List<Photo>) {
          allPhotos = message;
          pagesCount = (allPhotos.length / photosPerPage).ceil();
          emit(
            PhotosLoadedSuccessfully(
              getPhotosForPage(page: currentPage, photos: allPhotos),
            ),
          );
          getAlbumIds();
        } else if (message is OfflineFailure) {
          emit(PhotosPageOffline());
        } else {
          emit(PhotosLoadingFailed());
        }
      },
    );
  }

  List<Photo> getPhotosForPage({
    required int page,
    required List<Photo> photos,
  }) {
    int startIndex = page * photosPerPage;
    int endIndex = startIndex + photosPerPage;
    return photos.sublist(
      startIndex,
      endIndex > photos.length ? photos.length : endIndex,
    );
  }

  void loadNextPage() {
    if ((currentPage + 1) * photosPerPage < allPhotos.length) {
      currentPage++;
      emit(
        PhotosLoadedSuccessfully(
          getPhotosForPage(
            page: currentPage,
            photos: filteredPhotos.isNotEmpty ? filteredPhotos : allPhotos,
          ),
        ),
      );
      scrollToTop();
    }
  }

  void loadPreviousPage() {
    if (currentPage > 0) {
      currentPage--;
      emit(
        PhotosLoadedSuccessfully(
          getPhotosForPage(
            page: currentPage,
            photos: filteredPhotos.isNotEmpty ? filteredPhotos : allPhotos,
          ),
        ),
      );
      scrollToTop();
    }
  }

  // This method is used to sort the photos list based on the selected criteria
  void sortPhotos(SortCriteria criteria) {
    switch (criteria) {
      case SortCriteria.titleAsc:
        allPhotos.sort((a, b) => a.title.compareTo(b.title));
        break;
      case SortCriteria.titleDesc:
        allPhotos.sort((a, b) => b.title.compareTo(a.title));
        break;
      case SortCriteria.albumIdAsc:
        allPhotos.sort((a, b) => a.albumId.compareTo(b.albumId));
        break;
      case SortCriteria.albumIdDesc:
        allPhotos.sort((a, b) => b.albumId.compareTo(a.albumId));
        break;
    }
    // Clear the filtered photos list to avoid sorting it again
    filteredPhotos.clear();
    // Reset the current page to 0
    pagesCount = (allPhotos.length / photosPerPage).ceil();
    emit(
      PhotosLoadedSuccessfully(
        getPhotosForPage(page: currentPage, photos: allPhotos),
      ),
    );
  }

  // This method is used to scroll to the top of the list after tap on next or previous page
  void scrollToTop() {
    scrollController.animateTo(
      0.0,
      duration: const Duration(milliseconds: 300),
      curve: Curves.easeInOut,
    );
  }

  // This method is used to album ids from the list of photos to be used in filtering
  getAlbumIds() {
    albumIds = allPhotos.map((photo) => photo.albumId).toSet().toList();
  }

  void filterByAlbumId(int albumId) {
    if (albumId == 0) {
      pagesCount = (allPhotos.length / photosPerPage).ceil();
      emit(
        PhotosLoadedSuccessfully(
          getPhotosForPage(page: currentPage, photos: allPhotos),
        ),
      );
    } else {
      filteredPhotos =
          allPhotos.where((photo) => photo.albumId == albumId).toList();
      pagesCount = (filteredPhotos.length / photosPerPage).ceil();
      currentPage = 0;
      emit(
        PhotosLoadedSuccessfully(
          getPhotosForPage(page: currentPage, photos: filteredPhotos),
        ),
      );
    }
  }
}
