import 'package:json_annotation/json_annotation.dart';

@JsonSerializable()
class Calculator {
  double halfCriticalAge;
  double criticalAge;

  double m1 = 0;
  double b1 = 0;

  double m2 = 0;
  double b2 = 0;

  double k1 = 0;
  double z1 = 0;

  Calculator(
    double expectancyAtBirth,
    this.halfCriticalAge,
    double expectancyAtHalfCriticalAge,
    this.criticalAge,
    double lastAge,
    double expectancyAtCriticalAge,
    double expectancyAtLastAge,
  ) {
    var (m, b) = calcMnB(
        0, halfCriticalAge, expectancyAtBirth, expectancyAtHalfCriticalAge);
    m1 = m;
    b1 = b;
    (m, b) = calcMnB(halfCriticalAge, criticalAge, expectancyAtHalfCriticalAge,
        expectancyAtCriticalAge);
    b2 = b;
    m2 = m;
    var (k, z) = calcKnZ(
        criticalAge, lastAge, expectancyAtCriticalAge, expectancyAtLastAge);
    k1 = k;
    z1 = z;
  }

  double getExpantancy(double age) {
    if (age <= halfCriticalAge) {
      return m1 * age + b1;
    } else if (age <= criticalAge) {
      return m2 * age + b2;
    } else {
      return k1 / (age + z1);
    }
  }
}

(double, double) calcKnZ(
  double x1,
  double x2,
  double y1,
  double y2,
) {
  var z = (y1 * x1 - y2 * x2) / (y2 - y1);
  var k = (x2 + z) * y2;
  return (k, z);
}

(double, double) calcMnB(
  double x1,
  double x2,
  double y1,
  double y2,
) {
  var m = (y2 - y1) / (x2 - x1);
  var b = y1 - x1 * m;
  return (m, b);
}
