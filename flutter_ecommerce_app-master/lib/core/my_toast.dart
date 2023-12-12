import 'package:flutter/material.dart';

// import 'package:fluttertoast/fluttertoast.dart';

class MyToast {

  //  static void showToast(String message) {
  //   Fluttertoast.showToast(
  //     msg: message,
  //     toastLength: Toast.LENGTH_SHORT,
  //     gravity: ToastGravity.BOTTOM,
  //     timeInSecForIosWeb: 1,
  //     backgroundColor: Colors.blue,
  //     textColor: Colors.white,
  //     fontSize: 16.0,
  //   );
  // }

  void showToastError(BuildContext context, String message) {
    // Fluttertoast.showToast(
    //     msg: "This is Center Short Toast",
    //     toastLength: Toast.LENGTH_SHORT,
    //     gravity: ToastGravity.CENTER,
    //     timeInSecForIosWeb: 1,
    //     backgroundColor: Colors.red,
    //     textColor: Colors.white,
    //     fontSize: 16.0
    // );
    
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
