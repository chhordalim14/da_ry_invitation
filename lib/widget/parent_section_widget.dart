import 'package:da_ry_invitation/core/widget/app_styles.dart';
import 'package:flutter/material.dart';
import 'package:responsive_framework/responsive_framework.dart';

class ParentSectionWidget extends StatelessWidget {
  const ParentSectionWidget({required this.scrollController, super.key});

  final ScrollController scrollController;

  @override
  Widget build(BuildContext context) {
    final breakpoints = ResponsiveBreakpoints.of(context);
    final isDesktop = breakpoints.isDesktop;

    final textStyle = AppStyles.bodyText(context).copyWith(
      color: Colors.amber[700],
      fontWeight: FontWeight.bold,
      fontFamily: 'Moulpali',
    );

    final verticalSpacing = 8.0;
    final maxWidth = isDesktop ? 700.0 : double.infinity;

    return Center(
      child: ConstrainedBox(
        constraints: BoxConstraints(maxWidth: maxWidth),
        child: Row(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            /// Groom Parents
            Expanded(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  Text(
                    'លោក លឹម វាំងធី',
                    textAlign: TextAlign.center,
                    style: textStyle,
                  ),
                  SizedBox(height: verticalSpacing),
                  Text(
                    'លោកស្រី ហម សុផន',
                    textAlign: TextAlign.center,
                    style: textStyle,
                  ),
                ],
              ),
            ),

            /// Space between columns
            const SizedBox(width: 20),

            /// Bride Parents
            Expanded(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  Text(
                    'លោក ហុក យ៉ុន',
                    textAlign: TextAlign.center,
                    style: textStyle,
                  ),
                  SizedBox(height: verticalSpacing),
                  Text(
                    'លោកស្រី ឈា ណាវី',
                    textAlign: TextAlign.center,
                    style: textStyle,
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
