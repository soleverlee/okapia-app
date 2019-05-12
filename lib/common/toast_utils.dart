import 'package:flutter/material.dart';

class ToastUtils{
  static showToast(BuildContext context, String message) {
    Scaffold.of(context).showSnackBar(SnackBar(
      content: Text(message),
      duration: const Duration(seconds: 1),
    ));
  }

  static showError(BuildContext context, String message) {
    showToast(context, message);
  }
}