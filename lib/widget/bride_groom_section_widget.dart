import 'package:da_ry_invitation/core/widget/app_styles.dart';
import 'package:flutter/material.dart';
import 'package:responsive_framework/responsive_framework.dart';

class BrideAndGroomSection extends StatelessWidget {
  const BrideAndGroomSection({super.key, required this.scrollController});
  final ScrollController scrollController;

  @override
  Widget build(BuildContext context) {
    final breakpoints = ResponsiveBreakpoints.of(context);
    final isDesktop = breakpoints.isDesktop;

    const double verticalSpacing = 12;
    const double horizontalSpacing = 24;

    // Set max width for readability
    final maxWidth = isDesktop ? 900.0 : double.infinity;

    // Image size
    final double imageSize = isDesktop ? 150 : 120;

    return Center(
      child: ConstrainedBox(
        constraints: BoxConstraints(maxWidth: maxWidth),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            /// Groom Section
            Expanded(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  Text(
                    'កូនប្រុសនាម',
                    textAlign: TextAlign.center,
                    style: AppStyles.bodyText(
                      context,
                    ).copyWith(color: Colors.amber[700]),
                  ),
                  const SizedBox(height: verticalSpacing),
                  Text(
                    'លឹម ឆដា',
                    textAlign: TextAlign.center,
                    style: AppStyles.heading2(context).copyWith(
                      color: Colors.amber[700],
                      fontWeight: FontWeight.bold,
                      fontFamily: 'Moulpali',
                    ),
                  ),
                ],
              ),
            ),

            /// Spacer
            const SizedBox(width: horizontalSpacing),

            /// Center Image
            SizedBox(
              width: imageSize,
              height: imageSize,
              child: Image.asset(
                'assets/wedding_frame_name_1.png',
                fit: BoxFit.contain,
              ),
            ),

            /// Spacer
            const SizedBox(width: horizontalSpacing),

            /// Bride Section
            Expanded(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  Text(
                    'កូនស្រីនាម',
                    textAlign: TextAlign.center,
                    style: AppStyles.bodyText(
                      context,
                    ).copyWith(color: Colors.amber[700]),
                  ),
                  const SizedBox(height: verticalSpacing),
                  Text(
                    'យី សុធារី',
                    textAlign: TextAlign.center,
                    style: AppStyles.heading2(context).copyWith(
                      color: Colors.amber[700],
                      fontWeight: FontWeight.bold,
                      fontFamily: 'Moulpali',
                    ),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
