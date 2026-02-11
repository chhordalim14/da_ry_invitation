import 'package:flutter/material.dart';

class MasonryGridExample extends StatelessWidget {
  MasonryGridExample({super.key});

  final List<double> heights = List.generate(
    20,
    (index) => (100 + (index % 5) * 40).toDouble(),
  );

  @override
  Widget build(BuildContext context) {
    return LayoutBuilder(
      builder: (context, constraints) {
        final columnWidth = constraints.maxWidth / 2;

        List<Widget> leftColumn = [];
        List<Widget> rightColumn = [];

        double leftHeight = 0;
        double rightHeight = 0;

        for (int i = 0; i < heights.length; i++) {
          final item = _buildItem(i, heights[i], columnWidth);

          if (leftHeight <= rightHeight) {
            leftColumn.add(item);
            leftHeight += heights[i];
          } else {
            rightColumn.add(item);
            rightHeight += heights[i];
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

  Widget _buildItem(int index, double height, double width) {
    return Container(
      width: width,
      height: height,
      margin: const EdgeInsets.all(6),
      decoration: BoxDecoration(
        color: Colors.primaries[index % Colors.primaries.length],
        borderRadius: BorderRadius.circular(12),
      ),
      child: Center(
        child: Text(
          "Item $index",
          style: const TextStyle(color: Colors.white, fontSize: 18),
        ),
      ),
    );
  }
}
