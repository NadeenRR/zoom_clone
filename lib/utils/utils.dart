import 'package:flutter/material.dart';

showSnacBar(BuildContext context, String text) {
  return ScaffoldMessenger.of(context)
      .showSnackBar(SnackBar(content: Text(text)));
}
