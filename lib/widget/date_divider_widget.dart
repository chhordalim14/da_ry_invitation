import 'package:da_ry_invitation/core/widget/app_styles.dart';
import 'package:da_ry_invitation/widget/scroll_fade.dart';
import 'package:flutter/material.dart';

class DateDivider extends StatelessWidget {
  const DateDivider({super.key, required this.scrollController});
  final ScrollController scrollController;
  @override
  Widget build(BuildContext context) {
    return ScrollFade(
      controller: scrollController,
      start: 1300,
      end: 1400,
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          // const SizedBox(height: 10),
          SizedBox(
            height: 60,
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
                          indent: 80,
                          thickness: 1,
                          color: Colors.amber[700],
                        ),
                      ),
                      SizedBox(width: 50),
                      Expanded(
                        child: Divider(
                          endIndent: 80,
                          thickness: 1,
                          color: Colors.amber[700],
                        ),
                      ),
                    ],
                  ),
                ),

                // CENTER TEXT (VERTICALLY CENTERED)
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Text(
                      'SUNDAY',
                      style: AppStyles.bodyText(context).copyWith(
                        color: Colors.amber[700],
                        // fontSize: 16,
                        fontWeight: FontWeight.bold,
                        fontFamily: 'IMFellEnglishSC',
                      ),
                    ),
                    SizedBox(width: 22),
                    Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Text(
                          '08',
                          style: AppStyles.bodyText(context).copyWith(
                            color: Colors.amber[700],
                            // fontSize: 16,
                            fontWeight: FontWeight.bold,
                            fontFamily: '',
                          ),
                        ),
                        Text(
                          '2026',
                          style: AppStyles.bodyText(context).copyWith(
                            color: Colors.amber[700],
                            // fontSize: 16,
                            fontWeight: FontWeight.bold,
                            fontFamily: '',
                          ),
                        ),
                      ],
                    ),
                    SizedBox(width: 22),
                    Text(
                      'MARCH',
                      style: AppStyles.bodyText(context).copyWith(
                        color: Colors.amber[700],
                        // fontSize: 16,
                        fontWeight: FontWeight.bold,
                        fontFamily: 'IMFellEnglishSC',
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
                          indent: 80,
                          thickness: 1,
                          color: Colors.amber[700],
                        ),
                      ),
                      SizedBox(width: 50),
                      Expanded(
                        child: Divider(
                          endIndent: 80,
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

          // const SizedBox(height: 16),
        ],
      ),
    );
  }
}
