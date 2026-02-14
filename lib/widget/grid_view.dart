import 'package:flutter/material.dart';
import 'package:da_ry_invitation/page/full_screen_image_view.dart'; // Import the new full screen image view

class MasonryGridExample extends StatelessWidget {
  const MasonryGridExample({super.key});

  final List<String> weddingImagePaths = const [
    'https://nextcloud.sabay.com/index.php/core/preview?fileId=7402343&x=1920&y=1080&a=true',
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

        return SingleChildScrollView(
          child: Row(
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
          child: Image.network(
            imagePath,
            fit: BoxFit.cover,
            // filterQuality: FilterQuality.high,
            width: width,
            webHtmlElementStrategy: WebHtmlElementStrategy.prefer,
          ),
        ),
      ),
    );
  }
}
