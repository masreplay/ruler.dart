import 'package:freezed_annotation/freezed_annotation.dart';

part 'distance_unit.freezed.dart';
part 'distance_unit.g.dart';

const int defaultGraduations = 8;

/// represent a distance in millimeters, centimeters or inches
@freezed
class DistanceUnit with _$DistanceUnit {
  const DistanceUnit._();

  const factory DistanceUnit.cm(double value) = Centimeter;
  // assert graduations is even and greater than 8 and less than or 100
  @Assert('graduations % 2 == 0 && graduations >= 8 && graduations <= 100')
  const factory DistanceUnit.inch(
    double value, {
    @Default(defaultGraduations) int graduations,
  }) = Inch;

  DistanceUnit operator /(double value) {
    return when(
      cm: (value) => Centimeter(value / value),
      inch: (value, _) => Inch(value / value),
    );
  }

  Centimeter get cm {
    return when(
      cm: (value) => Centimeter(value),
      inch: (value, _) => Centimeter(value * 2.54),
    );
  }

  Inch get inch {
    return when(
      inch: (value, _) => Inch(value),
      cm: (value) => Inch(value / 2.54),
    );
  }

  factory DistanceUnit.fromJson(Map<String, dynamic> json) =>
      _$DistanceUnitFromJson(json);
}

extension DistanceUnitConvertorDouble on num {
  Centimeter get mm => Centimeter(this / 10);

  Centimeter get cm => Centimeter(toDouble());

  Inch inch([int graduations = defaultGraduations]) =>
      Inch(toDouble(), graduations: graduations);

  Inch inchGrad(int graduations) =>
      Inch(this / graduations, graduations: graduations);
}
