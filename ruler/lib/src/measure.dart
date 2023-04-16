import 'package:freezed_annotation/freezed_annotation.dart';

part 'measure.freezed.dart';
part 'measure.g.dart';

typedef MeasureInt = Measure<int>;
typedef MeasureDouble = Measure<double>;

@Freezed(genericArgumentFactories: true)
class Measure<T extends num> with _$Measure<T> {
  const Measure._();

  factory Measure({required T start, required T end}) = _Measure<T>;

  factory Measure.fromJson(Map<String, dynamic> json) =>
      _$MeasureFromJson(json, (json) => json as T);
}
