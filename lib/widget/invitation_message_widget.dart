import 'package:da_ry_invitation/core/constants/constants.dart';
import 'package:da_ry_invitation/core/widget/app_styles.dart';
import 'package:da_ry_invitation/widget/scroll_fade.dart';
import 'package:flutter/material.dart';

class InvitationMessage extends StatelessWidget {
  const InvitationMessage({super.key, required this.scrollController});
  final ScrollController scrollController;
  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        ScrollFade(
          controller: scrollController,
          start: 150,
          end: 250,
          child: Text(
            'មានកិត្តិយសសូមគោរពអញ្ជើញ',
            style: AppStyles.bodyText(context).copyWith(
              color: Colors.amber[700],

              // fontSize: 18,
              fontWeight: FontWeight.bold,
              fontFamily: 'Moulpali',
            ),
            textAlign: TextAlign.center,
          ),
        ),
        SizedBox(height: MediaQuery.sizeOf(context).height * 0.01),
        ScrollFade(
          controller: scrollController,
          start: 200,
          end: 300,
          child: Text(
            'ឯកឧត្តម លោកអ្នកឧកញ៉ា អ្នកឧកញ៉ា លោកជំទាវ លោក លោកស្រី អ្នកនាង កញ្ញា អញ្ជើញចូលរួមជាអធិបតី និងជាភ្ញៀវកិត្តិយស ដើម្បីប្រសិទ្ធិពរជ័យសិរីសួស្តី ជ័យមង្គល ក្នុងពិធីអាពាហ៍ពិពាហ៍ កូនប្រុស-កូនស្រីរបស់យើងខ្ញុំ',
            style: AppStyles.bodyText1(
              context,
            ).copyWith(color: Colors.amber[700], fontFamily: 'KantumruyPro'),
            textAlign: TextAlign.center,
          ),
        ),
      ],
    );
  }
}
