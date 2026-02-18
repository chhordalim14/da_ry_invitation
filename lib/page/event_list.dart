import 'package:flutter/material.dart';
import 'package:flutter_animate/flutter_animate.dart';
import 'package:da_ry_invitation/core/widget/app_styles.dart';
import 'package:responsive_framework/responsive_framework.dart';

class EventStep {
  final String time;
  final String title;
  final String icon;

  EventStep({required this.time, required this.title, required this.icon});
}

class WeddingProgramStepper extends StatelessWidget {
  WeddingProgramStepper({super.key});

  final List<EventStep> day1Events = [
    EventStep(
      time: 'ម៉ោង ០២:០០ រសៀល',
      title: 'ពិធីក្រុងពាលី',
      icon: 'assets/icons/icon_13.png',
    ),
    EventStep(
      time: 'ម៉ោង ០៣:០០ រសៀល',
      title: 'ពិធីសូត្រមន្ត',
      icon: 'assets/icons/icon_14.png',
    ),
    EventStep(
      time: 'ម៉ោង ០៤:០០ រសៀល',
      title: 'ពិធីជាវខាន់ស្លា',
      icon: 'assets/icons/icon_15.png',
    ),
  ];

  final List<EventStep> day2Events = [
    EventStep(
      time: 'ម៉ោង ០៦:៣០ ព្រឹក',
      title: 'ពិធីហែជំនូន',
      icon: 'assets/icons/icon_18.png',
    ),
    EventStep(
      time: 'ម៉ោង ០៧:០០ ព្រឹក',
      title: 'ពិធីចៅមហានិយាយជើងការ',
      icon: 'assets/icons/icon_6.png',
    ),
    EventStep(
      time: 'ម៉ោង ០៧:៣០ ព្រឹក',
      title: 'ពិសាអាហារពេលព្រឹក',
      icon: 'assets/icons/icon_17.png',
    ),
    EventStep(
      time: 'ម៉ោង ០៨:០០ ព្រឹក',
      title: 'ពិធីបំពាក់ចិញ្ចៀន',
      icon: 'assets/icons/icon_2.png',
    ),
    EventStep(
      time: 'ម៉ោង ០៩:០០ ព្រឹក',
      title: 'ពិធីកាត់សក់',
      icon: 'assets/icons/icon_10.png',
    ),
    EventStep(
      time: 'ម៉ោង ១១:០០ ព្រឹក',
      title: 'ពិធីសំពះផ្ទឹមចង់ដៃ',
      icon: 'assets/icons/icon_19.png',
    ),
    EventStep(
      time: 'ម៉ោង ០៥:០០ ល្ងាច',
      title: 'ពិសាអាហារពេលល្ងាច',
      icon: 'assets/icons/icon_16.png',
    ),
  ];

  Widget _timelineItem(
    EventStep event,
    BuildContext context,
    double iconSize,
    double spacing,
  ) {
    return Column(
      mainAxisSize: MainAxisSize.min,
      children: [
        SizedBox(
          width: iconSize,
          height: iconSize,
          child: Image.asset(event.icon, fit: BoxFit.contain),
        ),
        SizedBox(height: spacing / 5),
        AnimatedSoftSCurveLine(
          height: spacing,
          width: iconSize,
          color: Colors.amber,
        ),
        SizedBox(height: spacing / 5),
        Text(
          event.time,
          style: AppStyles.bodyText1(context).copyWith(
            color: Colors.amber[700],
            fontFamily: 'KantumruyPro',
            fontSize: iconSize * 0.3,
          ),
        ),
        SizedBox(height: spacing / 4),
        SizedBox(
          width: iconSize * 2,
          child: Text(
            event.title,
            style: AppStyles.bodyText1(context).copyWith(
              color: Colors.amber[700],
              fontWeight: FontWeight.bold,
              fontFamily: 'KantumruyPro',
              // fontSize: iconSize * 0.35,
            ),
            textAlign: TextAlign.center,
          ),
        ),
      ],
    );
  }

