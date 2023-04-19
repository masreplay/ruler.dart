import 'package:flutter/material.dart';
import 'package:ruler/src/distance_unit.dart';

typedef InchWidgetBuilder = Widget Function(
  double inch,
  int graduations,
  int gradsCount,
  double gradSize,
  double extraSize,
);

typedef CMWidgetBuilder = Widget Function(
  double cm,
  int mmsCount,
  double mmSize,
  double extraSize,
);

class NotchBuilder extends StatelessWidget {
  const NotchBuilder({
    super.key,
    required this.axis,
    required this.distance,
    required this.cmBuilder,
    required this.inchBuilder,
    required this.size,
  });

  final Axis axis;

  final double? size;

  final DistanceUnit distance;

  final CMWidgetBuilder cmBuilder;

  final InchWidgetBuilder inchBuilder;

  @override
  Widget build(BuildContext context) {
    if (size == null) {
      return LayoutBuilder(
        builder: (context, constraints) {
          final size = axis == Axis.horizontal
              ? constraints.maxWidth
              : constraints.maxHeight;

          return buildDistance(size);
        },
      );
    } else {
      return buildDistance(size!);
    }
  }

  Widget buildDistance(double size) {
    return distance.when(
      cm: (double cm) {
        assert(cm <= 1.0 && cm >= 0.0);

        final mms = cm * 10;
        final mmsCount = mms.toInt();
        final mmSize = size / mms;

        final extra = mms - mms.toInt();
        final extraSize = extra * mmSize;

        return cmBuilder(cm, mmsCount, mmSize, extraSize);
      },
      inch: (inch, graduation) {
        assert(inch <= 1.0 && inch >= 0.0);

        final grads = inch * graduation;
        final gradsCount = grads.toInt();
        final gradSize = size / grads;

        final extra = grads - grads.toInt();
        final extraSize = extra * gradSize;

        return inchBuilder(inch, graduation, gradsCount, gradSize, extraSize);
      },
    );
  }
}
