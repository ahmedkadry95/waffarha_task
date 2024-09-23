import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:waffarha_task/core/di/dependency_injection.dart';
import 'package:waffarha_task/core/routing/routes.dart';
import 'package:waffarha_task/features/home/presentation/cubit/home_cubit.dart';
import 'package:waffarha_task/features/home/presentation/pages/home.dart';
import 'package:waffarha_task/features/splash/presentation/pages/splash.dart';

class AppRouter {
  Route? generateRoute(RouteSettings settings) {
    final arguments = settings.arguments;

    switch (settings.name) {
      case Routes.splash:
        return MaterialPageRoute(
          builder: (_) => const Splash(),
        );

      case Routes.home:
        return MaterialPageRoute(
          builder: (_) => BlocProvider(
            create: (context) => getIt<HomeCubit>(),
            child: const Home(),
          ),
        );

      default:
        return null;
    }
  }
}
