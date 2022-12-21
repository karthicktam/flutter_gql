import 'package:flutter/material.dart';
import 'package:toast/toast.dart';

class UtilFs {
  static showToast(String message, BuildContext context) {
    ToastContext().init(context);
    Toast.show(message);
  }
}
