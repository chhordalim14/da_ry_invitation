import 'package:flutter/material.dart';

class EventStep {
  final String time;
  final String title;
  final String description;

  EventStep({
    required this.time,
    required this.title,
    required this.description,
  });
}

class WeddingProgramStepper extends StatelessWidget {
  const WeddingProgramStepper({super.key});

  Widget _timelineItem({
    required String time,
    required String title,
    required String icon,
  }) {
    return IntrinsicHeight(
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: [
          Center(
            child: SizedBox(
              width: 50,
              height: 50,
              child: Image.asset(icon, fit: BoxFit.contain),
            ),
          ),
          const VerticalDivider(width: 20, thickness: 2, color: Colors.grey),
          Expanded(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(time, style: const TextStyle(fontSize: 13)),
                const SizedBox(height: 4),
                Text(
                  title,
                  style: const TextStyle(
                    fontSize: 16,
                    fontWeight: FontWeight.w500,
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        const SizedBox(height: 16),
        const Text(
          "កម្មវិធីថ្ងៃទីមួយ ថ្ងៃសៅរ៍ ទី ០៧ ខែមីនា ឆ្នាំ ២០២៦",
          style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold),
        ),
        const SizedBox(height: 20),

        /// Row 1
        Row(
          children: [
            Expanded(
              child: _timelineItem(
                time: 'ម៉ោង ០២:០០ រសៀល',
                title: 'ពិធីក្រុងពាលី',
                icon: 'assets/icon.png',
              ),
            ),
            const SizedBox(width: 16),
            /* Expanded(
              child: _timelineItem(
                time: 'ម៉ោង ០៣:០០ រសៀល',
                title: 'ពិធីសូត្រមន្ត',
                icon: Icons.self_improvement,
              ),
            ), */
          ],
        ),

        const SizedBox(height: 16),

        /// Row 2
        /*  Row(
          children: [
            Expanded(
              child: _timelineItem(
                time: 'ម៉ោង ០៤:០០ រសៀល',
                title: 'ពិធីជាវខាន់ស្លា',
                icon: Icons.money,
              ),
            ),
            const SizedBox(width: 16),
            Expanded(
              child: _timelineItem(
                time: 'ម៉ោង ០៥:០០ រសៀល',
                title: 'អញ្ជើញភ្ញៀវកិត្តិយសពិសាអាហារពេលល្ងាច',
                icon: Icons.dinner_dining,
              ),
            ),
          ],
        ),

        const Text(
          "កម្មវិធីថ្ងៃទី២ ថ្ងៃសៅរ៍ ទី ០៧ ខែមីនា ឆ្នាំ ២០២៦",
          style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold),
        ),
        const SizedBox(height: 20),

        /// Row 3
        Row(
          children: [
            Expanded(
              child: _timelineItem(
                time: 'ម៉ោង ០៦:៣០ ព្រឹក',
                title: 'ពិធីហែជំនួន',
                icon: Icons.paragliding,
              ),
            ),
            const SizedBox(width: 16),
            Expanded(
              child: _timelineItem(
                time: 'ម៉ោង ០៧:០០ ព្រឹក',
                title: 'ពិធីហែជំនួនកំណត់ចូលរោងជ័យ',
                icon: Icons.meeting_room,
              ),
            ),
          ],
        ),

        /// Row 4
        Row(
          children: [
            Expanded(
              child: _timelineItem(
                time: 'ម៉ោង ០៧:៣០ ព្រឹក',
                title: 'ពិធីចៅមហានិយាយជើងការ សែនព្រេង រៀបរាប់ផ្លែឈើ',
                icon: Icons.local_florist,
              ),
            ),
            const SizedBox(width: 16),
            Expanded(
              child: _timelineItem(
                time: 'ម៉ោង ០៨:០០ ព្រឹក',
                title: 'អញ្ជើញភ្ញៀវកិត្តិយសពិសាអាហារពេលព្រឹក',
                icon: Icons.breakfast_dining,
              ),
            ),
          ],
        ),

        /// Row 5
        Row(
          children: [
            Expanded(
              child: _timelineItem(
                time: 'ម៉ោង ០៩:០០ ព្រឹក',
                title: 'ពិធីកាត់សក់បង្កក់សិរី កូនប្រុស និងកូនស្រី',
                icon: Icons.content_cut,
              ),
            ),
            const SizedBox(width: 16),
            Expanded(
              child: _timelineItem(
                time: 'ម៉ោង ១១:០០ ព្រឹក',
                title: 'ពិធីសំពះផ្ទឹបចង់ដៃ បង្វិលពពិល និងព្រះថោងតោងស្បៃ',
                icon: Icons.handshake,
              ),
            ),
          ],
        ),

        /// Row 6
        Row(
          children: [
            Expanded(
              child: _timelineItem(
                time: 'ម៉ោង ១២:០០ ព្រឹក',
                title:
                    'អញ្ជើញភ្ញៀវកិត្តិយសពិសាអាហារពេលថ្ងៃត្រង់ បញ្ចប់កិច្ចអាពាហ៍ពិពាហ៍',
                icon: Icons.lunch_dining,
              ),
            ),
            const SizedBox(width: 16),
            Expanded(
              child: _timelineItem(
                time: 'ម៉ោង ០៥:០០ ល្ងាច',
                title: 'អញ្ជើញភ្ញៀវកិត្តិយសពិសាភោជនាហារ',
                icon: Icons.fastfood,
              ),
            ),
          ],
        ), */
      ],
    );
  }
}
