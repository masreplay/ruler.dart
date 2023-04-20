import 'package:flutter/foundation.dart';
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
    this.showBase,
    this.notchColor,
    this.numberTextStyle,
    this.notchScaleFactor,
  })  : assert(number == null || number >= 0, "number must be positive"),
        assert(
          number == null || numberSpacing == null || numberSpacing >= 0,
          "numberSpacing must be positive",
        );

  final double? size;

  final int? number;

  final Axis axis;

  final bool? showBase;

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

  final TextStyle? numberTextStyle;

  @override
  Widget build(BuildContext context) {
    final RulerThemeData? rulerTheme = RulerTheme.of(context);

    final RulerThemeData defaults = getDefaultsRulerThemeData(context);
    final RulerSide notchSide =
        this.notchSide ?? rulerTheme?.notchSide ?? defaults.notchSide!;
    final RulerSide numberSide =
        this.numberSide ?? rulerTheme?.numberSide ?? defaults.numberSide!;
    final bool showBase =
        this.showBase ?? rulerTheme?.showBase ?? defaults.showBase!;
    final Color notchColor =
        this.notchColor ?? rulerTheme?.notchColor ?? defaults.notchColor!;
    final double notchScaleFactor = this.notchScaleFactor ??
        rulerTheme?.notchScaleFactor ??
        defaults.notchScaleFactor!;
    final double numberSpacing = this.numberSpacing ??
        rulerTheme?.numberSpacing ??
        defaults.numberSpacing!;
    final TextStyle numberTextStyle = this.numberTextStyle ??
        rulerTheme?.numberTextStyle ??
        defaults.numberTextStyle!;
    final double thickness =
        this.thickness ?? rulerTheme?.thickness ?? defaults.thickness!;

    final notches = NotchBuilder(
      axis: axis,
      distance: distance,
      size: size,
      cmBuilder: (distance, mmsCount, mmSize, extraSize) {
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
                width: mmSize,
                child: _Graduation(
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
            if (extraSize > 0)
              SizedBoxFlex(
                axis: axis,
                width: extraSize,
                child: distance > 0.1
                    ? null
                    : _Graduation(
                        axis: axis,
                        size: extraSize,
                        thickness: thickness,
                        side: notchSide,
                        color: notchColor,
                        length: getNotchLength(0),
                        otherLength: getNotchLength(1),
                        showOther: false,
                      ),
              ),
          ],
        );
      },
      inchBuilder: (distance, graduations, graduationsCount, graduationWidth,
          extraWidth) {
        double getNotchLength(int position) {
          if (position == 0 || position == graduations) {
            return 20.0 * notchScaleFactor;
          } else if (position == graduations / 2) {
            return 15.0 * notchScaleFactor;
          } else {
            return 10.0 * notchScaleFactor;
          }
        }

        return Flex(
          direction: axis,
          crossAxisAlignment: notchSide.toCrossAxisAlignment(),
          children: [
            for (var i = 0; i < graduationsCount; i++)
              SizedBoxFlex(
                axis: axis,
                width: graduationWidth,
                child: _Graduation(
                  axis: axis,
                  size: graduationWidth,
                  length: getNotchLength(i),
                  otherLength: getNotchLength(i + 1),
                  showOther: i == graduationsCount - 1 && showLastPart,
                  thickness: thickness,
                  side: notchSide,
                  color: notchColor,
                ),
              ),
            if (extraWidth > 0)
              SizedBoxFlex(
                axis: axis,
                width: extraWidth,
                child: _Graduation(
                  axis: axis,
                  size: extraWidth,
                  thickness: thickness,
                  side: notchSide,
                  color: notchColor,
                  length: getNotchLength(0),
                  otherLength: getNotchLength(1),
                  showOther: false,
                ),
              ),
          ],
        );
      },
    );

    final List<Widget> text = number == null
        ? []
        : [
            SizedBox.square(dimension: numberSpacing),
            Flex(
              direction: axis,
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text("${number!}", style: numberTextStyle),
                if (showLastNumber)
                  Text("${number! + 1}", style: numberTextStyle),
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
      width: size,
      child: Flex(
        direction: axis.opposite,
        children: [
          if (numberSide == RulerSide.start) ...text.reversed,
          if (showBase && notchSide == RulerSide.start) baseWidget,
          notches,
          if (showBase && notchSide == RulerSide.end) baseWidget,
          if (numberSide == RulerSide.end) ...text,
        ],
      ),
    );
  }

  @override
  void debugFillProperties(DiagnosticPropertiesBuilder properties) {
    super.debugFillProperties(properties);
    properties.add(EnumProperty<Axis>('axis', axis));
    properties.add(DoubleProperty('size', size));
    properties.add(DoubleProperty('numberSpacing', numberSpacing));
    properties.add(DoubleProperty('distance', distance.value));
    properties.add(IntProperty('number', number));
    properties.add(FlagProperty('showLastNumber',
        value: showLastNumber, ifTrue: 'showLastNumber'));
    properties.add(FlagProperty('showLastPart',
        value: showLastPart, ifTrue: 'showLastPart'));
    properties.add(EnumProperty<RulerSide>('notchSide', notchSide));
    properties.add(EnumProperty<RulerSide>('numberSide', numberSide));
    properties
        .add(FlagProperty('showBase', value: showBase, ifTrue: 'showBase'));
    properties.add(ColorProperty('notchColor', notchColor));
    properties.add(DoubleProperty('notchScaleFactor', notchScaleFactor));
    properties.add(
        DiagnosticsProperty<TextStyle>('numberTextStyle', numberTextStyle));
    properties.add(DoubleProperty('thickness', thickness));
  }
}

class _Graduation extends StatelessWidget {
  const _Graduation({
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
