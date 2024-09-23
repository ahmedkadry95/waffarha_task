import 'package:flutter/material.dart';
import 'package:waffarha_task/core/enums/sort_criteria_enum.dart';
import 'package:waffarha_task/features/home/presentation/cubit/home_cubit.dart';

class SortWidget extends StatelessWidget {
  const SortWidget({
    super.key,
    required this.cubit,
  });

  final HomeCubit cubit;

  @override
  Widget build(BuildContext context) {
    return PopupMenuButton<SortCriteria>(
      onSelected: (criteria) => cubit.sortPhotos(criteria),
      itemBuilder: (context) => [
        const PopupMenuItem(
          value: SortCriteria.titleAsc,
          child: Text('Sort by Title Ascending'),
        ),
        const PopupMenuItem(
          value: SortCriteria.titleDesc,
          child: Text('Sort by Title Descending'),
        ),
        const PopupMenuItem(
          value: SortCriteria.albumIdAsc,
          child: Text('Sort by Album ID Ascending'),
        ),
        const PopupMenuItem(
          value: SortCriteria.albumIdDesc,
          child: Text('Sort by Album ID Descending'),
        ),
      ],
    );
  }
}
