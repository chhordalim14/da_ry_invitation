import 'package:flutter/material.dart';
import 'package:responsive_framework/responsive_framework.dart';

class AppStyles {
  static TextStyle heading1(BuildContext context) {
    return TextStyle(
      color: Colors.white,
      fontSize: ResponsiveValue<double>(
        context,
        defaultValue: 28.0,
        conditionalValues: [
          Condition.largerThan(name: TABLET, value: 36.0),
          Condition.largerThan(name: DESKTOP, value: 48.0),
        ],
      ).value,
      fontWeight: FontWeight.bold,
    );
  }

  static TextStyle heading2(BuildContext context) {
    return TextStyle(
      color: Colors.white,
      fontSize: ResponsiveValue<double>(
        context,
        defaultValue: 22.0,
        conditionalValues: [
          Condition.largerThan(name: TABLET, value: 26.0),
          Condition.largerThan(name: DESKTOP, value: 32.0),
        ],
      ).value,
      fontWeight: FontWeight.bold,
    );
  }

  static TextStyle bodyText(BuildContext context) {
    return TextStyle(
      color: Colors.white,
      height: 1.5, // Improved line spacing for readability
      fontSize: ResponsiveValue<double>(
        context,
        defaultValue: 16.0,
        conditionalValues: [
          Condition.largerThan(name: TABLET, value: 18.0),
          Condition.largerThan(name: DESKTOP, value: 20.0),
        ],
      ).value,
      fontWeight: FontWeight.w500, // Medium weight for body text
    );
  }

  static TextStyle bodyText1(BuildContext context) {
    return TextStyle(
      color: Colors.white,
      height: 1.5, // Improved line spacing for readability
      fontSize: ResponsiveValue<double>(
        context,
        defaultValue: 18.0,
        conditionalValues: [
          Condition.largerThan(name: TABLET, value: 20.0),
          Condition.largerThan(name: DESKTOP, value: 22.0),
        ],
      ).value,
      fontWeight: FontWeight.w500, // Medium weight for body text
    );
  }

  static TextStyle subtleText(BuildContext context) {
    return TextStyle(
      color: Colors.white.withValues(alpha: 0.8),
      fontSize: ResponsiveValue<double>(
        context,
        defaultValue: 12.0,
        conditionalValues: [
          Condition.largerThan(name: TABLET, value: 14.0),
          Condition.largerThan(name: DESKTOP, value: 16.0),
        ],
      ).value,
      fontWeight: FontWeight.normal,
    );
  }

  static TextStyle buttonText(BuildContext context) {
    return TextStyle(
      color: Colors.white,
      fontSize: ResponsiveValue<double>(
        context,
        defaultValue: 16.0,
        conditionalValues: [Condition.largerThan(name: TABLET, value: 18.0)],
      ).value,
      fontWeight: FontWeight.w600,
      letterSpacing: 1,
    );
  }
}
