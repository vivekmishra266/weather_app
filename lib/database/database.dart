import 'dart:async';

import 'package:floor/floor.dart';
import 'package:sqflite/sqflite.dart' as sqflite;
import 'package:weather_app/database/dao/weather_report_dao.dart';
import 'package:weather_app/database/entity/weather.dart';

part 'database.g.dart';

@Database(version: 2, entities: [
  Weather,
])
abstract class FlutterDatabase extends FloorDatabase {
  WeatherReportDao get weatherReportDao;
}
