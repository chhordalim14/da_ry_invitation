import 'dart:ui';

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
    return Column(
      children: [
        Text(
          'ទីតាំងពិធីអាពាហ៍ពិពាហ៍ / LOCATION',
          style: AppStyles.heading2(context).copyWith(
            color: Colors.amber[700],
            // fontSize: 18,
            fontWeight: FontWeight.bold,
            fontFamily: 'Moulpali',
          ),
        ),
        SizedBox(height: MediaQuery.sizeOf(context).height * 0.02),
        Container(
          height: MediaQuery.sizeOf(context).height * 0.3,
          width: MediaQuery.sizeOf(context).height * 0.3,
          decoration: BoxDecoration(
            border: Border.all(color: Colors.amber[700]!, width: 1),
            borderRadius: BorderRadius.circular(10),
          ),
          child: Image.asset('assets/qr_location.png', fit: BoxFit.contain),
        ),
        const SizedBox(height: 30),
        // GestureDetector(
        //   onTap: () async {
        //     final Uri url = Uri.parse(
        //       'https://maps.app.goo.gl/C5WmLrh2ZXjV9rNw6',
        //     );
        //     if (!await launchUrl(url)) {
        //       throw 'Could not launch $url';
        //     }
        //   },
        //   child: ClipRRect(
        //     borderRadius: BorderRadius.circular(30),
        //     child: BackdropFilter(
        //       filter: ImageFilter.blur(sigmaX: 10, sigmaY: 10),
        //       child: Container(
        //         width: 180,
        //         height: 50,
        //         decoration: BoxDecoration(
        //           color: Colors.blueAccent.withValues(alpha: 0.5),
        //           borderRadius: BorderRadius.circular(30),
        //           border: Border.all(
        //             color: Colors.blueAccent.withValues(alpha: 0.4),
        //           ),
        //         ),
        //         child: Row(
        //           mainAxisAlignment: MainAxisAlignment.center,
        //           children: [
        //             const Icon(
        //               FontAwesomeIcons.envelopeOpen,
        //               size: 16,
        //               color: Colors.white,
        //             ),
        //             SizedBox(width: MediaQuery.sizeOf(context).height * 0.02),
        //             Text('ចុចមើលទីតាំង', style: AppStyles.buttonText(context)),
        //           ],
        //         ),
        //       ),
        //     ),
        //   ),
        // ),
        GestureDetector(
              onTap: () async {
                final Uri url = Uri.parse(
                  'https://maps.app.goo.gl/C5WmLrh2ZXjV9rNw6',
                );
                if (!await launchUrl(url)) {
                  throw 'Could not launch $url';
                }
              },
              child: Container(
                width: ResponsiveValue<double>(
                  context,
                  defaultValue: MediaQuery.of(context).size.width * 0.5,
                  conditionalValues: [
                    Condition.largerThan(
                      name: MOBILE,
                      value: MediaQuery.of(context).size.width * 0.3,
                    ),
                    Condition.largerThan(
                      name: TABLET,
                      value: MediaQuery.of(context).size.width * 0.2,
                    ),
                  ],
                ).value,
                height: ResponsiveValue<double>(
                  context,
                  defaultValue: MediaQuery.of(context).size.height * 0.05,
                  conditionalValues: [
                    Condition.largerThan(
                      name: MOBILE,
                      value: MediaQuery.of(context).size.width * 0.055,
                    ),
                    Condition.largerThan(
                      name: TABLET,
                      value: MediaQuery.of(context).size.width * 0.045,
                    ),
                  ],
                ).value,
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
                      color: Colors.white,
                      blurRadius: 8,
                      spreadRadius: 1,
                      offset: const Offset(-4, -4),
                    ),
                  ],
                ),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Icon(
                      FontAwesomeIcons.locationDot,
                      size: 18,
                      color: Colors.white,
                    ),
                    SizedBox(width: MediaQuery.sizeOf(context).height * 0.008),
                    Flexible(
                      child: Text(
                        'ចុចមើលទីតាំង',
                        maxLines: 1,
                        overflow: TextOverflow.ellipsis,
                        style: AppStyles.bodyText1(context).copyWith(
                          color: Colors.white,
                          fontWeight: FontWeight.bold,
                          fontFamily: 'Moulpali',
                        ),
                      ),
                    ),
                  ],
                ),
              ),
            )
            .animate(onPlay: (controller) => controller.repeat(reverse: true))
            .scale(
              begin: const Offset(1, 1),
              end: const Offset(1.05, 1.05),
              duration: 1.seconds,
              curve: Curves.easeInOut,
            ),
      ],
    );
  }
}
