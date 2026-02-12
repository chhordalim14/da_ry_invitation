import 'package:da_ry_invitation/core/widget/app_styles.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:responsive_framework/responsive_framework.dart';

class BrideAndGroomSection extends StatelessWidget {
  const BrideAndGroomSection({super.key});

  @override
  Widget build(BuildContext context) {
    return ResponsiveRowColumn(
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

      rowMainAxisAlignment: MainAxisAlignment.spaceAround,
      rowVerticalDirection: VerticalDirection.down,
      rowCrossAxisAlignment: CrossAxisAlignment.center,
      columnCrossAxisAlignment: CrossAxisAlignment.center,

      columnSpacing: 24,
      children: [
        ResponsiveRowColumnItem(
          child: Column(
            children: [
              Text(
                'កូនប្រុសនាម',
                style: AppStyles.bodyText(context).copyWith(
                  color: Colors.amber[700],
                  // fontSize: 18,
                  // fontWeight: FontWeight.bold,
                  
                ),
              ),
              SizedBox(height: 8),
              Text(
                'លឺម ឆដា',
                style: AppStyles.heading2(context).copyWith(
                  color: Colors.amber[700],
                  // fontSize: 18,
                  fontWeight: FontWeight.bold,
                  fontFamily: 'Moulpali',
                  
                ),
              ),
            ],
          ),
        ),
        ResponsiveRowColumnItem(
          child: SizedBox(
            height: 100,
            width: 100,
            child: SvgPicture.asset(
              'assets/wedding_name.svg',
              fit: BoxFit.contain,
            ),
          ),
        ),
        ResponsiveRowColumnItem(
          child: Column(
            children: [
              Text(
                'កូនស្រីនាម',
                style: AppStyles.bodyText(context).copyWith(
                  color: Colors.amber[700],
                  // fontSize: 18,
                  // fontWeight: FontWeight.bold,
                  
                ),
              ),
              SizedBox(height: 8),
              Text(
                'យី សុធារី',
                style: AppStyles.heading2(context).copyWith(
                  color: Colors.amber[700],
                  // fontSize: 18,
                  fontWeight: FontWeight.bold,
                  fontFamily: 'Moulpali',
                  
                ),
              ),
            ],
          ),
        ),
      ],
    );
  }
}
