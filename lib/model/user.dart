import 'package:death_day/model/data.g.dart';
import 'package:flutter/widgets.dart';
import 'package:json_annotation/json_annotation.dart';
import '../l10n/gen_l10n/app_localizations.dart';
import 'package:uuid/uuid.dart';

  User defaultUser(){
    return User(
      id: Uuid().v4(),
      name: "User Name",
      gender: Gender.male,
      birthDate: DateTime(1969, 7, 20, 20, 18, 4),
    );
  }

@JsonSerializable()
class User {
  String id;
  String name = "User Name";
  Gender gender = Gender.male;
  DateTime birthDate = DateTime.parse('1969-07-20 20:18:04Z');

  User({
    required this.id,
    required this.name,
    required this.gender,
    required this.birthDate,
  });

  factory User.fromMap(Map<String, dynamic> map) {
    return User(
      id: map['id'],
      name: map['name'],
      gender: Gender.values[map['gender']],
      birthDate: DateTime.parse(map['birthDate']),
    );
  }

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

  Map<String, dynamic> toMap() {
    return {
      'id': id,
      'name': name,
      'gender': gender.index, // Gender als Integer speichern
      'birthDate': birthDate.toIso8601String(),
    };
  }
}

enum Gender { male, female }

extension ParseToString on Gender {
  String toPrintString(BuildContext context) {
    if (this == Gender.female) {
      return AppLocalizations.of(context).female;
    } else {
      return AppLocalizations.of(context).male;
    }
  }
}
