import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:weather_app/cubit/weather_states.dart';
import 'package:weather_app/main.dart';
import 'package:weather_app/repository/weather_repository.dart';

class WeatherCubit extends Cubit<WeatherStates> {
  final WeatherRepository _weatherRepository = getIt.get<WeatherRepository>();
  WeatherCubit() : super(const WeatherInitial());
  Future<void> getWeather() async {
    try {
      await _weatherRepository.getWeather("London");
    } catch (e) {
      debugPrint(e.toString());
    }
  }

  Future<void> getWeatherFromDb() async {
    try {
      emit(const WeatherLoading());
      final list = await _weatherRepository.getWeatherFromDb();
      emit(WeatherFetched(list));
    } catch (e) {
      emit(WeatherException(e.toString()));
    }
  }
}
