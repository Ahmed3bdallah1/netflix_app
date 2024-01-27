import 'package:flutter/material.dart';

showSnakBar(BuildContext context, String text) {
  return ScaffoldMessenger.of(context).showSnackBar(SnackBar(
    content: Text(text),
    behavior: SnackBarBehavior.floating,
    duration: const Duration(seconds: 2),
  ));
}
