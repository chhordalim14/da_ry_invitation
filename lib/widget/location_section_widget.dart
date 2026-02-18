import 'package:da_ry_invitation/core/widget/app_styles.dart';
import 'package:flutter/material.dart';
import 'package:flutter_animate/flutter_animate.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:responsive_framework/responsive_framework.dart';
import 'package:url_launcher/url_launcher.dart';

class LocationSection extends StatelessWidget {
  const LocationSection({super.key});

  @override
  Widget build(BuildContext context) {
    final breakpoints = ResponsiveBreakpoints.of(context);
    final isDesktop = breakpoints.isDesktop;
    final isTablet = breakpoints.isTablet;

    // Dynamic sizing
    final double qrSize = isDesktop
        ? 250
        : isTablet
        ? 200
        : 150;
    final double buttonHeight = isDesktop
        ? 60
        : isTablet
        ? 50
        : 45;
    final double buttonWidth = isDesktop
        ? MediaQuery.sizeOf(context).width * 0.25
        : isTablet
        ? MediaQuery.sizeOf(context).width * 0.35
        : MediaQuery.sizeOf(context).width * 0.5;
    final double iconSize = isDesktop
        ? 22
        : isTablet
        ? 20
        : 18;
    final double spacing = qrSize * 0.03;

    return Column(
      children: [
        Text(
          'ទីតាំងពិធីអាពាហ៍ពិពាហ៍ / LOCATION',
          style: AppStyles.bodyText(context).copyWith(
            color: Colors.amber[700],
            fontWeight: FontWeight.bold,
            fontFamily: 'Moulpali',
            // fontSize: qrSize * 0.14,
          ),
          textAlign: TextAlign.center,
        ),
        SizedBox(height: spacing * 9),
        Container(
          height: qrSize,
          width: qrSize,
          decoration: BoxDecoration(
            border: Border.all(color: Colors.amber[700]!, width: 1.5),
            borderRadius: BorderRadius.circular(12),
          ),
          child: Image.asset('assets/qr_location.png', fit: BoxFit.contain),
        ),
        SizedBox(height: spacing * 9),
        GestureDetector(
          onTap: () async {
            final Uri url = Uri.parse(
              'https://maps.app.goo.gl/C5WmLrh2ZXjV9rNw6',
            );
            if (!await launchUrl(url)) {
              throw 'Could not launch $url';
            }
          },
          child:
              Container(
                    width: buttonWidth,
                    height: buttonHeight,
                    decoration: BoxDecoration(
                      color: Colors.amber[700],
                      borderRadius: BorderRadius.circular(30),
                      boxShadow: [
                        BoxShadow(
                          color: Colors.grey.shade500,
                          blurRadius: 8,
                          spreadRadius: 1,
                          offset: const Offset(4, 4),
                        ),
                        BoxShadow(
                          color: Colors.white.withValues(alpha: 0.7),
                          blurRadius: 8,
                          spreadRadius: 1,
                          offset: Offset(-4, -4),
                        ),
                      ],
                    ),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Icon(
                          FontAwesomeIcons.locationDot,
                          size: iconSize,
                          color: Colors.white,
                        ),
                        SizedBox(width: spacing * 0.5),
                        Flexible(
                          child: Text(
                            'ចុចមើលទីតាំង',
                            maxLines: 1,
                            overflow: TextOverflow.ellipsis,
                            style: AppStyles.bodyText1(context).copyWith(
                              color: Colors.white,
                              // fontWeight: FontWeight.bold,
                              fontFamily: 'Moulpali',
                              // fontSize: buttonHeight * 0.4,
                            ),
                          ),
                        ),
                      ],
                    ),
                  )
                  .animate(
                    onPlay: (controller) => controller.repeat(reverse: true),
                  )
                  .scale(
                    begin: const Offset(1, 1),
                    end: const Offset(1.05, 1.05),
                    duration: 1.seconds,
                    curve: Curves.easeInOut,
                  ),
        ),
      ],
    );
  }
}
