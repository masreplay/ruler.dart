import 'package:flutter/cupertino.dart';

class SizedBoxFlex extends SizedBox {
  const SizedBoxFlex({
    super.key,
    required Axis axis,
    double? x,
    double? y,
    super.child,
  }) : super(
          width: axis == Axis.horizontal ? x : null,
          height: axis == Axis.vertical ? x : null,
        );
}

class ContainerFlex extends Container {
  ContainerFlex({
    super.key,
    required Axis axis,
    double? x,
    double? y,
    super.alignment,
    super.padding,
    super.color,
    super.decoration,
    super.foregroundDecoration,
    super.constraints,
    super.margin,
    super.transform,
    super.transformAlignment,
    super.child,
    super.clipBehavior,
  }) : super(
          width: axis == Axis.horizontal ? y : x,
          height: axis == Axis.vertical ? y : x,
        );
}
