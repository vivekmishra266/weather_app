// ignore_for_file: public_member_api_docs, sort_constructors_first, non_constant_identifier_names
import 'dart:convert';

import 'package:floor/floor.dart';

@Entity(tableName: "weather")
class Weather {
  @primaryKey
  String forecast_day;
  String condition;
  String maxtemp_c;
  String mintemp_c;
  Weather({
    required this.forecast_day,
    required this.condition,
    required this.maxtemp_c,
    required this.mintemp_c,
  });

  Weather copyWith({
    String? id,
    String? forecast_day,
    String? condition,
    String? maxtemp_c,
    String? mintemp_c,
  }) {
    return Weather(
      forecast_day: forecast_day ?? this.forecast_day,
      condition: condition ?? this.condition,
      maxtemp_c: maxtemp_c ?? this.maxtemp_c,
      mintemp_c: mintemp_c ?? this.mintemp_c,
    );
  }

  Map<String, dynamic> toMap() {
    return <String, dynamic>{
      'forecast_day': forecast_day,
      'condition': condition,
      'maxtemp_c': maxtemp_c,
      'mintemp_c': mintemp_c,
    };
  }

  factory Weather.fromMap(Map<String, dynamic> map) {
    return Weather(
      forecast_day: map['forecast_day'] as String,
      condition: map['condition'] as String,
      maxtemp_c: map['maxtemp_c'] as String,
      mintemp_c: map['mintemp_c'] as String,
    );
  }

  String toJson() => json.encode(toMap());

  factory Weather.fromJson(String source) =>
      Weather.fromMap(json.decode(source) as Map<String, dynamic>);

  @override
  String toString() {
    return 'Weather(forecast_day: $forecast_day, condition: $condition, maxtemp_c: $maxtemp_c, mintemp_c: $mintemp_c)';
  }

  @override
  bool operator ==(covariant Weather other) {
    if (identical(this, other)) return true;

    return other.forecast_day == forecast_day &&
        other.condition == condition &&
        other.maxtemp_c == maxtemp_c &&
        other.mintemp_c == mintemp_c;
  }

  @override
  int get hashCode {
    return forecast_day.hashCode ^
        condition.hashCode ^
        maxtemp_c.hashCode ^
        mintemp_c.hashCode;
  }
}
