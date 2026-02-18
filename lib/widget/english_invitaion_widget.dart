import 'package:da_ry_invitation/core/widget/app_styles.dart';
import 'package:da_ry_invitation/page/count_down_date.dart';
import 'package:da_ry_invitation/widget/date_divider_widget.dart';
import 'package:flutter/material.dart';
import 'package:responsive_framework/responsive_framework.dart';

class EnglishInvitation extends StatelessWidget {
  final ScrollController scrollController;

  const EnglishInvitation({super.key, required this.scrollController});

  @override
  Widget build(BuildContext context) {
    final breakpoints = ResponsiveBreakpoints.of(context);
    final isDesktop = breakpoints.isDesktop;
    final isTablet = breakpoints.isTablet;

    // Max width for readability
    final double maxWidth = isDesktop ? 900 : double.infinity;

    // Image size
    final double topImageHeight = isDesktop ? 180 : 140;
    final double middleImageHeight = isDesktop ? 50 : 35;

    // Spacing
    final double verticalSpacing = isDesktop
        ? 24
        : isTablet
        ? 20
        : 16;
    final double horizontalSpacing = isDesktop ? 24 : 16;

    final parentsTextStyle = AppStyles.heading2(context).copyWith(
      color: Colors.amber[700],
      fontWeight: FontWeight.bold,
      fontFamily: 'IMFellEnglishSC',
    );

    return Center(
      child: ConstrainedBox(
        constraints: BoxConstraints(maxWidth: maxWidth),
        child: Padding(
          padding: EdgeInsets.symmetric(horizontal: horizontalSpacing),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              /// Top Frame Image
              SizedBox(
                height: topImageHeight,
                child: Image.asset(
                  'assets/wedding_frame_name.png',
                  fit: BoxFit.contain,
                ),
              ),
              SizedBox(height: verticalSpacing),

              /// Parents Names
              ResponsiveRowColumn(
                layout: ResponsiveValue<ResponsiveRowColumnType>(
                  context,
                  defaultValue: ResponsiveRowColumnType.ROW,
                  conditionalValues: [
                    Condition.smallerThan(
                      name: TABLET,
                      value: ResponsiveRowColumnType.COLUMN,
                    ),
                  ],
                ).value,
                rowMainAxisAlignment: MainAxisAlignment.spaceBetween,
                rowCrossAxisAlignment: CrossAxisAlignment.center,
                columnCrossAxisAlignment: CrossAxisAlignment.center,
                columnSpacing: horizontalSpacing,
                children: [
                  ResponsiveRowColumnItem(
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.center,
                      children: [
                        Text('Mr. LIM VANTHY and', style: parentsTextStyle),
                        Text('Mrs. HAM SOPHAN', style: parentsTextStyle),
                      ],
                    ),
                  ),
                  ResponsiveRowColumnItem(
                    child: Text(
                      'alongside',
                      style: AppStyles.bodyText1(context).copyWith(
                        color: Colors.amber[700],
                        fontFamily: 'KantumruyPro',
                      ),
                    ),
                  ),
                  ResponsiveRowColumnItem(
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.center,
                      children: [
                        Text('Mr. HOK YONN and', style: parentsTextStyle),
                        Text('Mrs. CHHEA NAVY', style: parentsTextStyle),
                      ],
                    ),
                  ),
                ],
              ),
              SizedBox(height: verticalSpacing),

              /// Invitation Message
              Text(
                'Cordially request the honor of your presence on the auspicious occasion of the wedding of our children',
                style: AppStyles.bodyText1(context).copyWith(
                  color: Colors.amber[700],
                  fontFamily: 'KantumruyPro',
                ),
                textAlign: TextAlign.center,
              ),
              SizedBox(height: verticalSpacing),

              /// Groom & Bride Names
              ResponsiveRowColumn(
                layout: ResponsiveValue<ResponsiveRowColumnType>(
                  context,
                  defaultValue: ResponsiveRowColumnType.ROW,
                  conditionalValues: [
                    Condition.smallerThan(
                      name: TABLET,
                      value: ResponsiveRowColumnType.COLUMN,
                    ),
                  ],
                ).value,
                rowMainAxisAlignment: MainAxisAlignment.center,
                columnSpacing: horizontalSpacing,
                children: [
                  ResponsiveRowColumnItem(
                    child: Column(
                      children: [
                        Text(
                          'GROOM',
                          style: AppStyles.bodyText(context).copyWith(
                            color: Colors.amber[700],
                            fontSize: 12,
                            fontFamily: 'IMFellEnglishSC',
                          ),
                        ),
                        Text(
                          'Lim Chhorda',
                          style: AppStyles.heading2(context).copyWith(
                            color: Colors.amber[700],
                            fontWeight: FontWeight.bold,
                            fontFamily: 'IMFellEnglishSC',
                          ),
                        ),
                      ],
                    ),
                  ),
                  ResponsiveRowColumnItem(
                    child: SizedBox(
                      height: middleImageHeight,
                      child: Image.asset('assets/wedding_name_2.png'),
                    ),
                  ),
                  ResponsiveRowColumnItem(
                    child: Column(
                      children: [
                        Text(
                          'BRIDE',
                          style: AppStyles.bodyText(context).copyWith(
                            color: Colors.amber[700],
                            fontSize: 12,
                            fontFamily: 'IMFellEnglishSC',
                          ),
                        ),
                        Text(
                          'Yi Sotheary',
                          style: AppStyles.heading1(context).copyWith(
                            color: Colors.amber[700],
                            fontWeight: FontWeight.bold,
                            fontFamily: 'IMFellEnglishSC',
                          ),
                        ),
                      ],
                    ),
                  ),
                ],
              ),
              SizedBox(height: verticalSpacing),

              /// Date Divider
              DateDivider(scrollController: scrollController),
              SizedBox(height: verticalSpacing),

              /// Location & Countdown
              Text(
                'AT CAMBODIAN RED CROSS KANDAL. BRANCH\n(PLEASE SEE THE MAP)\nTHANK YOU !',
                style: AppStyles.bodyText1(context).copyWith(
                  color: Colors.amber[700],
                  fontFamily: 'IMFellEnglishSC',
                  fontWeight: FontWeight.bold,
                ),
                textAlign: TextAlign.center,
              ),
              SizedBox(height: verticalSpacing),
              CountdownTimer(targetDate: DateTime(2026, 3, 8, 8, 0)),
            ],
          ),
        ),
      ),
    );
  }
}
