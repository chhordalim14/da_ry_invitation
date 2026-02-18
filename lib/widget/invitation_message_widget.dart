import 'package:da_ry_invitation/core/widget/app_styles.dart';
import 'package:flutter/material.dart';
import 'package:responsive_framework/responsive_framework.dart';

class InvitationMessage extends StatelessWidget {
  const InvitationMessage({super.key, required this.scrollController});

  final ScrollController scrollController;

  @override
  Widget build(BuildContext context) {
    final breakpoints = ResponsiveBreakpoints.of(context);
    final isDesktop = breakpoints.isDesktop;

    /// Control readable width (very important for web)
    final maxWidth = isDesktop ? 800.0 : double.infinity;

    /// Professional spacing scale
    const double verticalSpacing = 16;

    return Center(
      child: ConstrainedBox(
        constraints: BoxConstraints(maxWidth: maxWidth),
        child: Column(
          children: [
            Text(
              'មានកិត្តិយសសូមគោរពអញ្ជើញ',
              textAlign: TextAlign.center,
              style: AppStyles.bodyText(context).copyWith(
                color: Colors.amber[700],
                fontWeight: FontWeight.bold,
                fontFamily: 'Moulpali',
              ),
            ),

            const SizedBox(height: verticalSpacing),

            Text(
              'ឯកឧត្តម លោកអ្នកឧកញ៉ា អ្នកឧកញ៉ា លោកជំទាវ លោក លោកស្រី អ្នកនាង កញ្ញា អញ្ជើញចូលរួមជាអធិបតី និងជាភ្ញៀវកិត្តិយស ដើម្បីប្រសិទ្ធិពរជ័យសិរីសួស្តី ជ័យមង្គល ក្នុងពិធីអាពាហ៍ពិពាហ៍ កូនប្រុស-កូនស្រីរបស់យើងខ្ញុំ',
              textAlign: TextAlign.center,
              style: AppStyles.bodyText1(context).copyWith(
                color: Colors.amber[700],
                fontFamily: 'KantumruyPro',
                height: 1.6, // improves readability
              ),
            ),
          ],
        ),
      ),
    );
  }
}
