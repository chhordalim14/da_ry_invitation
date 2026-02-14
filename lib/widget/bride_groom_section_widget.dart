import 'package:da_ry_invitation/core/widget/app_styles.dart';
import 'package:da_ry_invitation/widget/scroll_fade.dart';
import 'package:flutter/material.dart';
import 'package:responsive_framework/responsive_framework.dart';

class BrideAndGroomSection extends StatelessWidget {
  const BrideAndGroomSection({super.key, required this.scrollController});
  final ScrollController scrollController;
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
              ScrollFade(
                controller: scrollController,
                start: 300,
                end: 400,
                child: Text(
                  'កូនប្រុសនាម',
                  style: AppStyles.bodyText(context).copyWith(
                    color: Colors.amber[700],

                    // fontSize: 18,
                    // fontWeight: FontWeight.bold,
                  ),
                ),
              ),
              SizedBox(height: 8),
              ScrollFade(
                controller: scrollController,
                start: 350,
                end: 450,
                child: Text(
                  'លឺម ឆដា',
                  style: AppStyles.heading2(context).copyWith(
                    color: Colors.amber[700],
                    // fontSize: 18,
                    fontWeight: FontWeight.bold,
                    fontFamily: 'Moulpali',
                  ),
                ),
              ),
            ],
          ),
        ),
        ResponsiveRowColumnItem(
          child: ScrollFade(
            controller: scrollController,
            start: 320,
            end: 420,
            child: SizedBox(
              height: 100,
              width: 100,
              child: Image.asset(
                'assets/wedding_name.png',
                fit: BoxFit.contain,
              ),
            ),
          ),
        ),
        ResponsiveRowColumnItem(
          child: Column(
            children: [
              ScrollFade(
                controller: scrollController,
                start: 300,
                end: 400,
                child: Text(
                  'កូនស្រីនាម',
                  style: AppStyles.bodyText(context).copyWith(
                    color: Colors.amber[700],

                    // fontSize: 18,
                    // fontWeight: FontWeight.bold,
                  ),
                ),
              ),
              SizedBox(height: 8),
              ScrollFade(
                controller: scrollController,
                start: 350,
                end: 450,
                child: Text(
                  'យី សុធារី',
                  style: AppStyles.heading2(context).copyWith(
                    color: Colors.amber[700],
                    // fontSize: 18,
                    fontWeight: FontWeight.bold,
                    fontFamily: 'Moulpali',
                  ),
                ),
              ),
            ],
          ),
        ),
      ],
    );
  }
}
