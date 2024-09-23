import 'package:waffarha_task/features/home/data/model/photo_model.dart';
import 'package:waffarha_task/features/home/domain/entities/photo.dart';

class PhotosMapper {
  static Photo toPhotoEntity(PhotoModel photoModel) {
    return Photo(
      albumId: photoModel.albumId ?? 0,
      id: photoModel.id ?? 0,
      title: photoModel.title ?? '',
      url: photoModel.url ?? '',
      thumbnailUrl: photoModel.thumbnailUrl ?? '',
    );
  }
}
