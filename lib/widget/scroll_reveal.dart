import 'dart:ui';
import 'package:flutter/material.dart';

class ScrollPullReveal extends StatefulWidget {
  final ScrollController controller;
  final Widget child;

  final double start;
  final double end;

  final double maxTranslate;
  final double minScale;

  const ScrollPullReveal({
    super.key,
    required this.controller,
    required this.child,
    required this.start,
    required this.end,
    this.maxTranslate = 80,
    this.minScale = 0.92,
  });

  @override
  State<ScrollPullReveal> createState() => _ScrollPullRevealState();
}

class _ScrollPullRevealState extends State<ScrollPullReveal> {
  double _progress = 0;

  @override
  void initState() {
    super.initState();
    widget.controller.addListener(_onScroll);
  }

  void _onScroll() {
    final offset = widget.controller.offset;

    if (offset <= widget.start) {
      _progress = 0;
    } else if (offset >= widget.end) {
      _progress = 1;
    } else {
      _progress =
          (offset - widget.start) / (widget.end - widget.start);
    }

    setState(() {});
  }

  @override
  void dispose() {
    widget.controller.removeListener(_onScroll);
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final curved = Curves.easeOutCubic.transform(_progress);

    final translateY = widget.maxTranslate * (1 - curved);
    final opacity = curved;
    final scale =
        widget.minScale + (1 - widget.minScale) * curved;

    return Opacity(
      opacity: opacity.clamp(0.0, 1.0),
      child: Transform.translate(
        offset: Offset(0, translateY),
        child: Transform.scale(
          scale: scale,
          child: widget.child,
        ),
      ),
    );
  }
}
