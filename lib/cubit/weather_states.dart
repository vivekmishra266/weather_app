import 'package:equatable/equatable.dart';
import 'package:weather_app/database/entity/weather.dart';

abstract class WeatherStates extends Equatable {
  const WeatherStates();
}

class WeatherInitial extends WeatherStates {
  const WeatherInitial();

  @override
  List<Object?> get props => [];
}

class WeatherLoading extends WeatherStates {
  const WeatherLoading();
  @override
  List<Object?> get props => [];
}

class WeatherFetched extends WeatherStates {
  final List<Weather>? list;
  const WeatherFetched(this.list);
  @override
  List<Object?> get props => [list];
}

class WeatherException extends WeatherStates {
  final String error;
  const WeatherException(this.error);
  @override
  List<Object?> get props => [error];
}
