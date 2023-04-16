import 'package:flutter/cupertino.dart';

extension AxisX on Axis {
  Axis get opposite =>
      this == Axis.horizontal ? Axis.vertical : Axis.horizontal;
}
