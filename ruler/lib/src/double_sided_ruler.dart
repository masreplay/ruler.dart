import 'package:flutter/material.dart';

import '../ruler.dart';

class DynamicDoubleSidedRuler extends StatelessWidget {
  const DynamicDoubleSidedRuler({
    super.key,
    required this.child,
    this.axis = Axis.horizontal,
    required this.size,
  });

  /// the widget to be placed between the rulers and measured
  final Widget child;

  /// the size of the widget in centimeters
  final double size;

  final Axis axis;

  @override
  Widget build(BuildContext context) {
    return Flex(
      direction: axis,
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Ruler.dynamic(
          size.cm,
          axis: axis,
          notchSide: RulerSide.end,
          textSide: RulerSide.start,
        ),
        child,
        Ruler.dynamic(
          DistanceUnit.toInch(size),
          axis: axis,
          notchSide: RulerSide.start,
          textSide: RulerSide.end,
        ),
      ],
    );
  }
}
