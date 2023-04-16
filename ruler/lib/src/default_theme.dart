import 'package:flutter/material.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:ruler/src/ruler_theme.dart';

RulerThemeData getDefaultsRulerThemeData(BuildContext context) {
  return Theme.of(context).useMaterial3
      ? rulerThemeDataDefaultsM3(context)
      : rulerThemeDataDefaultsM2(context);
}

@internal
RulerThemeData rulerThemeDataDefaultsM3(BuildContext context) {
  return RulerThemeData(
    notchSide: RulerSide.end,
    numberSide: RulerSide.end,
    base: true,
    numberSpacing: 8.0,
    numberTextStyle: Theme.of(context).textTheme.bodyMedium!,
    notchScaleFactor: 1.0,
    notchColor: Theme.of(context).colorScheme.outlineVariant.withOpacity(0.5),
    thickness: 1.0,
  );
}

@internal
RulerThemeData rulerThemeDataDefaultsM2(BuildContext context) {
  return RulerThemeData(
    notchSide: RulerSide.end,
    numberSide: RulerSide.end,
    base: true,
    numberSpacing: 8.0,
    // ignore: deprecated_member_use
    numberTextStyle: Theme.of(context).textTheme.bodyText2!,
    notchScaleFactor: 1.0,
    notchColor: Theme.of(context).dividerColor,
    thickness: 1.0,
  );
}
