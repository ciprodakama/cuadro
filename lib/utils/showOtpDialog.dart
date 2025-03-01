import 'package:flutter/material.dart';

void showOTPDialog({
  BuildContext context,
  TextEditingController codeController,
  VoidCallback onPressed,
}) {
  showDialog(
    context: context,
    barrierDismissible: false,
    builder: (context) => AlertDialog(
      title: const Text("Enter OTP"),
      content: Column(
        mainAxisSize: MainAxisSize.min,
        children: <Widget>[
          TextField(
            controller: codeController,
          ),
        ],
      ),
      actions: <Widget>[
        TextButton(
          child: const Text("Done"),
          onPressed: onPressed,
        )
      ],
    ),
  );
}
