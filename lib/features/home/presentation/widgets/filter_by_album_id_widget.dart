import 'package:flutter/material.dart';
import 'package:waffarha_task/features/home/presentation/cubit/home_cubit.dart';

class FilterByAlbumId extends StatelessWidget {
  const FilterByAlbumId({
    super.key,
    required this.cubit,
  });

  final HomeCubit cubit;

  @override
  Widget build(BuildContext context) {
    return PopupMenuButton<int>(
      icon: const Icon(Icons.filter_list),
      onSelected: (id) => cubit.filterByAlbumId(id),
      itemBuilder: (context) => [
        const PopupMenuItem(
          value: 0,
          child: Text('All Albums'),
        ),
        ...cubit.albumIds.map(
          (id) => PopupMenuItem(
            value: id,
            child: Text('Album $id'),
          ),
        ),
      ],
    );
  }
}
