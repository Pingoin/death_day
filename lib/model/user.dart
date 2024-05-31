import 'package:death_day/model/data.g.dart';
import 'package:flutter/widgets.dart';
import 'package:json_annotation/json_annotation.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';

part 'user.g.dart';

@JsonSerializable()
class User {
  String name = "User Name";
  Gender gender = Gender.male;
  DateTime birthDate = DateTime.parse('1969-07-20 20:18:04Z');
  User();
  Duration get timeLeft {
    return deathTime.difference(DateTime.now());
  }

  DateTime get deathTime {
    if (gender == Gender.male) {
      return maleModel.getDeathDate(birthDate);
    } else {
      return femaleModel.getDeathDate(birthDate);
    }
  }

  /// Connect the generated [_$UserFromJson] function to the `fromJson`
  /// factory.
  factory User.fromJson(Map<String, dynamic> json) => _$UserFromJson(json);

  /// Connect the generated [_$UserToJson] function to the `toJson` method.
  Map<String, dynamic> toJson() => _$UserToJson(this);
}

enum Gender { male, female }

extension ParseToString on Gender {
  String toPrintString(BuildContext context) {
    if (this == Gender.female) {
      return AppLocalizations.of(context)!.female;
    } else {
      return AppLocalizations.of(context)!.male;
    }
  }
}
