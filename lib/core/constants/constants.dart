import 'package:flutter/material.dart';

const Color colorsApp = Color(0xFF243B55);

extension StringExtension on String {
  String capitalize() {
    if (isEmpty) {
      return this;
    }
    return "${this[0].toUpperCase()}${substring(1).toLowerCase()}";
  }
}
