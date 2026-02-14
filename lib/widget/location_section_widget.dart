import 'dart:ui';

import 'package:da_ry_invitation/core/widget/app_styles.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:url_launcher/url_launcher.dart';

class LocationSection extends StatelessWidget {
  const LocationSection({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Text(
          'ទីតាំងពិធីអាពាហ៍ពិពាហ៍ / Location',
          style: AppStyles.heading2(context).copyWith(
            color: Colors.amber[700],
            // fontSize: 18,
            fontWeight: FontWeight.bold,
          ),
        ),
        const SizedBox(height: 16),
        Container(
          height: 250,
          width: 250,
          decoration: BoxDecoration(
            border: Border.all(color: Colors.amber[700]!, width: 2),
            borderRadius: BorderRadius.circular(10),
          ),
          child: Image.asset('assets/qr_location.png', fit: BoxFit.contain),
        ),
        const SizedBox(height: 30),
        GestureDetector(
          onTap: () async {
            final Uri url = Uri.parse(
              'https://maps.app.goo.gl/C5WmLrh2ZXjV9rNw6',
            );
            if (!await launchUrl(url)) {
              throw 'Could not launch $url';
            }
          },
          child: ClipRRect(
            borderRadius: BorderRadius.circular(30),
            child: BackdropFilter(
              filter: ImageFilter.blur(sigmaX: 10, sigmaY: 10),
              child: Container(
                width: 180,
                height: 50,
                decoration: BoxDecoration(
                  color: Colors.blueAccent.withValues(alpha: 0.5),
                  borderRadius: BorderRadius.circular(30),
                  border: Border.all(
                    color: Colors.blueAccent.withValues(alpha: 0.4),
                  ),
                ),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    const Icon(
                      FontAwesomeIcons.envelopeOpen,
                      size: 16,
                      color: Colors.white,
                    ),
                    const SizedBox(width: 10),
                    Text('ចុចមើលទីតាំង', style: AppStyles.buttonText(context)),
                  ],
                ),
              ),
            ),
          ),
        ),
      ],
    );
  }
}
