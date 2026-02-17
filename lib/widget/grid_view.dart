import 'package:da_ry_invitation/core/widget/app_styles.dart';
import 'package:flutter/material.dart';
import 'package:da_ry_invitation/page/full_screen_image_view.dart'; // Import the new full screen image view

class MasonryGridExample extends StatelessWidget {
  const MasonryGridExample({super.key});

  final List<String> weddingImagePaths = const [
    'assets/wedding/wedding_image_1.jpg',
    'assets/wedding/wedding_image_2.jpg',
    'assets/wedding/wedding_image_3.jpg',
    'assets/wedding/wedding_image_4.jpg',
    'assets/wedding/wedding_image_5.jpg',
    'assets/wedding/wedding_image_6.jpg',
    'assets/wedding/wedding_image_7.jpg',
    'assets/wedding/wedding_image_8.jpg',
    'assets/wedding/wedding_image_9.jpg',
    'assets/wedding/wedding_image_10.jpg',
  ];

  @override
  Widget build(BuildContext context) {
    return LayoutBuilder(
      builder: (context, constraints) {
        final columnWidth = constraints.maxWidth / 2;

        List<Widget> leftColumn = [];
        List<Widget> rightColumn = [];

        double leftHeight = 0;
        double rightHeight = 0;

        for (int i = 0; i < weddingImagePaths.length; i++) {
          final item = _buildItem(
            context,
            weddingImagePaths[i],
            columnWidth,
          ); // Pass context

          if (leftHeight <= rightHeight) {
            leftColumn.add(item);
            leftHeight += (columnWidth * 1.2);
          } else {
            rightColumn.add(item);
            rightHeight += (columnWidth * 1.2);
          }
        }

        return Column(
          children: [
            Text(
              'វិចិត្រសាល / PHOTO GALLERY',
              style: AppStyles.heading2(context).copyWith(
                color: Colors.amber[700],
                // fontSize: 18,
                fontWeight: FontWeight.bold,
                fontFamily: 'Moulpali',
              ),
            ),
            SizedBox(height: MediaQuery.sizeOf(context).height * 0.04),
            Row(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                SizedBox(
                  width: columnWidth,
                  child: Column(children: leftColumn),
                ),
                SizedBox(
                  width: columnWidth,
                  child: Column(children: rightColumn),
                ),
              ],
            ),
          ],
        );
      },
    );
  }

  Widget _buildItem(BuildContext context, String imagePath, double width) {
    // Accept context
    return GestureDetector(
      onTap: () {
        Navigator.push(
          context,
          MaterialPageRoute(
            builder: (context) => FullScreenImageView(imagePath: imagePath),
          ),
        );
      },
      child: Container(
        width: width,
        margin: const EdgeInsets.all(6),
        decoration: BoxDecoration(borderRadius: BorderRadius.circular(12)),
        child: ClipRRect(
          borderRadius: BorderRadius.circular(12),
          child: Image.asset(
            imagePath,
            fit: BoxFit.contain,

            // filterQuality: FilterQuality.high,
            width: width,
            // webHtmlElementStrategy: WebHtmlElementStrategy.prefer,
          ),
        ),
      ),
    );
  }
}
