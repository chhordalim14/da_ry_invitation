import 'package:da_ry_invitation/core/constants/constants.dart';
import 'package:da_ry_invitation/core/widget/app_styles.dart';
import 'package:flutter/material.dart';
import 'package:flutter_animate/flutter_animate.dart';

class EventStep {
  final String time;
  final String title;
  final String description;

  EventStep({
    required this.time,
    required this.title,
    required this.description,
  });
}

class WeddingProgramStepper extends StatelessWidget {
  const WeddingProgramStepper({super.key});

  Widget _timelineItem({
    required String time,
    required String title,
    required String icon,
    required BuildContext context,
  }) {
    return IntrinsicHeight(
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: [
          Center(
            child: SizedBox(
              width: 35,
              height: 35,
              child: Image.asset(icon, fit: BoxFit.contain),
            ),
          ),
          AnimatedSoftSCurveLine(width: 20, color: Colors.amber.shade700),

          Expanded(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  time,
                  style: AppStyles.bodyText(context).copyWith(
                    color: Colors.amber.shade700,
                    fontWeight: FontWeight.w400,
                  ),
                ),
                const SizedBox(height: 4),
                Text(
                  title,
                  style: AppStyles.bodyText1(context).copyWith(
                    color: Colors.amber.shade700,
                    fontWeight: FontWeight.bold,
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.center,
      children: [
        const SizedBox(height: 16),
        Text(
          'របៀបរារះកម្មវិធី / EVENT AGENDA',
          style: AppStyles.heading2(context).copyWith(
            color: Colors.amber[700],
            // fontSize: 18,
            fontWeight: FontWeight.bold,
          ),
        ),
        const SizedBox(height: 16),
        Text(
          "កម្មវិធីថ្ងៃទីមួយ ថ្ងៃសៅរ៍ ទី ០៧ ខែមីនា ឆ្នាំ ២០២៦",
          style: TextStyle(
            fontSize: 16,
            fontWeight: FontWeight.bold,
            color: Colors.amber[700],
          ),
        ),
        const SizedBox(height: 20),

        /// Row 1
        Row(
          children: [
            Expanded(
              child: _timelineItem(
                time: 'ម៉ោង ០២:០០ រសៀល',
                title: 'ពិធីក្រុងពាលី',
                icon: 'assets/icons/icon_13.png',
                context: context,
              ),
            ),
            const SizedBox(width: 16),
            Expanded(
              child: _timelineItem(
                time: 'ម៉ោង ០៣:០០ រសៀល',
                title: 'ពិធីសូត្រមន្ត',
                icon: 'assets/icons/icon_14.png',
                context: context,
              ),
            ),
          ],
        ),

        const SizedBox(height: 16),

        /// Row 2
        Row(
          children: [
            Expanded(
              child: _timelineItem(
                time: 'ម៉ោង ០៤:០០ រសៀល',
                title: 'ពិធីជាវខាន់ស្លា',
                icon: 'assets/icons/icon_15.png',
                context: context,
              ),
            ),
            const SizedBox(width: 16),
            Expanded(
              child: _timelineItem(
                time: 'ម៉ោង ០៥:០០ រសៀល',
                title: 'ពិសាអាហារពេលល្ងាច',
                icon: 'assets/icons/icon_17.png',
                context: context,
              ),
            ),
          ],
        ),
        const SizedBox(height: 20),
        Text(
          "កម្មវិធីថ្ងៃទី២ ថ្ងៃសៅរ៍ ទី ០៧ ខែមីនា ឆ្នាំ ២០២៦",
          style: TextStyle(
            fontSize: 16,
            fontWeight: FontWeight.bold,
            color: Colors.amber[700],
          ),
        ),
        const SizedBox(height: 20),

        /// Row 3
        Row(
          children: [
            Expanded(
              child: _timelineItem(
                time: 'ម៉ោង ០៦:៣០ ព្រឹក',
                title: 'ពិធីហែជំនួន',
                icon: 'assets/icons/icon_17.png',
                context: context,
              ),
            ),
            const SizedBox(width: 16),
            /* Expanded(
              child: _timelineItem(
                time: 'ម៉ោង ០៧:០០ ព្រឹក',
                title: 'ពិធីហែជំនួនកំណត់ចូលរោងជ័យ',
                icon: 'assets/icons/icon_1.png',
              ),
            ), */
            Expanded(
              child: _timelineItem(
                time: 'ម៉ោង ០៧:០០ ព្រឹក',
                title: 'ពិធីចៅមហានិយាយជើងការ',
                icon: 'assets/icons/icon_1.png',
                context: context,
              ),
            ),
          ],
        ),
        const SizedBox(height: 16),

        /// Row 4
        Row(
          children: [
            Expanded(
              child: _timelineItem(
                time: 'ម៉ោង ០៧:៣០ ព្រឹក',
                title: 'ពិសាអាហារពេលព្រឹក',
                icon: 'assets/icons/icon_17.png',
                context: context,
              ),
            ),
            const SizedBox(width: 16),
            Expanded(
              child: _timelineItem(
                time: 'ម៉ោង ០៨:០០ ព្រឹក',
                title: 'ពិធីបំពាក់ចិញ្ចៀន',
                icon: 'assets/icons/icon_2.png',
                context: context,
              ),
            ),
          ],
        ),
        const SizedBox(height: 16),

        /// Row 5
        Row(
          children: [
            Expanded(
              child: _timelineItem(
                time: 'ម៉ោង ០៩:០០ ព្រឹក',
                title: 'ពិធីកាត់សក់ កូនប្រុស និងកូនស្រី',
                icon: 'assets/icons/icon_10.png',
                context: context,
              ),
            ),
            const SizedBox(width: 16),
            Expanded(
              child: _timelineItem(
                time: 'ម៉ោង ១១:០០ ព្រឹក',
                // title: 'ពិធីសំពះផ្ទឹបចង់ដៃ បង្វិលពពិល និងព្រះថោងតោងស្បៃ',
                title: 'ពិធីសំពះផ្ទឹបចង់ដៃ',
                icon: 'assets/icons/icon_3.png',
                context: context,
              ),
            ),
          ],
        ),
        const SizedBox(height: 16),

        /// Row 6
        Row(
          children: [
            Expanded(
              child: _timelineItem(
                time: 'ម៉ោង ១២:០០ ព្រឹក',
                title: 'ពិសាអាហារពេលថ្ងៃត្រង់',
                icon: 'assets/icons/icon_1.png',
                context: context,
              ),
            ),
            const SizedBox(width: 16),
            Expanded(
              child: _timelineItem(
                time: 'ម៉ោង ០៥:០០ ល្ងាច',
                title: 'ពិសាហារពេលល្ងាច',
                icon: 'assets/icons/icon_16.png',
                context: context,
              ),
            ),
          ],
        ),
      ],
    );
  }
}

class AnimatedSoftSCurveLine extends StatelessWidget {
  const AnimatedSoftSCurveLine({
    super.key,
    this.width = 20,
    this.color = Colors.grey,
  });

  final double width;
  final Color color;

  @override
  Widget build(BuildContext context) {
    return SizedBox(
          width: width,
          child: CustomPaint(
            painter: SoftSCurveLinePainter(
              color: color,
              strokeWidth: 1,
              curveAmount: 3, // 🔹 tweak: 4–8 recommended
            ),
          ),
        )
        // 👇 tiny breathing animation
        .animate(onPlay: (controller) => controller.repeat(reverse: true))
        .slideX(
          begin: -0.01,
          end: 0.01,
          duration: 1800.ms,
          curve: Curves.easeInOut,
        );
  }
}

class SoftSCurveLinePainter extends CustomPainter {
  final Color color;
  final double strokeWidth;
  final double curveAmount; // 👈 control how strong the S is

  SoftSCurveLinePainter({
    required this.color,
    this.strokeWidth = 1,
    this.curveAmount = 3, // 🔹 small value = subtle curve
  });

  @override
  void paint(Canvas canvas, Size size) {
    final paint = Paint()
      ..color = color
      ..style = PaintingStyle.stroke
      ..strokeWidth = strokeWidth
      ..strokeCap = StrokeCap.round;

    final path = Path();

    path.moveTo(size.width / 2, 0);

    // Top → middle (curve right)
    path.cubicTo(
      size.width / 2 + curveAmount,
      size.height * 0.25,
      size.width / 2 + curveAmount,
      size.height * 0.25,
      size.width / 2,
      size.height * 0.5,
    );

    // Middle → bottom (curve left)
    path.cubicTo(
      size.width / 2 - curveAmount,
      size.height * 0.75,
      size.width / 2 - curveAmount,
      size.height * 0.75,
      size.width / 2,
      size.height,
    );

    canvas.drawPath(path, paint);
  }

  @override
  bool shouldRepaint(covariant CustomPainter oldDelegate) => false;
}
