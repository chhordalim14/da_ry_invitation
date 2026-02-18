import 'package:flutter/material.dart';
import 'package:flutter_animate/flutter_animate.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:da_ry_invitation/core/widget/app_styles.dart';

class ScrollHint extends StatelessWidget {
  final double scrollOffset;

  const ScrollHint({super.key, required this.scrollOffset});

  @override
  Widget build(BuildContext context) {
    const double startFade = 100;
    const double endFade = 250;

    double opacity;
    if (scrollOffset <= startFade) {
      opacity = 1;
    } else if (scrollOffset >= endFade) {
      opacity = 0;
    } else {
      double progress = (scrollOffset - startFade) / (endFade - startFade);
      opacity = 1 - progress;
    }

    final verticalSpacing = MediaQuery.sizeOf(context).height * 0.01;

    return Opacity(
      opacity: opacity.clamp(0.0, 1.0),
      child:
          Column(
                mainAxisSize: MainAxisSize.min,
                children: [
                  Icon(
                    FontAwesomeIcons.anglesUp,
                    color: Colors.amber[700],
                    size: 20,
                  ),
                  SizedBox(height: verticalSpacing),
                  Text(
                    'អូសឡើងលើ',
                    style: AppStyles.bodyText1(context).copyWith(
                      color: Colors.amber[700],
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                ],
              )
              .animate(onPlay: (controller) => controller.repeat())
              .shakeY(duration: 4.seconds, hz: 0.6),
    );
  }
}
