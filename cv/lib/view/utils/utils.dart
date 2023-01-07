import 'package:flutter/cupertino.dart';

class Utils {
  static void focusChange(
      BuildContext context, FocusNode current, FocusNode next) {
    current.unfocus();
    FocusScope.of(context).requestFocus(next);
  }
}
