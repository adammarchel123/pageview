import 'package:flutter/material.dart';
import 'package:page_view_indicators/circle_page_indicator.dart';

class PageCircleIndicator extends StatelessWidget {
  final ValueNotifier<int> currentPageNotifier;
  final int itemCount;
  static const double _dotSize = 12;
  const PageCircleIndicator(
      {Key? key, required this.currentPageNotifier, required this.itemCount})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return CirclePageIndicator(
        size: _dotSize,
        selectedSize: _dotSize,
        dotColor: Theme.of(context).primaryColor.withOpacity(0.35),
        selectedDotColor: Theme.of(context).primaryColor,
        currentPageNotifier: currentPageNotifier,
        itemCount: itemCount);
  }
}
