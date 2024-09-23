import 'package:flutter/material.dart';
import 'package:waffarha_task/features/home/domain/entities/photo.dart';
import 'package:waffarha_task/features/home/presentation/cubit/home_cubit.dart';

class PaginationButtons extends StatelessWidget {
  const PaginationButtons({
    super.key,
    required this.cubit,
    required this.photos,
  });

  final HomeCubit cubit;
  final List<Photo> photos;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(
        vertical: 20.0,
        horizontal: 20,
      ),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          if (cubit.currentPage > 0)
            ElevatedButton(
              onPressed: cubit.loadPreviousPage,
              child: const Text('Previous'),
            ),
          Text(
            'Page ${cubit.currentPage + 1} of ${cubit.pagesCount}',
          ),
          if (cubit.currentPage < cubit.pagesCount - 1)
            ElevatedButton(
              onPressed: cubit.loadNextPage,
              child: const Text('Next'),
            ),
        ],
      ),
    );
  }
}
