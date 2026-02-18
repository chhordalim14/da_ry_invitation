import 'package:flutter/material.dart';
import 'package:responsive_framework/responsive_framework.dart';

class AppStyles {
  static TextStyle heading1(BuildContext context) {
    return TextStyle(
      color: Colors.white,
      fontSize: ResponsiveFont.size(
        context,
        mobile: 28,
        tablet: 34,
        desktop: 40,
        min: 22,
        max: 64,
      ),
      fontWeight: FontWeight.bold,
    );
  }

  static TextStyle heading2(BuildContext context) {
    return TextStyle(
      color: Colors.white,
      fontSize: ResponsiveFont.size(
        context,
        mobile: 22,
        tablet: 26,
        desktop: 32,
        min: 18,
        max: 40,
      ),
      fontWeight: FontWeight.bold,
    );
  }

  static TextStyle bodyText(BuildContext context) {
    return TextStyle(
      color: Colors.white,
      height: 1.5,
      fontSize: ResponsiveFont.size(
        context,
        mobile: 16,
        tablet: 18,
        desktop: 20,
        min: 14,
        max: 22,
      ),
      fontWeight: FontWeight.w500,
    );
  }

  static TextStyle bodyText1(BuildContext context) {
    return TextStyle(
      color: Colors.white,
      height: 1.5,
      fontSize: ResponsiveFont.size(
        context,
        mobile: 16,
        tablet: 18,
        desktop: 20,
        min: 14,
        max: 22,
      ),
      fontWeight: FontWeight.w400,
    );
  }

  static TextStyle bodyText2(BuildContext context) {
    return TextStyle(
      color: Colors.white,
      height: 1.5,
      fontSize: ResponsiveFont.size(
        context,
        mobile: 14,
        tablet: 16,
        desktop: 18,
        min: 12,
        max: 20,
      ),
      fontWeight: FontWeight.w400,
    );
  }

  static TextStyle buttonText(BuildContext context) {
    return TextStyle(
      color: Colors.white,
      fontSize: ResponsiveFont.size(
        context,
        mobile: 16,
        tablet: 18,
        desktop: 20,
        min: 14,
        max: 22,
      ),
      fontWeight: FontWeight.w600,
      letterSpacing: 1,
    );
  }
}

class ResponsiveFont {
  static double size(
    BuildContext context, {
    required double mobile,
    double? tablet,
    double? desktop,
    double min = 12,
    double max = 60,
  }) {
    final width = MediaQuery.sizeOf(context).width;

    // Smooth scale based on mobile reference (390px)
    double scale = width / 390;

    double baseSize = mobile;

    if (ResponsiveBreakpoints.of(context).largerThan(TABLET)) {
      baseSize = tablet ?? mobile * 1.2;
    }

    if (ResponsiveBreakpoints.of(context).largerThan(DESKTOP)) {
      baseSize = desktop ?? mobile * 1.4;
    }

    double responsiveSize = baseSize * scale;

    return responsiveSize.clamp(min, max);
  }
}
