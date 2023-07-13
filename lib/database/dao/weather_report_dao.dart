import 'package:floor/floor.dart';

import '../entity/weather.dart';

@dao
abstract class WeatherReportDao {
  @Insert(onConflict: OnConflictStrategy.replace)
  Future<List<int>> insertList(List<Weather> list);

  @Query('SELECT * FROM weather')
  Future<List<Weather>> getAllList();
}
