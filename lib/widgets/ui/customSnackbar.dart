import 'package:flutter/material.dart';

SnackBar CustomSnackBar(BuildContext context, message, color) {
  double height = MediaQuery.of(context).size.height;
  double width = MediaQuery.of(context).size.width;
  final snackbar = SnackBar(
    content: Padding(
      padding: const EdgeInsets.all(8.0),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Text('${message}'),
          TextButton(
            child: Icon(
              Icons.cancel_outlined,
              color: Colors.white,
            ),
            onPressed: () {
              ScaffoldMessenger.of(context).hideCurrentSnackBar();
            },
          ),
        ],
      ),
    ),
    duration: const Duration(milliseconds: 1500),
    width: width * 0.8, // Width of the SnackBar.
    padding: const EdgeInsets.symmetric(
      horizontal: 2.0, // Inner padding for SnackBar content.
    ),
    behavior: SnackBarBehavior.floating,
    shape: RoundedRectangleBorder(
      borderRadius: BorderRadius.circular(10.0),
    ),
    backgroundColor: color,
    dismissDirection: DismissDirection.horizontal,
  );

  return snackbar;
}
