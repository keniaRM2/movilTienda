import 'package:flutter/material.dart';
// import 'package:fluttertoast/fluttertoast.dart';

class MyToast {
  void showToastError(BuildContext context, String message) {
    final scaffold = ScaffoldMessenger.of(context);
    scaffold.showSnackBar(
      SnackBar(
        content: Text(message),
        action: SnackBarAction(
            label: 'Ok', onPressed: scaffold.hideCurrentSnackBar),
      ),
    );
    // Fluttertoast.showToast(
    //   msg: message,
    //   toastLength: Toast.LENGTH_SHORT,
    //   gravity: ToastGravity.TOP_RIGHT,
    //   backgroundColor: Colors.red,
    //   textColor: Colors.white,
    //   fontSize: 10.0,
    // );
  }

  void showToastSuccess(BuildContext context, String message) {
    showToastError(context, message);
    // Fluttertoast.showToast(
    //   msg: message,
    //   toastLength: Toast.LENGTH_SHORT,
    //   gravity: ToastGravity.TOP_RIGHT,
    //   backgroundColor: Colors.green,
    //   textColor: Colors.white,
    //   fontSize: 10.0,
    // );
  }
}
