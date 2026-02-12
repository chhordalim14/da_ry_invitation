import 'package:da_ry_invitation/core/constants/constants.dart';
import 'package:da_ry_invitation/core/widget/app_styles.dart';
import 'package:flutter/material.dart';

class InvitationMessage extends StatelessWidget {
  const InvitationMessage({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Text(
          'មានកិត្តិយសសូមគោរពអញ្ជើញ',
          style: AppStyles.bodyText(context).copyWith(
            color: Colors.amber[700],
            // fontSize: 18,
            // fontWeight: FontWeight.bold,
           
          ),
          textAlign: TextAlign.center,
        ),
        const SizedBox(height: 16),
        Text(
          'សម្តេចទ្រង់ ឯកឧត្តម លោកអ្នកឧកញ៉ា អ្នកឧកញ៉ា កញ៉ា លោកជំទាវ លោកលោកស្រី អ្នកនាង កញ្ញា អញ្ជើញចូលរួមជាអធិបតី និងជាភ្ញៀវកិត្តិយស ដើម្បីប្រសិទ្ធិពរជ័យសិរីសួស្តី ជ័យមង្គល ក្នុងពិធីអាពាហ៍ពិពាហ៍ កូនប្រុស-កូនស្រីរបស់យើងខ្ញុំ',
          style: AppStyles.bodyText(context).copyWith(color: colorsApp),
          textAlign: TextAlign.center,
        ),
      ],
    );
  }
}
