import 'package:flutter/material.dart';
import 'package:responsive_framework/responsive_framework.dart';
import 'package:visibility_detector/visibility_detector.dart';
import 'package:da_ry_invitation/page/full_screen_image_view.dart';
import 'package:da_ry_invitation/core/widget/app_styles.dart';

class MasonryGridExample extends StatelessWidget {
  const MasonryGridExample({super.key});

  final List<String> weddingImagePaths = const [
    'assets/wedding/wedding_image_1.png',
    'assets/wedding/wedding_image_2.png',
    'assets/wedding/wedding_image_3.png',
    'assets/wedding/wedding_image_4.png',
    'assets/wedding/wedding_image_5.png',
    'assets/wedding/wedding_image_6.png',
    'assets/wedding/wedding_image_7.png',
    'assets/wedding/wedding_image_8.png',
    'assets/wedding/wedding_image_9.png',
    'assets/wedding/wedding_image_10.png',
  ];

  @override
  Widget build(BuildContext context) {
    final screenWidth = MediaQuery.sizeOf(context).width;
    final isDesktop = ResponsiveBreakpoints.of(context).isDesktop;
    final columnCount = isDesktop ? 3 : 2;
    final spacing = screenWidth * 0.015;
    final columnWidth =
        (screenWidth - spacing * (columnCount + 1)) / columnCount;

    // Split images into columns dynamically
    List<List<String>> columns = List.generate(columnCount, (_) => []);
    List<double> columnsHeight = List.generate(columnCount, (_) => 0);

    for (var imagePath in weddingImagePaths) {
      final shortestColumnIndex = columnsHeight.indexOf(
        columnsHeight.reduce((a, b) => a < b ? a : b),
      );
      columns[shortestColumnIndex].add(imagePath);
      columnsHeight[shortestColumnIndex] += columnWidth * 1.2; // Approx height
    }

    return Column(
      crossAxisAlignment: CrossAxisAlignment.center,
      children: [
        Text(
          'វិចិត្រសាល / PHOTO GALLERY',
          style: AppStyles.bodyText(context).copyWith(
            color: Colors.amber[700],
            fontWeight: FontWeight.bold,
            fontFamily: 'Moulpali',
          ),
          textAlign: TextAlign.center,
        ),
        SizedBox(height: spacing * 4),
        Row(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: List.generate(columnCount, (index) {
            return Expanded(
              child: Padding(
                padding: EdgeInsets.symmetric(horizontal: spacing / 2),
                child: Column(
                  children: columns[index]
                      .map(
                        (imagePath) => _AnimatedGridItem(
                          imagePath: imagePath,
                          allImages: weddingImagePaths,
                        ),
                      )
                      .toList(),
                ),
              ),
            );
          }),
        ),
      ],
    );
  }
}

class _AnimatedGridItem extends StatefulWidget {
  final String imagePath;
  final List<String> allImages;

  const _AnimatedGridItem({required this.imagePath, required this.allImages});

  @override
  State<_AnimatedGridItem> createState() => _AnimatedGridItemState();
}

class _AnimatedGridItemState extends State<_AnimatedGridItem>
    with SingleTickerProviderStateMixin {
  late AnimationController _controller;
  late Animation<Offset> _offsetAnimation;
  bool _visible = false;

  @override
  void initState() {
    super.initState();
    _controller = AnimationController(
      vsync: this,
      duration: const Duration(milliseconds: 600),
    );

    _offsetAnimation = Tween<Offset>(
      begin: const Offset(0, 0.2),
      end: Offset.zero,
    ).animate(CurvedAnimation(parent: _controller, curve: Curves.easeOut));
  }

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  void _onVisible() {
    if (!_visible) {
      _visible = true;
      _controller.forward();
    }
  }

  @override
  Widget build(BuildContext context) {
    return VisibilityDetector(
      key: Key(widget.imagePath),
      onVisibilityChanged: (info) {
        if (info.visibleFraction > 0.1) {
          _onVisible();
        }
      },
      child: SlideTransition(
        position: _offsetAnimation,
        child: GestureDetector(
          onTap: () {
            final initialIndex = widget.allImages.indexOf(widget.imagePath);
            Navigator.push(
              context,
              MaterialPageRoute(
                builder: (_) => FullScreenImageView(
                  images: widget.allImages,
                  initialIndex: initialIndex,
                ),
              ),
            );
          },
          child: Container(
            margin: const EdgeInsets.symmetric(vertical: 8),
            decoration: BoxDecoration(borderRadius: BorderRadius.circular(12)),
            child: ClipRRect(
              borderRadius: BorderRadius.circular(12),
              child: Image.asset(widget.imagePath, fit: BoxFit.cover),
            ),
          ),
        ),
      ),
    );
  }
}
