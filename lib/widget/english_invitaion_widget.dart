import 'package:da_ry_invitation/core/constants/constants.dart';
import 'package:da_ry_invitation/core/widget/app_styles.dart';
import 'package:da_ry_invitation/widget/date_divider_widget.dart';
import 'package:da_ry_invitation/widget/scroll_fade.dart';
import 'package:flutter/material.dart';
import 'package:responsive_framework/responsive_framework.dart';

class EnglishInvitation extends StatelessWidget {
  final ScrollController scrollController;

  const EnglishInvitation({super.key, required this.scrollController});

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
        ScrollFade(
          controller: scrollController,
          start: 850,
          end: 950,
          child: SizedBox(
            height: 100,
            // width: 150,
            child: Image.asset('assets/wedding_name.png', fit: BoxFit.contain),
          ),
        ),
        // SizedBox(height: 30, child: Image.asset('assets/decor-line.png')),
        const SizedBox(height: 24),
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

          columnSpacing: 10,
          children: [
            ResponsiveRowColumnItem(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  ScrollFade(
                    controller: scrollController,
                    start: 950,
                    end: 1050,
                    child: Text('Mr. LIM VANTHY and', style: parentsTextStyle),
                  ),
                  ScrollFade(
                    controller: scrollController,
                    start: 980,
                    end: 1080,
                    child: Text('Mrs. HAM SOPHAN', style: parentsTextStyle),
                  ),
                ],
              ),
            ),
            ResponsiveRowColumnItem(
              child: ScrollFade(
                controller: scrollController,
                start: 1020,
                end: 1120,
                child: Text('alongside', style: parentsTextStyle),
              ),
            ),
            ResponsiveRowColumnItem(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  ScrollFade(
                    controller: scrollController,
                    start: 1050,
                    end: 1150,
                    child: Text('Mr. HOK YONN', style: parentsTextStyle),
                  ),
                  ScrollFade(
                    controller: scrollController,
                    start: 1070,
                    end: 1170,
                    child: Text('Mrs. CHHEA NAVY', style: parentsTextStyle),
                  ),
                ],
              ),
            ),
          ],
        ),
        const SizedBox(height: 24),
        ScrollFade(
          controller: scrollController,
          start: 1100,
          end: 1200,
          child: Text(
            'Cordially request the honor of your presence on the auspicious occasion of the wedding of our children',
            style: AppStyles.bodyText1(
              context,
            ).copyWith(color: Colors.amber[700]),
            textAlign: TextAlign.center,
          ),
        ),
        const SizedBox(height: 24),
        ResponsiveRowColumn(
          layout: ResponsiveValue<ResponsiveRowColumnType>(
            context,
            defaultValue: ResponsiveRowColumnType.COLUMN,
            conditionalValues: [
              Condition.smallerThan(
                name: TABLET,
                value: ResponsiveRowColumnType.ROW,
              ),
            ],
          ).value,

          rowMainAxisAlignment: MainAxisAlignment.center,
          // columnSpacing: 8,
          children: [
            ResponsiveRowColumnItem(
              child: Column(
                children: [
                  ScrollFade(
                    controller: scrollController,
                    start: 1200,
                    end: 1300,
                    child: Text(
                      'GROOM',
                      style: AppStyles.bodyText(context).copyWith(
                        color: Colors.amber[700],
                        fontSize: 12,
                        fontWeight: FontWeight.bold,
                        fontFamily: 'IMFellEnglishSC',
                      ),
                    ),
                  ),
                  ScrollFade(
                    controller: scrollController,
                    start: 1230,
                    end: 1330,
                    child: Text(
                      'Lim Chhorda',
                      style: AppStyles.heading2(context).copyWith(
                        color: Colors.amber[700],
                        // fontSize: 18,
                        fontWeight: FontWeight.bold,
                        fontFamily: 'IMFellEnglishSC',
                      ),
                    ),
                  ),
                ],
              ),
            ),
            ResponsiveRowColumnItem(
              child: Padding(
                padding: const EdgeInsets.symmetric(horizontal: 12),
                child: ScrollFade(
                  controller: scrollController,
                  start: 1220,
                  end: 1320,
                  child: Text(
                    ' & ',
                    style: AppStyles.heading2(context).copyWith(
                      color: Colors.amber[700],
                      fontFamily: 'IMFellEnglishSC',
                    ),
                  ),
                ),
              ),
            ),
            ResponsiveRowColumnItem(
              child: Column(
                children: [
                  ScrollFade(
                    controller: scrollController,
                    start: 1200,
                    end: 1300,
                    child: Text(
                      'BRIDE',
                      style: AppStyles.bodyText(context).copyWith(
                        color: Colors.amber[700],
                        fontSize: 12,
                        fontWeight: FontWeight.bold,
                        fontFamily: 'IMFellEnglishSC',
                      ),
                    ),
                  ),
                  ScrollFade(
                    controller: scrollController,
                    start: 1230,
                    end: 1330,
                    child: Text(
                      'Yi Sotheary',
                      style: AppStyles.heading2(context).copyWith(
                        color: Colors.amber[700],
                        // fontSize: 18,
                        fontWeight: FontWeight.bold,
                        fontFamily: 'IMFellEnglishSC',
                      ),
                    ),
                  ),
                ],
              ),
            ),
          ],
        ),
        const SizedBox(height: 32),
        DateDivider(scrollController: scrollController),
        const SizedBox(height: 32),
        ScrollFade(
          controller: scrollController,
          start: 1390,
          end: 1490,
          child: Text(
            'AT CAMBODIAN RED CROSS KANDAL. BRANCH\n(PLEASE SEE THE MAP)\nTHANK YOU!',
            style: AppStyles.bodyText1(
              context,
            ).copyWith(color: Colors.amber[700], fontWeight: FontWeight.w500),
            textAlign: TextAlign.center,
          ),
        ),
      ],
    );
  }
}
