import 'package:ruler/ruler.dart';

enum MeasureSystem {
  metric,
  imperial;

  DistanceUnit toDistanceUnit(int graduation) {
    switch (this) {
      case MeasureSystem.metric:
        return 1.cm;
      case MeasureSystem.imperial:
        return 1.inch();
    }
  }
}
