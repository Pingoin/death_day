

import 'package:json_annotation/json_annotation.dart';

part 'user.g.dart';

@JsonSerializable()
class User{
  String name="User Name";
  DateTime birthDate=DateTime.parse('1969-07-20 20:18:04Z');
  User();
  Duration get timeLeft{
    return deathTime.difference(DateTime.now());
  }

  DateTime get deathTime{
    return DateTime.parse('2026-07-20 20:18:04Z');
  }

    /// Connect the generated [_$UserFromJson] function to the `fromJson`
  /// factory.
  factory User.fromJson(Map<String, dynamic> json) => _$UserFromJson(json);

  /// Connect the generated [_$UserToJson] function to the `toJson` method.
  Map<String, dynamic> toJson() => _$UserToJson(this);
}