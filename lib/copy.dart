import 'package:bakurubey_tharujama/style_elements.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

void copyData(String data, String text, BuildContext context) {
  Clipboard.setData(ClipboardData(text: data));
  HapticFeedback.mediumImpact();
  SnackBar snack = SnackBar(
    backgroundColor: primeColor,
    behavior: SnackBarBehavior.floating,
    shape: snackShape,
    content: Text(
      text,
      style: snackTextStyle,
    ),
  );
  ScaffoldMessenger.of(context).showSnackBar(snack);
}
