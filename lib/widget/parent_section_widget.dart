import 'package:da_ry_invitation/core/widget/app_styles.dart';
import 'package:flutter/material.dart';
import 'package:responsive_framework/responsive_framework.dart';

class ParentSectionWidget extends StatelessWidget {
  const ParentSectionWidget({super.key});

  @override
  Widget build(BuildContext context) {
    final normalTextStyle = AppStyles.bodyText(context).copyWith(
      color: Colors.amber[700],
      // fontSize: 18,
      fontWeight: FontWeight.bold,

      // fontFamily: 'Moulpali',
    );
    final textStyle = AppStyles.bodyText(context).copyWith(
      color: Colors.amber[700],
      // fontSize: 18,
      fontWeight: FontWeight.bold,
      fontFamily: 'Moulpali',
    );
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

      rowMainAxisAlignment: MainAxisAlignment.spaceBetween,
      rowCrossAxisAlignment: CrossAxisAlignment.center,
      columnCrossAxisAlignment: CrossAxisAlignment.center,

      columnSpacing: 16,
      children: [
        ResponsiveRowColumnItem(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              Text('លោក លីម វាំងធី', style: normalTextStyle),
              SizedBox(height: 8),
              Text('លោកស្រី ហម សុផន', style: textStyle),
            ],
          ),
        ),
        ResponsiveRowColumnItem(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              Text('លោក ហុក យ៉ុន', style: normalTextStyle),
              SizedBox(height: 8),
              Text('លោកស្រី ឈា ណាវី', style: textStyle),
            ],
          ),
        ),
      ],
    );
  }
}
