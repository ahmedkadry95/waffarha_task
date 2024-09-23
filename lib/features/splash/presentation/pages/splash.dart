import 'package:animate_do/animate_do.dart';
import 'package:flutter/material.dart';
import 'package:waffarha_task/core/helpers/extensions.dart';
import 'package:waffarha_task/core/routing/routes.dart';

class Splash extends StatefulWidget {
  const Splash({super.key});

  @override
  State<Splash> createState() => _SplashState();
}

class _SplashState extends State<Splash> {
  @override
  void didChangeDependencies() {
    super.didChangeDependencies();
    Future.delayed(
      const Duration(seconds: 3),
      () {
        if (context.mounted) {
          context.pushNamedAndRemoveUntil(
            Routes.home,
            predicate: (Route<dynamic> route) {
              return false;
            },
          );
        }
      },
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: FadeIn(
            duration: const Duration(seconds: 3),
            child: Image.asset('assets/images/logo.png')),
      ),
    );
  }
}
