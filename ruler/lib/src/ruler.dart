import 'package:flutter/material.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:ruler/src/async_snapshot.dart';
import 'package:ruler/src/distance_unit.dart';
import 'package:ruler/src/ruler_theme.dart';

import 'default_theme.dart';
import 'inch.dart';
import 'measure_system.dart';
import 'notch.dart';

/// The NotchData width calculation.
enum RulerType {
  /// The NotchData width is calculated based on the available space.
  dynamic,

  /// The NotchData width is calculated based on the count.
  count,

  /// irl ruler
  real,
}

class Ruler extends StatelessWidget {
  const Ruler.count(
    DistanceUnit this.notchCount, {
    this.axis = Axis.horizontal,
    this.notchSide,
    this.numberTextStyle,
    this.textSide,
    this.numberSpacing,
    this.notchScaleFactor,
    this.notchColor,
    this.showBase,
    this.thickness,
    super.key,
  })  : _rulerType = RulerType.count,
        notchWidth = null;

  const Ruler.dynamic(
    DistanceUnit this.notchWidth, {
    this.axis = Axis.horizontal,
    this.textSide,
    this.notchSide,
    this.numberTextStyle,
    this.notchScaleFactor,
    this.notchColor,
    this.showBase,
    this.numberSpacing,
    this.thickness,
    super.key,
  })  : _rulerType = RulerType.dynamic,
        notchCount = null;

  Ruler.real(
    MeasureSystem system, {
    int graduation = 8,
    super.key,
    this.axis = Axis.horizontal,
    this.textSide,
    this.notchSide,
    this.numberTextStyle,
    this.notchScaleFactor,
    this.notchColor,
    this.showBase,
    this.numberSpacing,
    this.thickness,
  })  : _rulerType = RulerType.real,
        notchWidth = system.toDistanceUnit(graduation),
        notchCount = null;

  /// The type of the ruler to be created
  final RulerType _rulerType;

  /// The notch width in pixels used with [RulerType.dynamic]
  /// the distance type used for graduation only
  final DistanceUnit? notchWidth;

  /// The number of notches used with [RulerType.count]
  final DistanceUnit? notchCount;

  /// Used for the numbers
  final TextStyle? numberTextStyle;

  /// The notches and base scale factor
  final double? notchScaleFactor;

  /// The notches and base color
  final Color? notchColor;

  /// The spacing between the numbers and the notches
  final double? numberSpacing;

  /// The thickness of notches and base
  final double? thickness;

  /// The side of the numbers to the notches
  final RulerSide? textSide;

  /// The side of the notches and the base to the ruler
  final RulerSide? notchSide;

  /// The axis of the ruler [Axis.horizontal] or [Axis.vertical]
  final Axis axis;

  /// Show the base of the ruler
  final bool? showBase;

