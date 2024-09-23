import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';

showSuccessToast({
  required String message,
}) {
  Fluttertoast.showToast(
    msg: message,
    toastLength: Toast.LENGTH_LONG,
    gravity: ToastGravity.TOP,
    timeInSecForIosWeb: 2,
    backgroundColor: Colors.green,
    textColor: Colors.white,
    fontSize: 16.0,
  );
}

showFailureToast({
  required String message,
}) {
  Fluttertoast.showToast(
    msg: message,
    toastLength: Toast.LENGTH_SHORT,
    gravity: ToastGravity.TOP,
    timeInSecForIosWeb: 2,
    backgroundColor: Colors.red,
    textColor: Colors.white,
    fontSize: 16.0,
  );
}

showNotifyToast({
  required String message,
}) {
  Fluttertoast.showToast(
    msg: message,
    toastLength: Toast.LENGTH_SHORT,
    gravity: ToastGravity.TOP,
    timeInSecForIosWeb: 2,
    backgroundColor: Colors.yellow[700],
    textColor: Colors.black,
    fontSize: 16.0,
  );
}