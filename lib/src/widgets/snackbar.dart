import 'package:flutter/material.dart';
import 'package:motor_app/src/utils/textstyle.dart';

void showSnackBar(
    BuildContext context, String title, String message, bool success) {
  ScaffoldMessenger.of(context).showSnackBar(
    SnackBar(
      content: Text(message, style: DesignText.title),
      backgroundColor: success ? Colors.white : Colors.red,
      duration: const Duration(milliseconds: 3000),
      action: SnackBarAction(
        label: 'Close',
        onPressed: () {
          ScaffoldMessenger.of(context).hideCurrentSnackBar();
        },
        textColor: Colors.black,
      ),
    ),
  );
}