import 'dart:async';
import 'dart:ui';
import 'package:da_ry_invitation/core/widget/app_styles.dart';
import 'package:flutter/material.dart';

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

    return Stack(
      alignment: Alignment.center,
      children: [
        // Background image
        ClipRRect(
          borderRadius: BorderRadiusGeometry.circular(16),
          child: Image.asset('assets/test12.webp', fit: BoxFit.cover),
        ),

        // Frosted backdrop + countdown
        Positioned(
          bottom: MediaQuery.sizeOf(context).height * 0.1,
          child: ClipRRect(
            borderRadius: BorderRadius.circular(
              16,
            ), // rounded edges for the frosted box
            child: BackdropFilter(
              filter: ImageFilter.blur(
                sigmaX: 5,
                sigmaY: 5,
              ), // adjust blur strength
              child: Container(
                // width: MediaQuery.sizeOf(context).width * 0.8,
                padding: EdgeInsets.symmetric(
                  vertical: MediaQuery.of(context).size.height * 0.02,
                  horizontal: MediaQuery.of(context).size.width * 0.04,
                ),
                decoration: BoxDecoration(
                  color: Colors.black.withValues(
                    alpha: 0.2,
                  ), // semi-transparent overlay
                  borderRadius: BorderRadius.circular(16),
                ),
                child: Column(
                  mainAxisSize: MainAxisSize.min,
                  children: [
                    Text(
                      "ចំនួនថ្ងៃរាប់ថយក្រោយ",
                      style: AppStyles.heading2(context).copyWith(
                        color: Colors.amber[700],
                        fontWeight: FontWeight.bold,
                        fontFamily: 'Moulpali',
                      ),
                    ),
                    SizedBox(
                      height: MediaQuery.of(context).size.height * 0.012,
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      crossAxisAlignment: CrossAxisAlignment.baseline,
                      textBaseline: TextBaseline.alphabetic,
                      children: [
                        _timeBox(context, days, "ថ្ងៃ"),
                        _colon(context),
                        _timeBox(context, hours, "ម៉ោង"),
                        _colon(context),
                        _timeBox(context, minutes, "នាទី"),
                        _colon(context),
                        _timeBox(context, seconds, "វិនាទី"),
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

  Widget _colon(BuildContext context) {
    return Padding(
      padding: EdgeInsets.symmetric(
        horizontal: MediaQuery.sizeOf(context).height * 0.006,
      ),
      child: Text(
        ":",
        style: AppStyles.heading1(context).copyWith(
          // fontSize: 28,
          color: Colors.amber[700],
          fontWeight: FontWeight.bold,
        ),
      ),
    );
  }

  Widget _timeBox(BuildContext context, int value, String label) {
    return Column(
      mainAxisSize: MainAxisSize.min,
      children: [
        Text(
          value.toString().padLeft(2, '0'),
          style: AppStyles.heading1(context).copyWith(
            color: Colors.amber[700],
            // fontSize: 28,
            fontWeight: FontWeight.bold,
            fontFamily: 'KantumruyPro',
          ),
        ),
        SizedBox(height: MediaQuery.sizeOf(context).height * 0.004),
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
