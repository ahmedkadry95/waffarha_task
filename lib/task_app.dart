import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:waffarha_task/core/routing/app_router.dart';
import 'package:waffarha_task/core/routing/routes.dart';

class TaskApp extends StatelessWidget {
  final AppRouter appRouter;

  const TaskApp({super.key, required this.appRouter});

  @override
  Widget build(BuildContext context) {
    return ScreenUtilInit(
      designSize: const Size(375, 812),
      minTextAdapt: true,
      child: MaterialApp(
        title: 'Contact Cars Task',
        theme: ThemeData(
          progressIndicatorTheme: const ProgressIndicatorThemeData(
            color: Color(0xFFe86414),
          ),
          elevatedButtonTheme: ElevatedButtonThemeData(
            style: ButtonStyle(
              backgroundColor: WidgetStateProperty.all(const Color(0xFFe86414)),
              foregroundColor: WidgetStateProperty.all(Colors.white),
              padding: WidgetStateProperty.all(
                const EdgeInsets.symmetric(
                  vertical: 10,
                  horizontal: 20,
                ),
              ),
              shape: WidgetStateProperty.all(
                RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(10),
                ),
              ),
            ),
          ),
          scaffoldBackgroundColor: Colors.white,
          appBarTheme: const AppBarTheme(
            backgroundColor: Colors.white,
            elevation: 0,
            iconTheme: IconThemeData(color: Colors.black),
            titleTextStyle: TextStyle(
              color: Colors.black,
              fontSize: 22,
              fontWeight: FontWeight.w900,
            ),
          ),
        ),
        debugShowCheckedModeBanner: false,
        initialRoute: Routes.splash,
        onGenerateRoute: appRouter.generateRoute,
      ),
    );
  }
}
