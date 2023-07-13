import 'package:weather_app/database/database.dart';

class DataBaseHelper {
  DataBaseHelper._();
  static final DataBaseHelper instance = DataBaseHelper._();
  static FlutterDatabase? _database;
  Future<FlutterDatabase> get database async {
    if (_database != null) return _database!;
    _database = await _initDatabase();
    return _database!;
  }

  static _initDatabase() async {
    return await $FloorFlutterDatabase.databaseBuilder('zadinga.db').build();
  }
}
