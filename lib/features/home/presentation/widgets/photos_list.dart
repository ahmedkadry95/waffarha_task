import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:waffarha_task/features/home/domain/entities/photo.dart';
import 'package:waffarha_task/features/home/presentation/cubit/home_cubit.dart';

class PhotosList extends StatelessWidget {
  const PhotosList({
    super.key,
    required this.cubit,
    required this.photos,
  });

  final HomeCubit cubit;
  final List<Photo> photos;

  @override
  Widget build(BuildContext context) {
    return Expanded(
      child: ListView.separated(
        controller: cubit.scrollController,
        itemCount: photos.length,
        itemBuilder: (context, index) {
          return ListTile(
            contentPadding: const EdgeInsets.all(20),
            leading: SizedBox(
              width: 60,
              child: CachedNetworkImage(
                fit: BoxFit.cover,
                errorListener: (exception) {},
                imageUrl: photos[index].thumbnailUrl,
                placeholder: (context, url) => const Center(
                  child: CircularProgressIndicator(),
                ),
                errorWidget: (context, url, error) => const Icon(Icons.error),
              ),
            ),
            title: Text(photos[index].title),
            trailing: Text('Album ID: ${photos[index].albumId}'),
          );
        },
        separatorBuilder: (BuildContext context, int index) {
          return const Divider();
        },
      ),
    );
  }
}
