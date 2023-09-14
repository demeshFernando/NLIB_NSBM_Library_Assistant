import 'dart:js';

import 'package:awesome_dialog/awesome_dialog.dart';
import 'package:flutter/material.dart';

class DialogBox {
  BuildContext context;
  final String title, description;
  final VoidCallback onPressed;

  DialogBox({
    required this.context,
    required this.title,
    required this.description,
    required this.onPressed,
  });

  void warningDialogBox() {
    AwesomeDialog(
      context: context,
      dialogType: DialogType.warning,
      animType: AnimType.topSlide,
      showCloseIcon: true,
      title: title,
      desc: description,
      btnOkOnPress: onPressed,
    ).show();
  }
}
