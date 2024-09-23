import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:waffarha_task/core/di/dependency_injection.dart';
import 'package:waffarha_task/features/home/presentation/cubit/home_cubit.dart';
import 'package:waffarha_task/features/home/presentation/widgets/filter_by_album_id_widget.dart';
import 'package:waffarha_task/features/home/presentation/widgets/pagination_buttons.dart';
import 'package:waffarha_task/features/home/presentation/widgets/photos_list.dart';
import 'package:waffarha_task/features/home/presentation/widgets/sort_widget.dart';

class Home extends StatefulWidget {
  const Home({super.key});

  @override
  State<Home> createState() => _HomeState();
}

class _HomeState extends State<Home> {
  var cubit = getIt<HomeCubit>();

  @override
  void didChangeDependencies() {
    super.didChangeDependencies();
    cubit.getPhotosInIsolate();
  }

  @override
  void dispose() {
    super.dispose();
    cubit.close();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Photos'),
        actions: [
          SortWidget(cubit: cubit),
          FilterByAlbumId(cubit: cubit),
        ],
      ),
      body: BlocBuilder<HomeCubit, HomeState>(
        builder: (context, state) {
          if (state is PhotosLoadingFailed) {
            return const Center(
              child: CircularProgressIndicator(),
            );
          }
          if (state is PhotosPageOffline) {
            return const Center(
              child: Text('No Internet Connection'),
            );
          } else if (state is PhotosLoadedSuccessfully) {
            return Column(
              children: [
                PhotosList(cubit: cubit, photos: state.photos),
                PaginationButtons(
                  cubit: cubit,
                  photos: cubit.allPhotos,
                ),
              ],
            );
          } else {
            return const Center(
              child: CircularProgressIndicator(),
            );
          }
        },
      ),
    );
  }
}
