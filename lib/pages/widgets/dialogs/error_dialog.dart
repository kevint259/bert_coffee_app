import 'package:flutter/material.dart';

Future<void> showErrorDialog(
  BuildContext context,
  final String message,
) async {
  return showDialog(
    context: context,
    builder: (context) {
      return AlertDialog(
        title: const Text(
          "Error Occurred",
          textAlign: TextAlign.center,
          style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
        ),
        content: Text(
          message,
          textAlign: TextAlign.center,
          style: const TextStyle(fontSize: 18),
        ),
        actions: [
          TextButton(onPressed: (() {
            Navigator.of(context).pop();
          }), child: const Text("OK",
          style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold),))
        ],
        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(10)),
      );
    },
  );
}
