import 'package:da_ry_invitation/core/constants/constants.dart';
import 'package:da_ry_invitation/core/widget/app_styles.dart';
import 'package:da_ry_invitation/widget/date_divider_widget.dart';
import 'package:flutter/material.dart';
import 'package:responsive_framework/responsive_framework.dart';

class EnglishInvitation extends StatelessWidget {
  const EnglishInvitation({super.key});

  @override
  Widget build(BuildContext context) {
    final parentsTextStyle = AppStyles.bodyText(context).copyWith(
      color: Colors.amber[700],
      // fontSize: 18,
      fontWeight: FontWeight.bold,
      // fontFamily: 'Playball',
      
    );

    return Column(
      children: [
        Text(
          'Wedding Ceremony',
          style: AppStyles.heading1(context).copyWith(
            color: Colors.amber[700],
            // fontSize: 18,
            fontWeight: FontWeight.bold,
            // fontFamily: ,
            
          ),
        ),
        const SizedBox(height: 24),
        ResponsiveRowColumn(
          layout: ResponsiveValue<ResponsiveRowColumnType>(
            context,
            defaultValue: ResponsiveRowColumnType.ROW,
            conditionalValues: [
              Condition.smallerThan(
                name: TABLET,
                value: ResponsiveRowColumnType.ROW,
              ),
            ],
          ).value,

          rowMainAxisAlignment: MainAxisAlignment.spaceBetween,
          rowCrossAxisAlignment: CrossAxisAlignment.center,
          columnCrossAxisAlignment: CrossAxisAlignment.center,

          columnSpacing: 16,
          children: [
            ResponsiveRowColumnItem(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  Text('Mr. LIM VANTHY', style: parentsTextStyle),
                  Text('Mrs. HAM SOPHAN', style: parentsTextStyle),
                ],
              ),
            ),
            ResponsiveRowColumnItem(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  Text('Mr. HOK YONN', style: parentsTextStyle),
                  Text('Mrs. CHHEA NAVY', style: parentsTextStyle),
                ],
              ),
            ),
          ],
        ),
        const SizedBox(height: 24),
        Text(
          'Cordially request the honor of your presence on the auspicious occasion of the wedding of our children',
          style: AppStyles.heading2(context).copyWith(
            color: colorsApp,
            fontSize: 25,
            fontFamily: 'Playball',
            fontWeight: FontWeight.w500,
          ),
          textAlign: TextAlign.center,
        ),
        const SizedBox(height: 24),
        ResponsiveRowColumn(
          layout: ResponsiveValue<ResponsiveRowColumnType>(
            context,
            defaultValue: ResponsiveRowColumnType.ROW,
            conditionalValues: [
              Condition.smallerThan(
                name: TABLET,
                value: ResponsiveRowColumnType.ROW,
              ),
            ],
          ).value,

          rowMainAxisAlignment: MainAxisAlignment.center,
          columnSpacing: 8,
          children: [
            ResponsiveRowColumnItem(
              child: Text(
                'Lim Chhorda',
                style: AppStyles.heading1(context).copyWith(
                  color: Colors.amber[700],
                  // fontSize: 18,
                  fontWeight: FontWeight.bold,
                  fontFamily: 'TwinkleStar',
                 
                ),
              ),
            ),
            ResponsiveRowColumnItem(
              child: Text(
                ' & ',
                style: AppStyles.heading1(
                  context,
                ).copyWith(color: Colors.amber[700], fontFamily: 'TwinkleStar'),
              ),
            ),
            ResponsiveRowColumnItem(
              child: Text(
                'Yi Sotheary',
                style: AppStyles.heading1(context).copyWith(
                  color: Colors.amber[700],
                  // fontSize: 18,
                  fontWeight: FontWeight.bold,
                  fontFamily: 'TwinkleStar',
                 
                ),
              ),
            ),
          ],
        ),
        const SizedBox(height: 32),
        DateDivider(),
        const SizedBox(height: 32),
        Text(
          'AT CAMBODIAN RED CROSS KANDAL. BRANCH\n(PLEASE SEE THE MAP)\nTHANK YOU!',
          style: AppStyles.bodyText(context).copyWith(color: colorsApp),
          textAlign: TextAlign.center,
        ),
      ],
    );
  }
}
