import 'package:da_ry_invitation/core/widget/app_styles.dart';
import 'package:da_ry_invitation/page/event_list.dart';
import 'package:flutter/material.dart';
import 'package:responsive_framework/responsive_framework.dart';

class ThankYouWidget extends StatelessWidget {
  const ThankYouWidget({super.key});

  @override
  Widget build(BuildContext context) {
    final screenWidth = MediaQuery.sizeOf(context).width;
    final isDesktop = ResponsiveBreakpoints.of(context).isDesktop;
    final isTablet = ResponsiveBreakpoints.of(context).isTablet;

    // Responsive font sizes
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

    return Center(
      child: Padding(
        padding: EdgeInsets.symmetric(
          horizontal: screenWidth * 0.05,
          vertical: 40,
        ),
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            Text(
              'សេចក្តីថ្លែងអំណរគុណ',
              textAlign: TextAlign.center,
              style: AppStyles.bodyText(context).copyWith(
                color: Colors.amber[700],
                fontWeight: FontWeight.bold,
                fontFamily: 'Moulpali',
              ),
            ),

            SizedBox(height: 20),
            Text(
              'យើងខ្ញុំ សូមគោរពថ្លែងអំណរគុណយ៉ាងជ្រាលជ្រៅចំពោះវត្តមាន ដ៏ឧត្តុង្គឧត្តមរបស់ សម្តេច ឯកឧត្តម លោកជំទាវ លោកអ្នកឧកញ៉ា អ្នកឧញ៉ា ឧកញ៉ា លោក លោកស្រី អ្នកនាងកញ្ញា ដែលអញ្ជើញផ្តល់កិត្តិយស ចូលរួមពិធីមង្គលការរបស់ កូនប្រុស កូនស្រីរបស់យើងខ្ញុំ។ យើងខ្ញុំសូមការយោគយល់ និងអភ័យទោស ក្នុងករណីដែល យើងខ្ញុំពុំបានជូនលិខិតអញ្ជើញដោយផ្ទាល់ ឬ មាន កំហុសអក្ខរាវិរុទ្ធក្នុងការសរសេរឈ្មោះ។ ',
              textAlign: TextAlign.center,
              style: AppStyles.bodyText1(context).copyWith(
                color: Colors.amber[700],
                fontFamily: 'KantumruyPro',
                height: 1.6, // improves readability
              ),
            ),
            SizedBox(height: 20),
            AnimatedSoftSCurveLine(
              height: spacing,
              width: iconSize * 3,
              color: Colors.amber,
            ),
            SizedBox(height: 20),
            Text(
              'OUR GRATITUDE',
              textAlign: TextAlign.center,
              style: AppStyles.bodyText(context).copyWith(
                color: Colors.amber[700],
                fontWeight: FontWeight.bold,
                fontFamily: 'Moulpali',
              ),
            ),

            SizedBox(height: 20),
            Text(
              'WE ARE DEEPLY GRATEFUL TO H.E... LOK NEAK OKNHA, NEAK OKNHA OKNHA LCT. LADIES AND GENTLEMEN, FOR HONORING US WITH YOUR PRESENCE AT OUR UPCOMING WEDDING CEREMONY.',
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
