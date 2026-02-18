import 'dart:async';
import 'dart:ui';
import 'package:da_ry_invitation/core/widget/app_styles.dart';
import 'package:flutter/material.dart';
import 'package:responsive_framework/responsive_framework.dart';

class CountdownTimer extends StatefulWidget {
  final DateTime targetDate;

  const CountdownTimer({super.key, required this.targetDate});

  @override
  State<CountdownTimer> createState() => _CountdownTimerState();
}

class _CountdownTimerState extends State<CountdownTimer> {
  late Timer _timer;
  Duration _remaining = Duration.zero;

  @override
  void initState() {
    super.initState();
    _calculateTime();
    _timer = Timer.periodic(const Duration(seconds: 1), (_) {
      _calculateTime();
    });
  }

  void _calculateTime() {
    final now = DateTime.now();
    setState(() {
      _remaining = widget.targetDate.difference(now);
      if (_remaining.isNegative) {
        _remaining = Duration.zero;
        _timer.cancel();
      }
    });
  }

  @override
  void dispose() {
    _timer.cancel();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final days = _remaining.inDays;
    final hours = _remaining.inHours % 24;
    final minutes = _remaining.inMinutes % 60;
    final seconds = _remaining.inSeconds % 60;

    final double paddingVertical = ResponsiveValue<double>(
      context,
      defaultValue: MediaQuery.sizeOf(context).height * 0.02,
      conditionalValues: [
        Condition.largerThan(
          name: MOBILE,
          value: MediaQuery.sizeOf(context).height * 0.03,
        ),
        Condition.largerThan(
          name: TABLET,
          value: MediaQuery.sizeOf(context).height * 0.04,
        ),
      ],
    ).value;

    final double paddingHorizontal = ResponsiveValue<double>(
      context,
      defaultValue: MediaQuery.sizeOf(context).width * 0.04,
      conditionalValues: [
        Condition.largerThan(
          name: MOBILE,
          value: MediaQuery.sizeOf(context).width * 0.03,
        ),
        Condition.largerThan(
          name: TABLET,
          value: MediaQuery.sizeOf(context).width * 0.05,
        ),
      ],
    ).value;

    final double spacing = ResponsiveValue<double>(
      context,
      defaultValue: MediaQuery.sizeOf(context).height * 0.004,
      conditionalValues: [
        Condition.largerThan(
          name: MOBILE,
          value: MediaQuery.sizeOf(context).height * 0.006,
        ),
        Condition.largerThan(
          name: TABLET,
          value: MediaQuery.sizeOf(context).height * 0.008,
        ),
      ],
    ).value;

    final double colonSpacing = ResponsiveValue<double>(
      context,
      defaultValue: MediaQuery.sizeOf(context).height * 0.006,
      conditionalValues: [
        Condition.largerThan(
          name: MOBILE,
          value: MediaQuery.sizeOf(context).height * 0.008,
        ),
        Condition.largerThan(
          name: TABLET,
          value: MediaQuery.sizeOf(context).height * 0.01,
        ),
      ],
    ).value;

    return Stack(
      alignment: Alignment.center,
      children: [
        // Background image
        ClipRRect(
          borderRadius: BorderRadius.circular(16),
          child: Image.asset(
            'assets/wedding/wedding_image_11.jpg',
            fit: BoxFit.cover,
            width: double.infinity,
          ),
        ),

        // Frosted overlay + countdown
        Positioned(
          bottom: ResponsiveValue<double>(
            context,
            defaultValue: MediaQuery.sizeOf(context).height * 0.15,
            conditionalValues: [
              Condition.largerThan(
                name: MOBILE,
                value: MediaQuery.sizeOf(context).height * 0.13,
              ),
              Condition.largerThan(
                name: TABLET,
                value: MediaQuery.sizeOf(context).height * 0.1,
              ),
            ],
          ).value,
          child: ClipRRect(
            borderRadius: BorderRadius.circular(16),
            child: BackdropFilter(
              filter: ImageFilter.blur(sigmaX: 5, sigmaY: 5),
              child: Container(
                padding: EdgeInsets.symmetric(
                  vertical: paddingVertical,
                  horizontal: paddingHorizontal,
                ),
                decoration: BoxDecoration(
                  color: Colors.black.withOpacity(0.2),
                  borderRadius: BorderRadius.circular(16),
                ),
                child: Column(
                  mainAxisSize: MainAxisSize.min,
                  children: [
                    Text(
                      "ចំនួនថ្ងៃរាប់ថយក្រោយ",
                      style: AppStyles.bodyText(context).copyWith(
                        color: Colors.amber[700],
                        fontWeight: FontWeight.bold,
                        fontFamily: 'Moulpali',
                      ),
                    ),
                    SizedBox(height: spacing * 3),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      crossAxisAlignment: CrossAxisAlignment.baseline,
                      textBaseline: TextBaseline.alphabetic,
                      children: [
                        _timeBox(context, days, "ថ្ងៃ", spacing),
                        _colon(context, colonSpacing),
                        _timeBox(context, hours, "ម៉ោង", spacing),
                        _colon(context, colonSpacing),
                        _timeBox(context, minutes, "នាទី", spacing),
                        _colon(context, colonSpacing),
                        _timeBox(context, seconds, "វិនាទី", spacing),
                      ],
                    ),
                  ],
                ),
              ),
            ),
          ),
        ),
      ],
    );
  }

  Widget _colon(BuildContext context, double spacing) {
    return Padding(
      padding: EdgeInsets.symmetric(horizontal: spacing),
      child: Text(
        ":",
        style: AppStyles.heading1(
          context,
        ).copyWith(color: Colors.amber[700], fontWeight: FontWeight.bold),
      ),
    );
  }

  Widget _timeBox(
    BuildContext context,
    int value,
    String label,
    double spacing,
  ) {
    return Column(
      mainAxisSize: MainAxisSize.min,
      children: [
        Text(
          value.toString().padLeft(2, '0'),
          style: AppStyles.heading1(context).copyWith(
            color: Colors.amber[700],
            fontWeight: FontWeight.bold,
            fontFamily: 'KantumruyPro',
          ),
        ),
        SizedBox(height: spacing),
        Text(
          label,
          style: AppStyles.bodyText(context).copyWith(
            color: Colors.amber[700],
            fontWeight: FontWeight.w400,
            fontFamily: 'IMFellEnglishSC',
          ),
        ),
      ],
    );
  }
}
