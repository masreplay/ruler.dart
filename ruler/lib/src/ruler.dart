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
    super.key,
    this.axis = Axis.horizontal,
    this.highlight,
    this.notchSide,
    this.textDirection,
    this.numberTextStyle,
    this.textSide,
    this.numberSpacing,
    this.notchScaleFactor,
    this.notchColor,
    this.base,
    this.thickness,
  })  : rulerType = RulerType.count,
        notchWidth = null;

  const Ruler.dynamic(
    DistanceUnit this.notchWidth, {
    super.key,
    this.axis = Axis.horizontal,
    this.highlight,
    this.textSide,
    this.notchSide,
    this.textDirection,
    this.numberTextStyle,
    this.notchScaleFactor,
    this.notchColor,
    this.base,
    this.numberSpacing,
    this.thickness,
  })  : rulerType = RulerType.dynamic,
        notchCount = null;

  Ruler.real(
    MeasureSystem system, {
    int graduation = 8,
    super.key,
    this.axis = Axis.horizontal,
    this.highlight,
    this.textSide,
    this.notchSide,
    this.textDirection,
    this.numberTextStyle,
    this.notchScaleFactor,
    this.notchColor,
    this.base,
    this.numberSpacing,
    this.thickness,
  })  : rulerType = RulerType.real,
        notchWidth = system.toDistanceUnit(graduation),
        notchCount = null;

  final RulerType rulerType;

  final DistanceUnit? notchWidth;

  final DistanceUnit? notchCount;

  final TextDirection? textDirection;

  final EdgeInsets? highlight;

  final TextStyle? numberTextStyle;

  final double? notchScaleFactor;

  final Color? notchColor;

  final double? numberSpacing;

  final double? thickness;

  final RulerSide? textSide;

  final RulerSide? notchSide;

  final Axis axis;

  final bool? base;

  @override
  Widget build(BuildContext context) {
    final RulerThemeData rulerTheme = RulerTheme.of(context);
    final RulerThemeData defaults = getDefaultsRulerThemeData(context);
    final RulerSide textSide =
        this.textSide ?? rulerTheme.numberSide ?? defaults.numberSide!;
    final RulerSide notchSide =
        this.notchSide ?? rulerTheme.notchSide ?? defaults.notchSide!;
    final TextStyle numberTextStyle = this.numberTextStyle ??
        rulerTheme.numberTextStyle ??
        defaults.numberTextStyle!;
    final double notchScaleFactor = this.notchScaleFactor ??
        rulerTheme.notchScaleFactor ??
        defaults.notchScaleFactor!;
    final Color notchColor =
        this.notchColor ?? rulerTheme.notchColor ?? defaults.notchColor!;
    final bool base = this.base ?? rulerTheme.base ?? defaults.base!;
    final double numberSpacing = this.numberSpacing ??
        rulerTheme.numberSpacing ??
        defaults.numberSpacing!;
    final double thickness =
        this.thickness ?? rulerTheme.thickness ?? defaults.thickness!;

    final rulerThemeMerged = RulerThemeData(
      notchColor: notchColor,
      notchScaleFactor: notchScaleFactor,
      numberSide: textSide,
      notchSide: notchSide,
      numberTextStyle: numberTextStyle,
      base: base,
      numberSpacing: numberSpacing,
      thickness: thickness,
    );

    return RulerTheme(
      data: rulerThemeMerged,
      child: LayoutBuilder(builder: (context, constraints) {
        switch (rulerType) {
          case RulerType.dynamic:
            return Container();
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
              inch: (double value, int graduation) {
                return Container();
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
                          notchSide: notchSide,
                          textSide: textSide,
                          base: base,
                          notchColor: notchColor,
                          notchScaleFactor: notchScaleFactor,
                          numberSpacing: numberSpacing,
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
    required this.notchSide,
    required this.textSide,
    required this.base,
    required this.notchColor,
    required this.notchScaleFactor,
    required this.numberSpacing,
  });

  final int inches;

  final double inchSize;

  final double extra;

  final Axis axis;

  final RulerSide notchSide;

  final RulerSide textSide;

  final bool base;

  final Color notchColor;

  final double notchScaleFactor;

  final double numberSpacing;

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
            notchSide: notchSide,
            showLastPart: showLastPart,
            showLastNumber: false,
            base: base,
            notchColor: notchColor,
            notchScaleFactor: notchScaleFactor,
            numberSpacing: numberSpacing,
            numberSide: textSide,
          );
        }),
        if (extra > 0)
          Notch(
            extra.inch(),
            size: inchSize * extra,
            axis: axis,
            number: inches,
            notchSide: notchSide,
            showLastPart: true,
            showLastNumber: true,
            base: base,
            notchColor: notchColor,
            notchScaleFactor: notchScaleFactor,
            numberSpacing: numberSpacing,
            numberSide: textSide,
          ),
      ],
    );
  }
}
