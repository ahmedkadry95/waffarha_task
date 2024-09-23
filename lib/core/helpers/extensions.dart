import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

extension ListExtension<T> on List<T>? {
  bool isNullOrEmpty() => this == null || this!.isEmpty;
}

////////////////////////////////////////////////////////////
////////////////////////////////////////////////////////////
//////////////////  Widget Extension  //////////////////////
////////////////////////////////////////////////////////////
////////////////////////////////////////////////////////////

extension Navigation on BuildContext {
  Future<dynamic> pushNamed(String routeName, {Object? arguments}) {
    return Navigator.of(this).pushNamed(routeName, arguments: arguments);
  }

  Future<dynamic> pushReplacementNamed(String routeName, {Object? arguments}) {
    return Navigator.of(this)
        .pushReplacementNamed(routeName, arguments: arguments);
  }

  Future<dynamic> pushNamedAndRemoveUntil(String routeName,
      {Object? arguments, required RoutePredicate predicate}) {
    return Navigator.of(this)
        .pushNamedAndRemoveUntil(routeName, predicate, arguments: arguments);
  }

  void pop() => Navigator.of(this).pop();
}

extension WidgetExtension on Widget {
  Widget onTap(
    Function? function, {
    BorderRadius borderRadius = const BorderRadius.all(Radius.circular(50)),
    Color? splashColor,
  }) {
    return InkWell(
      onTap: function as void Function()?,
      borderRadius: borderRadius,
      splashColor: splashColor,
      child: this,
    );
  }
}

extension MediaQueryHelper on BuildContext {
  double get width => MediaQuery.of(this).size.width;

  double get height => MediaQuery.of(this).size.height;
}
////////////////////////////////////////////////////////////
////////////////////////////////////////////////////////////
////////////////////   String Extension  ///////////////////
////////////////////////////////////////////////////////////
////////////////////////////////////////////////////////////

extension StringExtension on String? {
  bool isNullOrEmpty() => this == null || this == "";
}

extension RemoveFirstZero on String? {
  String removeFirstZero() {
    if (this == null) return "";
    return this!.replaceAll(RegExp(r'^0+'), '');
  }
}

////////////////////////////////////////////////////////////
////////////////////////////////////////////////////////////
////////////////////    Flutter Cubit    ///////////////////
////////////////////////////////////////////////////////////
////////////////////////////////////////////////////////////

extension CubitExt<T> on Cubit<T> {
  void safeEmit(T state) {
    if (!isClosed) {
      emit(state);
    }
  }
}
