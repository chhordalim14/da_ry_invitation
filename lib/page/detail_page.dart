import 'package:da_ry_invitation/page/event_list.dart';
import 'package:flutter/material.dart';

class DetailPage extends StatelessWidget {
  const DetailPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Container(
          height: MediaQuery.sizeOf(context).height,
          width: MediaQuery.sizeOf(context).width * 0.4,
          color: Colors.red,
          child: SingleChildScrollView(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Stack(
                  alignment: Alignment.center,
                  children: [
                    SizedBox(
                      // width: MediaQuery.sizeOf(context).width * 0.4,
                      height: MediaQuery.sizeOf(context).width * 0.6,
                      child: Image.asset(
                        'assets/RAK_6855.JPG',
                        fit: BoxFit.contain,
                      ),
                    ),
                    Column(
                      children: [
                        const Text(
                          'សិរីមង្គលអាពាហ៏ពិពាហ៍',
                          style: TextStyle(
                            color: Colors.white,
                            fontSize: 28,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                        const Text(
                          'The Wedding day',
                          style: TextStyle(
                            color: Colors.white,
                            fontSize: 28,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                        const Text(
                          'ឆដា & ធារី',
                          style: TextStyle(
                            color: Colors.white,
                            fontSize: 20,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                        const Text(
                          'SAVE THE DATE',
                          style: TextStyle(
                            color: Colors.white,
                            fontSize: 20,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                        const Text(
                          'ថ្ងៃអាទិត្យ ទី០៧ ខែធ្នូ ឆ្នាំ២០២៥',
                          style: TextStyle(
                            color: Colors.white,
                            fontSize: 16,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                        const Text(
                          'ម៉ោង ១២ : ០០ ​ពេលកណ្ដាលអធ្រាត្រ',
                          style: TextStyle(
                            color: Colors.white,
                            fontSize: 16,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                        const Text(
                          '07 . 12 . 2025 | 12:00 AM',
                          style: TextStyle(
                            color: Colors.white,
                            fontSize: 16,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                        const Text(
                          'សូមគោរពអញ្ជើញ',
                          style: TextStyle(
                            color: Colors.white,
                            fontSize: 16,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                      ],
                    ),
                  ],
                ),
                Container(
                  height: MediaQuery.sizeOf(context).height * 0.4,
                  color: Colors.blue,

                  child: Column(
                    children: [
                      Text("យើងខ្ញុំមានកិត្តិយសសូមគោរពអញ្ជើញ"),
                      Image.asset('assets/decor-line.png', fit: BoxFit.contain),
                      Text(
                        'យើងខ្ញុំមានកិត្តិយសសូមគោរពអញ្ជើញ ឯកឧត្តម លោកឧកញ៉ា លោកជំទាវ លោក លោកស្រី អ្នកនាងកញ្ញា អញ្ជើញចូលរួមជាអធិបតី និងជាភ្ញៀវកិត្តិយស ដើម្បីប្រសិទ្ធិពរជ័យសិរីសួស្តី ជ័យមង្គល ក្នុងពិធីអាពាហ៍ពិពាហ៍ របស់យើងខ្ញុំទាំងពីរ។',
                        style: TextStyle(
                          color: Colors.white,
                          fontSize: 16,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                    ],
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
