import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:ruler/src/async_snapshot.dart';
import 'package:ruler/src/distance_unit.dart';
import 'package:ruler/src/ruler_theme.dart';

import 'default_theme.dart';
import 'inch.dart';
import 'measure_system.dart';
import 'notch.dart';

/// The type of ruler's notches calculations.
enum _RulerType {
  /// The NotchData width is calculated based on the available space.
  dynamic,

  /// The NotchData width is calculated based on the count.
  count,

  /// irl ruler
  real,
}

/// A widget that displays a ruler in imperial or metric units.
///
/// [Ruler.count] is used to display a ruler with a fixed number of notches and defined by the [notchCount] parameter.
/// [Ruler.dynamic] is used to display a ruler with a fixed width in pixels and defined by the [notchWidth] parameter.
/// [Ruler.real] is used to display a ruler with a fixed width in pixels and defined by the [notchWidth] parameter.
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
  })  : _rulerType = _RulerType.count,
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
  })  : _rulerType = _RulerType.dynamic,
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
  })  : _rulerType = _RulerType.real,
        notchWidth = system.toDistanceUnit(graduation),
        notchCount = null;

  /// The type of the ruler to be created
  final _RulerType _rulerType;

  /// The notch width in pixels used with [_RulerType.dynamic]
  /// the distance type used for graduation only
  final DistanceUnit? notchWidth;

  /// The number of notches used with [_RulerType.count]
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
        final mainAxisWidth = axis == Axis.horizontal
            ? constraints.maxWidth
            : constraints.maxHeight;

        switch (_rulerType) {
          case _RulerType.dynamic:
            return notchWidth!.when(
              cm: (width) {
                final cmSize = width;
                final cmCount = mainAxisWidth ~/ cmSize;
                final extraGraduation = mainAxisWidth / cmSize - cmCount;

                return CentimeterRuler(
                  axis: axis,
                  cmSize: cmSize,
                  cmsCount: cmCount,
                  extraCm: extraGraduation,
                );
              },
              inch: (width, graduations) {
                final inch = width;
                final inches = mainAxisWidth ~/ inch;
                final extraGraduation = mainAxisWidth / inch - inches;

                print('inches: $extraGraduation');

                return InchesRuler(
                  axis: axis,
                  graduations: graduations,
                  inchSize: inch,
                  inches: inches,
                  extraGraduation: extraGraduation,
                );
              },
            );
          case _RulerType.count:
            return notchCount!.when(
              cm: (count) {
                final cmSize = mainAxisWidth / count;
                final cmCount = count.toInt();
                final extra = count - cmCount;

                return CentimeterRuler(
                  axis: axis,
                  cmSize: cmSize,
                  cmsCount: cmCount,
                  extraCm: extra,
                );
              },
              inch: (double count, int graduations) {
                final inch = mainAxisWidth / count;
                final inches = count.toInt();
                final extra = count - inches;

                return InchesRuler(
                  axis: axis,
                  graduations: graduations,
                  inchSize: inch,
                  inches: inches,
                  extraGraduation: extra,
                );
              },
            );
          case _RulerType.real:
            return FutureBuilder(
              future: getInchWidth(context, constraints, axis),
              builder: (context, snapshot) {
                return snapshot.maybeWhen(
                  orElse: SizedBox.shrink,
                  data: (inchWidth) {
                    final notchType = notchWidth!;

                    return notchType.when(
                      cm: (_) {
                        final mm = mainAxisWidth / inchWidth * 25.4;
                        final extra = mm - mm.toInt();

                        return CentimeterRuler(
                          axis: axis,
                          cmSize: inchWidth,
                          cmsCount: mm.toInt(),
                          extraCm: extra,
                        );
                      },
                      inch: (_, graduation) {
                        final inches = mainAxisWidth / inchWidth;
                        final extra = inches - inches.toInt();

                        return InchesRuler(
                          axis: axis,
                          inchSize: inchWidth,
                          graduations: graduation,
                          inches: inches.toInt(),
                          extraGraduation: extra,
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

/// A widget that displays a ruler with centimeters
@internal
class CentimeterRuler extends StatelessWidget {
  const CentimeterRuler({
    super.key,
    required this.axis,
    required this.cmsCount,
    required this.cmSize,
    required this.extraCm,
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

  @override
  void debugFillProperties(DiagnosticPropertiesBuilder properties) {
    super.debugFillProperties(properties);
    properties.add(IntProperty('cmsCount', cmsCount));
    properties.add(DoubleProperty('cmSize', cmSize));
    properties.add(DoubleProperty('extraCm', extraCm));
    properties.add(EnumProperty('axis', axis));
  }
}

/// A widget that displays a ruler with inches.
@internal
class InchesRuler extends StatelessWidget {
  const InchesRuler({
    super.key,
    required this.axis,
    required this.inches,
    required this.inchSize,
    required this.extraGraduation,
    required this.graduations,
  });

  final int inches;

  final int graduations;

  final double inchSize;

  final double extraGraduation;

  final Axis axis;

  @override
  Widget build(BuildContext context) {
    return Row(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        ...List.generate(inches, (i) {
          final showLastPart = i == inches - 1 && extraGraduation == 0;
          final bool showLastNumber = i == inches - 1 && extraGraduation == 0;

          return Notch(
            axis: axis,
            1.inch(graduations),
            size: inchSize,
            number: i,
            showLastPart: showLastPart,
            showLastNumber: showLastNumber,
          );
        }),
        if (extraGraduation > 0)
          Notch(
            axis: axis,
            extraGraduation.inch(graduations),
            size: inchSize * extraGraduation,
            number: inches,
          ),
      ],
    );
  }

  @override
  void debugFillProperties(DiagnosticPropertiesBuilder properties) {
    super.debugFillProperties(properties);
    properties.add(IntProperty('inches', inches));
    properties.add(DoubleProperty('inchSize', inchSize));
    properties.add(DoubleProperty('extraGraduation', extraGraduation));
    properties.add(EnumProperty('axis', axis));
    properties.add(IntProperty('graduations', graduations));
  }
}
