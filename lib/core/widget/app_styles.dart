import 'package:flutter/material.dart';
import 'package:responsive_framework/responsive_framework.dart';

class AppStyles {
  static TextStyle heading1(BuildContext context) {
    return TextStyle(
      color: Colors.white,
      fontSize: ResponsiveValue<double>(
        context,
        defaultValue: MediaQuery.sizeOf(context).height * 0.024,
        conditionalValues: [
          Condition.equals(
            name: MOBILE,
            value: MediaQuery.sizeOf(context).height * 0.024,
          ),
          Condition.equals(
            name: TABLET,
            value: MediaQuery.sizeOf(context).height * 0.028,
          ),
          Condition.equals(
            name: DESKTOP,
            value: MediaQuery.sizeOf(context).height * 0.032,
          ),
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
        defaultValue: MediaQuery.sizeOf(context).height * 0.020,
        conditionalValues: [
          Condition.equals(
            name: MOBILE,
            value: MediaQuery.sizeOf(context).height * 0.020,
          ),
          Condition.equals(
            name: TABLET,
            value: MediaQuery.sizeOf(context).height * 0.022,
          ),
          Condition.equals(
            name: DESKTOP,
            value: MediaQuery.sizeOf(context).height * 0.024,
          ),
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
        defaultValue: 14,
        conditionalValues: [
          Condition.equals(name: MOBILE, value: 14),
          Condition.equals(name: TABLET, value: 16),
          Condition.equals(name: DESKTOP, value: 18),
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
        defaultValue: 16.0,
        conditionalValues: [
          Condition.equals(name: MOBILE, value: 16),
          Condition.equals(name: TABLET, value: 18),
          Condition.equals(name: DESKTOP, value: 20),
        ],
      ).value,
      fontWeight: FontWeight.w400, // Medium weight for body text
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
