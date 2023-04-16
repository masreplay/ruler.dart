import 'package:flutter/material.dart';
import 'package:ruler/src/axis.dart';
import 'package:ruler/src/distance_unit.dart';
import 'package:ruler/src/flex.dart';
import 'package:ruler/src/ruler_theme.dart';

import 'default_theme.dart';
import 'notch_builder.dart';

/// A widget that draws a notch on the ruler with a number
/// 
/// [distance] define the notches count on the ruler
/// 
/// ![](https://raw.githubusercontent.com/)
class Notch extends StatelessWidget {
  const Notch(
    this.distance, {
    super.key,
    this.size,
    this.number,
    this.thickness,
    this.notchSide,
    this.numberSide,
    this.numberSpacing,
    this.axis = Axis.horizontal,
    this.showLastPart = true,
    this.showLastNumber = false,
    this.base,
    this.notchColor,
    this.notchScaleFactor,
  })  : assert(number == null || number >= 0, "number must be positive"),
        assert(
          number == null || numberSpacing == null || numberSpacing >= 0,
          "numberSpacing must be positive",
        );

  final double? size;

  final int? number;

  final Axis axis;

  final bool? base;

  /// the amount of padding between the number and the notch
  final double? numberSpacing;

  /// parts of current notch
  final DistanceUnit distance;

  final bool showLastPart;

  final bool showLastNumber;

  final RulerSide? notchSide;

  final RulerSide? numberSide;

  final Color? notchColor;

  final double? notchScaleFactor;

  final double? thickness;

  @override
  Widget build(BuildContext context) {
    final RulerThemeData rulerTheme = RulerTheme.of(context);
    final RulerThemeData defaults = getDefaultsRulerThemeData(context);
    final RulerSide notchSide =
        this.notchSide ?? rulerTheme.notchSide ?? defaults.notchSide!;
    final RulerSide numberSide =
        this.numberSide ?? rulerTheme.numberSide ?? defaults.numberSide!;
    final bool base = this.base ?? rulerTheme.base ?? defaults.base!;
    final Color notchColor =
        this.notchColor ?? rulerTheme.notchColor ?? defaults.notchColor!;
    final double notchScaleFactor = this.notchScaleFactor ??
        rulerTheme.notchScaleFactor ??
        defaults.notchScaleFactor!;
    final double numberSpacing = this.numberSpacing ??
        rulerTheme.numberSpacing ??
        defaults.numberSpacing!;

    final double thickness =
        this.thickness ?? rulerTheme.thickness ?? defaults.thickness!;

    final notches = NotchBuilder(
      axis: axis,
      distance: distance,
      size: size,
      cmBuilder: (cm, mmsCount, mmSize, extraSize) {
        double getNotchLength(int position) {
          if (position == 0 || position == 10) {
            return 20.0 * notchScaleFactor;
          } else if (position == 5) {
            return 15.0 * notchScaleFactor;
          } else {
            return 10.0 * notchScaleFactor;
          }
        }

        return Flex(
          direction: axis,
          crossAxisAlignment: notchSide.toCrossAxisAlignment(),
          children: [
            for (var i = 0; i < mmsCount; i++)
              SizedBoxFlex(
                axis: axis,
                x: mmSize,
                child: Graduation(
                  axis: axis,
                  size: mmSize,
                  length: getNotchLength(i),
                  otherLength: getNotchLength(i + 1),
                  showOther: i == mmsCount - 1 && showLastPart,
                  thickness: thickness,
                  side: notchSide,
                  color: notchColor,
                ),
              ),
            if (extraSize > 0) SizedBoxFlex(axis: axis, x: extraSize, y: 20.0),
          ],
        );
      },
      inchBuilder: (inch, graduation, gradsCount, gradSize, extraSize) {
        const thickness = 1.0;

        double getNotchLength(int position) {
          if (position == 0 || position == graduation) {
            return 20.0 * notchScaleFactor;
          } else if (position == graduation / 2) {
            return 15.0 * notchScaleFactor;
          } else {
            return 10.0 * notchScaleFactor;
          }
        }

        return Flex(
          direction: axis,
          crossAxisAlignment: notchSide.toCrossAxisAlignment(),
          children: [
            for (var i = 0; i < gradsCount; i++)
              SizedBoxFlex(
                axis: axis,
                x: gradSize,
                child: Graduation(
                  axis: axis,
                  size: gradSize,
                  length: getNotchLength(i),
                  otherLength: getNotchLength(i + 1),
                  showOther: i == graduation - 1 && showLastPart,
                  thickness: thickness,
                  side: notchSide,
                  color: notchColor,
                ),
              ),
            if (extraSize > 0) SizedBoxFlex(axis: axis, x: extraSize, y: 20.0),
          ],
        );
      },
    );

    final text = [
      SizedBox.square(dimension: numberSpacing),
      if (number != null)
        Flex(
          direction: axis,
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Text("${number!}", style: rulerTheme.numberTextStyle),
            if (showLastNumber)
              Text("${number! + 1}", style: rulerTheme.numberTextStyle),
          ],
        ),
    ];

    final baseWidget = Container(
      width: axis == Axis.horizontal ? size : thickness,
      height: axis == Axis.vertical ? size : thickness,
      color: notchColor,
    );

    return SizedBoxFlex(
      axis: axis,
      x: size,
      child: Flex(
        direction: axis.opposite,
        children: [
          if (numberSide == RulerSide.start) ...text.reversed,
          if (base && notchSide == RulerSide.start) baseWidget,
          notches,
          if (base && notchSide == RulerSide.end) baseWidget,
          if (numberSide == RulerSide.end) ...text,
        ],
      ),
    );
  }
}

class Graduation extends StatelessWidget {
  const Graduation({
    super.key,
    required this.axis,
    required this.size,
    required this.length,
    required this.otherLength,
    required this.showOther,
    required this.thickness,
    required this.side,
    required this.color,
  });

  final Axis axis;
  final double size;
  final double length;
  final double otherLength;
  final bool showOther;
  final double thickness;
  final RulerSide side;
  final Color color;

  @override
  Widget build(BuildContext context) {
    return showOther
        ? Flex(
            crossAxisAlignment: side.toCrossAxisAlignment(),
            direction: axis,
            children: [
              buildGraduation(thickness),
              ContainerFlex(
                axis: axis,
                color: color,
                x: otherLength,
                y: thickness,
              ),
            ],
          )
        : buildGraduation();
  }

  Widget buildGraduation([double other = 0]) {
    final borderSide = BorderSide(color: color, width: thickness);
    return ContainerFlex(
      axis: axis,
      y: size - other,
      x: length,
      decoration: BoxDecoration(
        border: Border(
          left: axis == Axis.horizontal ? borderSide : BorderSide.none,
          top: axis == Axis.vertical ? borderSide : BorderSide.none,
        ),
      ),
    );
  }
}
