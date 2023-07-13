import 'package:weather_app/database/database.dart';
import 'package:weather_app/database/entity/weather.dart';
import 'package:weather_app/main.dart';
import 'package:weather_app/models/forecast.dart';
import 'package:weather_app/models/temperatures.dart';

import '../Utils/constants.dart';
import 'package:http/http.dart' as http;

class WeatherRepository {
  final FlutterDatabase _database = getIt.get<FlutterDatabase>();
  Future<void> getWeather(String city) async {
    final Map<String, String> queryParameters = <String, String>{
      'key': Constants.apiKey,
      'q': city,
      'days': '3',
    };
    Uri url = Uri.http(Constants.baseUrl, Constants.path, queryParameters);
    var response = await http.get(url);
    final temp = Temperatures.fromJson(response.body);
    setWeatherInDb(temp.forecast?.forecastday ?? []);
  }

  Future<void> setWeatherInDb(List<Forecastday> list) async {
    List<Weather> weatherList = [];
    for (var element in list) {
      final weather = Weather(
        forecast_day: element.date ?? DateTime.now().toString(),
        condition: element.day?.condition.text ?? "",
        maxtemp_c: element.day?.maxtemp_c.toString() ?? "",
        mintemp_c: element.day?.mintemp_c.toString() ?? "",
      );
      weatherList.add(weather);
    }
    _database.weatherReportDao.insertList(weatherList);
  }

  Future<List<Weather>> getWeatherFromDb() {
    return _database.weatherReportDao.getAllList();
  }
}
