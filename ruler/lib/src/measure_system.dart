import 'package:ruler/ruler.dart';

/// The measure system used to display the ruler.
enum MeasureSystem {
  metric,
  imperial;

  DistanceUnit toDistanceUnit(int graduation) {
    switch (this) {
      case MeasureSystem.metric:
        return 1.cm;
      case MeasureSystem.imperial:
        return 1.inch(graduation);
    }
  }
}
