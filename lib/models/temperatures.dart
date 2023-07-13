import 'dart:convert';

import 'package:weather_app/models/current.dart';
import 'package:weather_app/models/forecast.dart';
import 'package:weather_app/models/locations.dart';

class Temperatures {
  Location? location;
  Current? current;
  Forecast? forecast;

  Temperatures({
    required this.location,
    required this.current,
    required this.forecast,
  });

  Temperatures copyWith({
    Location? location,
    Current? current,
    Forecast? forecast,
  }) {
    return Temperatures(
      location: location ?? this.location,
      current: current ?? this.current,
      forecast: forecast ?? this.forecast,
    );
  }

  Map<String, dynamic> toMap() {
    return <String, dynamic>{
      'location': location?.toMap(),
      'current': current?.toMap(),
      'forecast': forecast?.toMap(),
    };
  }

  factory Temperatures.fromMap(Map<String, dynamic> map) {
    return Temperatures(
      // location: Location.fromMap(map['location'] as Map<String, dynamic>),
      // current: Current.fromMap(map['current'] as Map<String, dynamic>),
      location: null,
      current: null,
      forecast: Forecast.fromMap(map['forecast'] as Map<String, dynamic>),
    );
  }

  String toJson() => json.encode(toMap());

  factory Temperatures.fromJson(String source) =>
      Temperatures.fromMap(jsonDecode(source) as Map<String, dynamic>);

  @override
  String toString() =>
      'Temperatures(location: $location, current: $current, forecast: $forecast)';

  @override
  bool operator ==(covariant Temperatures other) {
    if (identical(this, other)) return true;

    return other.location == location &&
        other.current == current &&
        other.forecast == forecast;
  }

  @override
  int get hashCode => location.hashCode ^ current.hashCode ^ forecast.hashCode;
}
