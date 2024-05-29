import 'dart:io';
import 'dart:math';

import 'package:csv/csv.dart';
import 'package:death_day/model/calculator.dart';

void main() async {
  String contents = await File('source_data/st2024.csv').readAsString();
  var (agesM, agesF) = parseStringMaleFemale(contents);
  var currentRegressionM = RegressionResult();
  currentRegressionM.errorLimit = double.infinity;
  var currentRegressionF = RegressionResult();
  currentRegressionF.errorLimit = double.infinity;
  for (var i = 1; i < agesM.length; i++) {
    var resultM = performRegression(agesM, i, currentRegressionM.errorLimit);
    var resultF = performRegression(agesF, i, currentRegressionF.errorLimit);
    if (resultM.successful) {
      currentRegressionM = resultM;
    }
    if (resultF.successful) {
      currentRegressionF = resultF;
    }
  }

  String file = "import 'package:death_day/model/calculator.dart';\n";
  file += "Calculator femaleModel=Calculator(";
  file += "${currentRegressionF.expectancyAtBirth},";
  file += "${currentRegressionF.halfCriticalAge},";
  file += "${currentRegressionF.expectancyAtHalfCriticalAge},";
  file += "${currentRegressionF.criticalAge},";
  file += "${currentRegressionF.lastAge},";
  file += "${currentRegressionF.expectancyAtCriticalAge},";
  file += "${currentRegressionF.expectancyAtLastAge},";
  file += ");\n";
  file += "Calculator maleModel=Calculator(";
  file += "${currentRegressionM.expectancyAtBirth},";
  file += "${currentRegressionM.halfCriticalAge},";
  file += "${currentRegressionM.expectancyAtHalfCriticalAge},";
  file += "${currentRegressionM.criticalAge},";
  file += "${currentRegressionM.lastAge},";
  file += "${currentRegressionM.expectancyAtCriticalAge},";
  file += "${currentRegressionM.expectancyAtLastAge},";
  file += ");\n";

  File("lib/model/data.g.dart").writeAsString(file);
}

(List<double>, List<double>) parseStringMaleFemale(String input) {
  List<List<dynamic>> rowsAsListOfValues =
      const CsvToListConverter().convert(input);
  List<double> agesM = [];
  List<double> agesF = [];
  for (var element in rowsAsListOfValues) {
    agesM.add(element[8]);
    agesF.add(element[15]);
  }

  return (agesM, agesF);
}

RegressionResult performRegression(
    List<double> list, int criticalAge, double errorLimit) {
  int halfCriticalAge = (criticalAge / 2).round();

  Calculator calc = Calculator(
    list[0],
    halfCriticalAge.toDouble(),
    list[halfCriticalAge],
    criticalAge.toDouble(),
    list.length + 1,
    list[criticalAge],
    list.last,
  );

  var regression = RegressionResult();
  regression.errorLimit = 0;
  regression.criticalAge = criticalAge;
  regression.halfCriticalAge = halfCriticalAge;
  regression.lastAge = list.length - 1;
  regression.expectancyAtBirth = list[0];
  regression.expectancyAtCriticalAge = list[criticalAge];
  regression.expectancyAtHalfCriticalAge = list[halfCriticalAge];
  regression.expectancyAtLastAge = list.last;
  for (var i = 0; i < list.length; i++) {
    var modelVal = calc.getExpantancy(i.toDouble());
    var listVal = list[i];
    var relError = pow((listVal - modelVal) / listVal, 2);
    regression.errorLimit += relError;
    if (regression.errorLimit > errorLimit) {
      return regression;
    }
  }
  regression.successful = true;
  return regression;
}

class RegressionResult {
  bool successful = false;
  double errorLimit = 0;
  int criticalAge = 0;
  int halfCriticalAge = 0;
  double expectancyAtBirth = 0;
  double expectancyAtHalfCriticalAge = 0;
  double lastAge = 0;
  double expectancyAtCriticalAge = 0;
  double expectancyAtLastAge = 0;
}
