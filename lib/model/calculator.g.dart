// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'calculator.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

Calculator _$CalculatorFromJson(Map<String, dynamic> json) => Calculator(
      (json['expectancyAtBirth'] as num).toDouble(),
      (json['halfCriticalAge'] as num).toDouble(),
      (json['expectancyAtHalfCriticalAge'] as num).toDouble(),
      (json['criticalAge'] as num).toDouble(),
      (json['lastAge'] as num).toDouble(),
      (json['expectancyAtCriticalAge'] as num).toDouble(),
      (json['expectancyAtLastAge'] as num).toDouble(),
    )
      ..m1 = (json['m1'] as num).toDouble()
      ..b1 = (json['b1'] as num).toDouble()
      ..m2 = (json['m2'] as num).toDouble()
      ..b2 = (json['b2'] as num).toDouble()
      ..k1 = (json['k1'] as num).toDouble()
      ..z1 = (json['z1'] as num).toDouble();

Map<String, dynamic> _$CalculatorToJson(Calculator instance) =>
    <String, dynamic>{
      'halfCriticalAge': instance.halfCriticalAge,
      'criticalAge': instance.criticalAge,
      'm1': instance.m1,
      'b1': instance.b1,
      'm2': instance.m2,
      'b2': instance.b2,
      'k1': instance.k1,
      'z1': instance.z1,
      'expectancyAtBirth': instance.expectancyAtBirth,
      'expectancyAtHalfCriticalAge': instance.expectancyAtHalfCriticalAge,
      'lastAge': instance.lastAge,
      'expectancyAtCriticalAge': instance.expectancyAtCriticalAge,
      'expectancyAtLastAge': instance.expectancyAtLastAge,
    };