  @override
  Widget build(BuildContext context) {
    final RulerThemeData? rulerTheme = RulerTheme.of(context);
    final RulerThemeData defaults = getDefaultsRulerThemeData(context);
    final RulerSide textSide =
        this.textSide ?? rulerTheme?.numberSide ?? defaults.numberSide!;
    final RulerSide notchSide =
        this.notchSide ?? rulerTheme?.notchSide ?? defaults.notchSide!;
    final TextStyle numberTextStyle = this.numberTextStyle ??
        rulerTheme?.numberTextStyle ??
        defaults.numberTextStyle!;
    final double notchScaleFactor = this.notchScaleFactor ??
        rulerTheme?.notchScaleFactor ??
        defaults.notchScaleFactor!;
    final Color notchColor =
        this.notchColor ?? rulerTheme?.notchColor ?? defaults.notchColor!;
    final bool showBase =
        this.showBase ?? rulerTheme?.showBase ?? defaults.showBase!;
    final double numberSpacing = this.numberSpacing ??
        rulerTheme?.numberSpacing ??
        defaults.numberSpacing!;
    final double thickness =
        this.thickness ?? rulerTheme?.thickness ?? defaults.thickness!;

    final RulerThemeData rulerThemeMerged = RulerThemeData(
      notchColor: notchColor,
      notchScaleFactor: notchScaleFactor,
      numberSide: textSide,
      notchSide: notchSide,
      numberTextStyle: numberTextStyle,
      showBase: showBase,
      numberSpacing: numberSpacing,
      thickness: thickness,
    );

    return RulerTheme(
      data: rulerThemeMerged,
      child: LayoutBuilder(builder: (context, constraints) {
        switch (_rulerType) {
          case RulerType.dynamic:
            return notchWidth!.when(
              cm: (width) {
                final cmSize = width;
                final cmCount = constraints.maxWidth ~/ cmSize;
                final extra = constraints.maxWidth / cmSize - cmCount;

                return CentimeterRuler(
                  cmSize: cmSize,
                  cmsCount: cmCount,
                  extraCm: extra,
                  axis: axis,
                );
              },
              inch: (width, graduation) {
                final inch = width;
                final inches = constraints.maxWidth ~/ inch;
                final extra = constraints.maxWidth / inch - inches;

                return InchesRuler(
                  inchSize: inch,
                  inches: inches,
                  extra: extra,
                  axis: axis,
                );
              },
            );
          case RulerType.count:
            return notchCount!.when(
              cm: (count) {
                final cmSize = constraints.maxWidth / count;
                final cmCount = count.toInt();
                final extra = count - cmCount;

                return CentimeterRuler(
                  cmSize: cmSize,
                  cmsCount: cmCount,
                  extraCm: extra,
                  axis: axis,
                );
              },
              inch: (double count, int graduation) {
                final inch = constraints.maxWidth / count;
                final inches = count.toInt();
                final extra = count - inches;

                return InchesRuler(
                  inchSize: inch,
                  inches: inches,
                  extra: extra,
                  axis: axis,
                );
              },
            );
          case RulerType.real:
            return FutureBuilder(
              future: getInchWidth(context, constraints, axis),
              builder: (context, snapshot) {
                return snapshot.maybeWhen(
                  orElse: SizedBox.shrink,
                  data: (inch) {
                    return notchWidth!.when(
                      cm: (_) {
                        final mm = constraints.maxWidth / inch * 25.4;
                        final extra = mm - mm.toInt();

                        return CentimeterRuler(
                          cmSize: inch,
                          cmsCount: mm.toInt(),
                          extraCm: extra,
                          axis: axis,
                        );
                      },
                      inch: (_, graduation) {
                        final inches = constraints.maxWidth / inch;
                        final extra = inches - inches.toInt();

                        return InchesRuler(
                          inchSize: inch,
                          inches: inches.toInt(),
                          extra: extra,
                          axis: axis,
                        );
                      },
                    );
                  },
                );
              },
            );
        }
      }),
    );
  }
}

@internal
class CentimeterRuler extends StatelessWidget {
  const CentimeterRuler({
    super.key,
    required this.cmsCount,
    required this.cmSize,
    required this.extraCm,
    required this.axis,
  });

  final int cmsCount;

  final double cmSize;

  final double extraCm;

  final Axis axis;

  @override
  Widget build(BuildContext context) {
    return Row(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        ...List.generate(cmsCount, (i) {
          final showLastPart = i == cmsCount - 1 && extraCm == 0;
          final showLastNumber = i == cmsCount - 1;

          return Notch(
            1.cm,
            number: i,
            size: cmSize,
            axis: axis,
            showLastPart: showLastPart,
            showLastNumber: showLastNumber,
          );
        }),
        if (extraCm > 0)
          Notch(
            extraCm.cm,
            axis: axis,
            size: extraCm * cmSize,
          ),
      ],
    );
  }
}

@internal
class InchesRuler extends StatelessWidget {
  const InchesRuler({
    super.key,
    required this.inches,
    required this.inchSize,
    required this.extra,
    required this.axis,
  });

  final int inches;

  final double inchSize;

  final double extra;

  final Axis axis;

  @override
  Widget build(BuildContext context) {
    return Row(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        ...List.generate(inches, (i) {
          final showLastPart = i == inches - 1 && extra > 0;
          return Notch(
            1.inch(),
            size: inchSize,
            axis: axis,
            number: i,
            showLastPart: showLastPart,
            showLastNumber: false,
          );
        }),
        if (extra > 0)
          Notch(
            extra.inch(),
            size: inchSize * extra,
            axis: axis,
            number: inches,
            showLastPart: true,
            showLastNumber: true,
          ),
      ],
    );
  }
}
