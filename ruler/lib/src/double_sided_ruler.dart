import 'package:flutter/material.dart';
import 'package:ruler/src/axis.dart';

import '../ruler.dart';

class DynamicDoubleSidedRuler extends StatelessWidget {
  const DynamicDoubleSidedRuler({
    super.key,
    required this.child,
    this.rulersAxis = Axis.horizontal,
    required this.cmWidth,
  });

  /// the widget to be placed between the rulers and measured
  final Widget child;

  /// the size of the widget in centimeters
  final double cmWidth;

  /// the axis of the rulers
  final Axis rulersAxis;

  @override
  Widget build(BuildContext context) {
    return Flex(
      direction: rulersAxis.opposite,
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Ruler.dynamic(
          cmWidth.cm,
          axis: rulersAxis,
          notchSide: RulerSide.end,
          numberSide: RulerSide.start,
        ),
        child,
        Ruler.dynamic(
          DistanceUnit.toInch(cmWidth),
          axis: rulersAxis,
          notchSide: RulerSide.start,
          numberSide: RulerSide.end,
        ),
      ],
    );
  }
}