  Widget _daySection(
    String title,
    List<EventStep> events,
    BuildContext context,
    double iconSize,
    double spacing,
  ) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.center,
      children: [
        Text(
          title,
          style: AppStyles.bodyText(context).copyWith(
            color: Colors.amber[700],
            fontWeight: FontWeight.bold,
            fontFamily: 'IMFellEnglishSC',
            // fontSize: iconSize * 0.6,
          ),
          textAlign: TextAlign.center,
        ),
        SizedBox(height: spacing),
        Wrap(
          alignment: WrapAlignment.center,
          spacing: spacing,
          runSpacing: spacing,
          children: events
              .map((event) => _timelineItem(event, context, iconSize, spacing))
              .toList(),
        ),
      ],
    );
  }

  @override
  Widget build(BuildContext context) {
    final breakpoints = ResponsiveBreakpoints.of(context);
    final isDesktop = breakpoints.isDesktop;
    final isTablet = breakpoints.isTablet;

    // Dynamic sizing
    final double iconSize = isDesktop
        ? 80
        : isTablet
        ? 60
        : 50;
    final double spacing = isDesktop
        ? 24
        : isTablet
        ? 20
        : 16;

    return SingleChildScrollView(
      child: Padding(
        padding: EdgeInsets.symmetric(horizontal: spacing),
        child: Column(
          children: [
            Text(
              'របៀបវារៈកម្មវិធី / EVENT AGENDA',
              style: AppStyles.bodyText(context).copyWith(
                color: Colors.amber[700],
                fontWeight: FontWeight.bold,
                fontFamily: 'Moulpali',
                // fontSize: iconSize * 0.6,
              ),
              textAlign: TextAlign.center,
            ),
            SizedBox(height: spacing * 3),
            _daySection(
              "កម្មវិធីថ្ងៃទី១ ថ្ងៃសៅរ៍ ទី ០៧ ខែមីនា ឆ្នាំ ២០២៦",
              day1Events,
              context,
              iconSize,
              spacing,
            ),
            SizedBox(height: spacing * 3),
            _daySection(
              "កម្មវិធីថ្ងៃទី២ ថ្ងៃសៅរ៍ ទី ០៨ ខែមីនា ឆ្នាំ ២០២៦",
              day2Events,
              context,
              iconSize,
              spacing,
            ),
          ],
        ),
      ),
    );
  }
}

class AnimatedSoftSCurveLine extends StatelessWidget {
  const AnimatedSoftSCurveLine({
    super.key,
    this.width = 40,
    this.height = 20,
    this.color = Colors.grey,
  });

  final double width;
  final double height;
  final Color color;

  @override
  Widget build(BuildContext context) {
    return SizedBox(
          width: width,
          height: height,
          child: CustomPaint(
            painter: SoftSCurveLinePainterHorizontal(color: color),
          ),
        )
        .animate(onPlay: (controller) => controller.repeat(reverse: true))
        .slideY(
          begin: -0.01,
          end: 0.01,
          duration: 1800.ms,
          curve: Curves.easeInOut,
        );
  }
}

class SoftSCurveLinePainterHorizontal extends CustomPainter {
  final Color color;
  final double strokeWidth;
  final double curveAmount;

  SoftSCurveLinePainterHorizontal({
    required this.color,
    this.strokeWidth = 1,
    this.curveAmount = 3,
  });

  @override
  void paint(Canvas canvas, Size size) {
    final paint = Paint()
      ..color = color
      ..strokeWidth = strokeWidth
      ..style = PaintingStyle.stroke
      ..strokeCap = StrokeCap.round;

    final path = Path();
    path.moveTo(0, size.height / 2);

    path.cubicTo(
      size.width * 0.25,
      size.height / 2 + curveAmount,
      size.width * 0.25,
      size.height / 2 + curveAmount,
      size.width / 2,
      size.height / 2,
    );

    path.cubicTo(
      size.width * 0.75,
      size.height / 2 - curveAmount,
      size.width * 0.75,
      size.height / 2 - curveAmount,
      size.width,
      size.height / 2,
    );

    canvas.drawPath(path, paint);
  }

  @override
  bool shouldRepaint(covariant CustomPainter oldDelegate) => false;
}
