import 'package:flutter/material.dart';

class ScrollFade extends StatefulWidget {
  const ScrollFade({
    super.key,
    required this.controller,
    required this.child,
    required this.start,
    required this.end,
    this.curve = Curves.easeOut,
  });

  final ScrollController controller;
  final Widget child;

  /// Scroll offset where fade starts
  final double start;

  /// Scroll offset where fade becomes fully invisible
  final double end;

  final Curve curve;

  @override
  State<ScrollFade> createState() => _ScrollFadeState();
}

class _ScrollFadeState extends State<ScrollFade> {
  double opacity = 1.0;

  @override
  void initState() {
    super.initState();
    widget.controller.addListener(_updateOpacity);
  }

  void _updateOpacity() {
    double offset = widget.controller.offset;

    double newOpacity;

    if (offset <= widget.start) {
      newOpacity = 1;
    } else if (offset >= widget.end) {
      newOpacity = 0;
    } else {
      double progress = (offset - widget.start) / (widget.end - widget.start);
      newOpacity = 1 - widget.curve.transform(progress);
    }

    if (newOpacity != opacity) {
      setState(() {
        opacity = newOpacity.clamp(0.0, 1.0);
      });
    }
  }

  @override
  void dispose() {
    widget.controller.removeListener(_updateOpacity);
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Opacity(opacity: opacity, child: widget.child);
  }
}
