import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';
import '../theme/app_theme.dart';
import '../theme/text_theme.dart';

class DialogHelper {
  static showToast(String message) {
    Fluttertoast.showToast(
        msg: message,
        toastLength: Toast.LENGTH_SHORT,
        gravity: ToastGravity.CENTER,
        timeInSecForIosWeb: 1,
        backgroundColor: AppTheme.primaryColor,
        textColor: Colors.white,
        fontSize: 16.0);
  }

  static showDialog(
      {required BuildContext context,
      required String title,
      required Widget content}) {
    showCupertinoDialog(context: context, builder: (_){
      return AlertDialog(
        title: Text(
          title,
          style: AppTextTheme.heading5,
        ),
        content: content,
      );
    });
  }
}
