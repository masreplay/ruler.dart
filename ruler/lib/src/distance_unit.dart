import 'package:freezed_annotation/freezed_annotation.dart';

part 'distance_unit.freezed.dart';
part 'distance_unit.g.dart';

const int defaultGraduation = 8;

/// represent a distance in millimeters, centimeters or inches
@freezed
class DistanceUnit with _$DistanceUnit {
  const DistanceUnit._();

  const factory DistanceUnit.cm(double value) = Centimeter;
  // assert graduation is even and greater than 8 and less than or 100
  @Assert('graduation % 2 == 0 && graduation >= 8 && graduation <= 100')
  const factory DistanceUnit.inch(
    double value, {
    @Default(defaultGraduation) int graduation,
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

  Inch inch([int graduation = defaultGraduation]) =>
      Inch(toDouble(), graduation: graduation);

  Inch inchGrad(int graduation) =>
      Inch(this / graduation, graduation: graduation);
}
