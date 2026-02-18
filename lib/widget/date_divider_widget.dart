import 'package:da_ry_invitation/core/widget/app_styles.dart';
import 'package:flutter/material.dart';
import 'package:responsive_framework/responsive_framework.dart';

class DateDivider extends StatelessWidget {
  const DateDivider({super.key, required this.scrollController});
  final ScrollController scrollController;

  @override
  Widget build(BuildContext context) {
    // Responsive spacing
    final double horizontalSpacing = ResponsiveValue<double>(
      context,
      defaultValue: MediaQuery.sizeOf(context).height * 0.02,
      conditionalValues: [
        Condition.largerThan(
          name: MOBILE,
          value: MediaQuery.sizeOf(context).height * 0.03,
        ),
        Condition.largerThan(
          name: TABLET,
          value: MediaQuery.sizeOf(context).height * 0.04,
        ),
      ],
    ).value;

    final double dividerIndent = ResponsiveValue<double>(
      context,
      defaultValue: 40,
      conditionalValues: [
        Condition.largerThan(name: MOBILE, value: 60),
        Condition.largerThan(name: TABLET, value: 80),
      ],
    ).value;

    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      crossAxisAlignment: CrossAxisAlignment.center,
      children: [
        SizedBox(
          height: ResponsiveValue<double>(
            context,
            defaultValue: MediaQuery.sizeOf(context).height * 0.06,
            conditionalValues: [
              Condition.largerThan(
                name: MOBILE,
                value: MediaQuery.sizeOf(context).height * 0.08,
              ),
              Condition.largerThan(
                name: TABLET,
                value: MediaQuery.sizeOf(context).height * 0.1,
              ),
            ],
          ).value,
          child: Stack(
            alignment: Alignment.center,
            children: [
              // TOP SIDE LINES
              Positioned(
                top: 0,
                left: 0,
                right: 0,
                child: Row(
                  children: [
                    Expanded(
                      child: Divider(
                        indent: dividerIndent,
                        thickness: 1,
                        color: Colors.amber[700],
                      ),
                    ),
                    SizedBox(width: horizontalSpacing * 2),
                    Expanded(
                      child: Divider(
                        endIndent: dividerIndent,
                        thickness: 1,
                        color: Colors.amber[700],
                      ),
                    ),
                  ],
                ),
              ),

              // CENTER TEXT
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Text(
                    'SUNDAY',
                    style: AppStyles.bodyText(context).copyWith(
                      color: Colors.amber[700],
                      fontWeight: FontWeight.bold,
                      fontFamily: 'IMFellEnglishSC',
                      fontSize: ResponsiveValue<double>(
                        context,
                        defaultValue: 14,
                        conditionalValues: [
                          Condition.largerThan(name: MOBILE, value: 16),
                          Condition.largerThan(name: TABLET, value: 18),
                        ],
                      ).value,
                    ),
                  ),
                  SizedBox(width: horizontalSpacing),
                  Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Text(
                        '08',
                        style: AppStyles.bodyText(context).copyWith(
                          color: Colors.amber[700],
                          fontWeight: FontWeight.bold,
                          fontSize: ResponsiveValue<double>(
                            context,
                            defaultValue: 14,
                            conditionalValues: [
                              Condition.largerThan(name: MOBILE, value: 16),
                              Condition.largerThan(name: TABLET, value: 18),
                            ],
                          ).value,
                        ),
                      ),
                      Text(
                        '2026',
                        style: AppStyles.bodyText(context).copyWith(
                          color: Colors.amber[700],
                          fontWeight: FontWeight.bold,
                          fontSize: ResponsiveValue<double>(
                            context,
                            defaultValue: 12,
                            conditionalValues: [
                              Condition.largerThan(name: MOBILE, value: 14),
                              Condition.largerThan(name: TABLET, value: 16),
                            ],
                          ).value,
                        ),
                      ),
                    ],
                  ),
                  SizedBox(width: horizontalSpacing),
                  Text(
                    'MARCH',
                    style: AppStyles.bodyText(context).copyWith(
                      color: Colors.amber[700],
                      fontWeight: FontWeight.bold,
                      fontFamily: 'IMFellEnglishSC',
                      fontSize: ResponsiveValue<double>(
                        context,
                        defaultValue: 14,
                        conditionalValues: [
                          Condition.largerThan(name: MOBILE, value: 16),
                          Condition.largerThan(name: TABLET, value: 18),
                        ],
                      ).value,
                    ),
                  ),
                ],
              ),

              // BOTTOM SIDE LINES
              Positioned(
                bottom: 0,
                left: 0,
                right: 0,
                child: Row(
                  children: [
                    Expanded(
                      child: Divider(
                        indent: dividerIndent,
                        thickness: 1,
                        color: Colors.amber[700],
                      ),
                    ),
                    SizedBox(width: horizontalSpacing * 2),
                    Expanded(
                      child: Divider(
                        endIndent: dividerIndent,
                        thickness: 1,
                        color: Colors.amber[700],
                      ),
                    ),
                  ],
                ),
              ),
            ],
          ),
        ),
      ],
    );
  }
}
