import 'package:flutter/material.dart';
import 'package:real_ruler/src/distance_unit.dart';

typedef InchWidgetBuilder = Widget Function(
  double distance,
  int graduations,
  int graduationsCount,
  double graduationWidth,
  double extraWidth,
);

typedef CMWidgetBuilder = Widget Function(
  double distance,
  int mmsCount,
  double mmSize,
  double extraWidth,
);

/// Builds a notch depending on the unit of measurement [DistanceUnit]
///
/// [distance] is the distance to be measured
/// [size] is the width for [Axis.horizontal] and height for [Axis.vertical]
/// [inchBuilder] with [Inch] unit of measurement
/// [cmBuilder] with [CM] unit of measurement
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

  /// Builds the distance builder depending on the unit of measurement
  Widget buildDistance(double size) {
    return distance.when(
      cm: (distance) {
        assert(distance <= 1.0 && distance >= 0.0);

        final mms = distance * 10;
        final mmsCount = mms.toInt();
        final mmSize = size / mms;

        final extra = mms - mms.toInt();
        final extraSize = extra * mmSize;

        return cmBuilder(distance, mmsCount, mmSize, extraSize);
      },
      inch: (distance, graduation) {
        assert(distance <= 1.0 && distance >= 0.0);

        final graduations = distance * graduation;
        final graduationsCount = graduations.toInt();
        final graduationSize = size / graduations;

        final extra = graduations - graduations.toInt();
        final extraSize = extra * graduationSize;

        return inchBuilder(
            distance, graduation, graduationsCount, graduationSize, extraSize);
      },
    );
  }
}
