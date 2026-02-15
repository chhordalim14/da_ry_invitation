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
    EventStep(
      time: 'ម៉ោង ០៥:០០ រសៀល',
      title: 'ពិសាអាហារពេលល្ងាច',
      icon: 'assets/icons/icon_17.png',
    ),
  ];

  final List<EventStep> day2Events = [
    EventStep(
      time: 'ម៉ោង ០៦:៣០ ព្រឹក',
      title: 'ពិធីហែជំនួន',
      icon: 'assets/icons/icon_17.png',
    ),
    EventStep(
      time: 'ម៉ោង ០៧:០០ ព្រឹក',
      title: 'ពិធីចៅមហានិយាយជើងការ',
      icon: 'assets/icons/icon_1.png',
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
      title: 'ពិធីសំពះផ្ទឹបចង់ដៃ',
      icon: 'assets/icons/icon_3.png',
    ),
    EventStep(
      time: 'ម៉ោង ១២:០០ ព្រឹក',
      title: 'ពិសាអាហារពេលថ្ងៃត្រង់',
      icon: 'assets/icons/icon_1.png',
    ),
    EventStep(
      time: 'ម៉ោង ០៥:០០ ល្ងាច',
      title: 'ពិសាហារពេលល្ងាច',
      icon: 'assets/icons/icon_16.png',
    ),
  ];

  Widget _timelineItem(EventStep event, BuildContext context) {
    return Column(
      // mainAxisSize: MainAxisSize.min,
      children: [
        SizedBox(
          width: MediaQuery.sizeOf(context).height * 0.05,
          height: MediaQuery.sizeOf(context).height * 0.05,
          child: Image.asset(event.icon, fit: BoxFit.contain),
        ),
        AnimatedSoftSCurveLine(
          height: MediaQuery.sizeOf(context).height * 0.02,
          width: MediaQuery.sizeOf(context).height * 0.04,
          color: Colors.amber,
        ),
        SizedBox(height: MediaQuery.sizeOf(context).height * 0.001),
        Text(
          event.time,
          style: AppStyles.bodyText1(
            context,
          ).copyWith(color: Colors.amber[700], fontFamily: 'KantumruyPro'),
        ),
        SizedBox(height: MediaQuery.sizeOf(context).height * 0.001),
        SizedBox(
          width: MediaQuery.sizeOf(context).height * 0.1,
          child: Text(
            event.title,
            style: AppStyles.bodyText1(context).copyWith(
              color: Colors.amber[700],
              fontWeight: FontWeight.bold,
              fontFamily: 'KantumruyPro',
            ),
            textAlign: TextAlign.center,
          ),
        ),
        SizedBox(height: MediaQuery.sizeOf(context).height * 0.001),
      ],
    );
  }

  Widget _daySection(
    String title,
    List<EventStep> events,
    BuildContext context,
  ) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.center,
      children: [
        SizedBox(height: MediaQuery.sizeOf(context).height * 0.02),
        Text(
          title,
          style: AppStyles.heading2(context).copyWith(
            color: Colors.amber[700],
            fontWeight: FontWeight.bold,
            fontFamily: 'KantumruyPro',
          ),
          textAlign: TextAlign.center,
        ),
        SizedBox(height: MediaQuery.sizeOf(context).height * 0.02),

        Wrap(
          alignment: WrapAlignment.center,
          spacing:
              MediaQuery.sizeOf(context).height *
              0.02, // horizontal spacing between items
          runSpacing:
              MediaQuery.sizeOf(context).height *
              0.02, // vertical spacing between lines
          children: events
              .map((event) => _timelineItem(event, context))
              .toList(),
        ),
      ],
    );
  }

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: Column(
        children: [
          Text(
            'របៀបរារះកម្មវិធី / EVENT AGENDA',
            style: AppStyles.heading2(context).copyWith(
              color: Colors.amber[700],
              // fontSize: 18,
              fontWeight: FontWeight.bold,
              fontFamily: 'Moulpali',
            ),
          ),
          _daySection(
            "កម្មវិធីថ្ងៃទីមួយ ថ្ងៃសៅរ៍ ទី ០៧ ខែមីនា ឆ្នាំ ២០២៦",
            day1Events,
            context,
          ),
          _daySection(
            "កម្មវិធីថ្ងៃទី២ ថ្ងៃសៅរ៍ ទី ០៧ ខែមីនា ឆ្នាំ ២០២៦",
            day2Events,
            context,
          ),
        ],
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
    path.moveTo(0, size.height / 2); // start from left middle

    // Left → middle (curve down)
    path.cubicTo(
      size.width * 0.25,
      size.height / 2 + curveAmount,
      size.width * 0.25,
      size.height / 2 + curveAmount,
      size.width / 2,
      size.height / 2,
    );

    // Middle → right (curve up)
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
