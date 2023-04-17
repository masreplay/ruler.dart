import 'dart:ui';

import 'package:flutter/material.dart';
import 'package:freezed_annotation/freezed_annotation.dart';

part 'ruler_theme.freezed.dart';

/// The side of the ruler where the notches are aligned.
enum RulerSide {
  /// The notches are aligned to the start of the ruler.
  ///
  /// vertical: top
  /// horizontal: left
  start,

  /// The notches are aligned to the end of the ruler.
  ///
  /// vertical: bottom
  /// horizontal: right
  end;

  /// The notches are aligned to the start of the ruler.
  bool get isStart => this == RulerSide.start;

  /// The notches are aligned to the end of the ruler.
  bool get isEnd => this == RulerSide.end;

  CrossAxisAlignment toCrossAxisAlignment() {
    switch (this) {
      case RulerSide.start:
        return CrossAxisAlignment.start;
      case RulerSide.end:
        return CrossAxisAlignment.end;
    }
  }
}

@freezed
class RulerThemeData with _$RulerThemeData {
  factory RulerThemeData({
    /// The side of the ruler where the notches are aligned.
    RulerSide? notchSide,

    /// Text Side above or below the ruler in horizontal mode
    /// and left or right in vertical mode
    RulerSide? numberSide,

    /// show base at the end of [notchSide]
    bool? base,

    /// The spacing between the notch and the number.
    double? numberSpacing,

    /// The text style of notch.
    TextStyle? numberTextStyle,

    /// The scale factor of the notch length.
    double? notchScaleFactor,

    /// The color of the notch (line).
    Color? notchColor,

    /// The thickness of the notch (line).
    double? thickness,
  }) = _RulerThemeData;

  static RulerThemeData lerp(RulerThemeData? a, RulerThemeData? b, double t) {
    return RulerThemeData(
      numberSide: t < 0.5 ? a?.numberSide : b?.numberSide,
      notchSide: t < 0.5 ? a?.notchSide : b?.notchSide,
      numberTextStyle:
          TextStyle.lerp(a?.numberTextStyle, b?.numberTextStyle, t),
      notchColor: Color.lerp(a?.notchColor, b?.notchColor, t),
      notchScaleFactor: lerpDouble(a?.notchScaleFactor, b?.notchScaleFactor, t),
      base: t < 0.5 ? a?.base : b?.base,
      numberSpacing: lerpDouble(a?.numberSpacing, b?.numberSpacing, t),
      thickness: lerpDouble(a?.thickness, b?.thickness, t),
    );
  }
}

class RulerTheme extends InheritedTheme {
  const RulerTheme({
    super.key,
    required this.data,
    required super.child,
  });

  final RulerThemeData data;

  static RulerThemeData? of(BuildContext context) {
    final theme = context.dependOnInheritedWidgetOfExactType<RulerTheme>();
    return theme?.data;
  }

  @override
  Widget wrap(BuildContext context, Widget child) {
    final theme = RulerTheme.of(context);
    return RulerTheme(data: theme ?? RulerThemeData(), child: child);
  }

  @override
  bool updateShouldNotify(RulerTheme oldWidget) => data != oldWidget.data;
}
