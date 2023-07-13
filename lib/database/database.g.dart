// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'database.dart';

// **************************************************************************
// FloorGenerator
// **************************************************************************

// ignore: avoid_classes_with_only_static_members
class $FloorFlutterDatabase {
  /// Creates a database builder for a persistent database.
  /// Once a database is built, you should keep a reference to it and re-use it.
  static _$FlutterDatabaseBuilder databaseBuilder(String name) =>
      _$FlutterDatabaseBuilder(name);

  /// Creates a database builder for an in memory database.
  /// Information stored in an in memory database disappears when the process is killed.
  /// Once a database is built, you should keep a reference to it and re-use it.
  static _$FlutterDatabaseBuilder inMemoryDatabaseBuilder() =>
      _$FlutterDatabaseBuilder(null);
}

class _$FlutterDatabaseBuilder {
  _$FlutterDatabaseBuilder(this.name);

  final String? name;

  final List<Migration> _migrations = [];

  Callback? _callback;

  /// Adds migrations to the builder.
  _$FlutterDatabaseBuilder addMigrations(List<Migration> migrations) {
    _migrations.addAll(migrations);
    return this;
  }

  /// Adds a database [Callback] to the builder.
  _$FlutterDatabaseBuilder addCallback(Callback callback) {
    _callback = callback;
    return this;
  }

  /// Creates the database and initializes it.
  Future<FlutterDatabase> build() async {
    final path = name != null
        ? await sqfliteDatabaseFactory.getDatabasePath(name!)
        : ':memory:';
    final database = _$FlutterDatabase();
    database.database = await database.open(
      path,
      _migrations,
      _callback,
    );
    return database;
  }
}

class _$FlutterDatabase extends FlutterDatabase {
  _$FlutterDatabase([StreamController<String>? listener]) {
    changeListener = listener ?? StreamController<String>.broadcast();
  }

  WeatherReportDao? _weatherReportDaoInstance;

  Future<sqflite.Database> open(
    String path,
    List<Migration> migrations, [
    Callback? callback,
  ]) async {
    final databaseOptions = sqflite.OpenDatabaseOptions(
      version: 2,
      onConfigure: (database) async {
        await database.execute('PRAGMA foreign_keys = ON');
        await callback?.onConfigure?.call(database);
      },
      onOpen: (database) async {
        await callback?.onOpen?.call(database);
      },
      onUpgrade: (database, startVersion, endVersion) async {
        await MigrationAdapter.runMigrations(
            database, startVersion, endVersion, migrations);

        await callback?.onUpgrade?.call(database, startVersion, endVersion);
      },
      onCreate: (database, version) async {
        await database.execute(
            'CREATE TABLE IF NOT EXISTS `weather` (`forecast_day` TEXT NOT NULL, `condition` TEXT NOT NULL, `maxtemp_c` TEXT NOT NULL, `mintemp_c` TEXT NOT NULL, PRIMARY KEY (`forecast_day`))');

        await callback?.onCreate?.call(database, version);
      },
    );
    return sqfliteDatabaseFactory.openDatabase(path, options: databaseOptions);
  }

  @override
  WeatherReportDao get weatherReportDao {
    return _weatherReportDaoInstance ??=
        _$WeatherReportDao(database, changeListener);
  }
}

class _$WeatherReportDao extends WeatherReportDao {
  _$WeatherReportDao(
    this.database,
    this.changeListener,
  )   : _queryAdapter = QueryAdapter(database),
        _weatherInsertionAdapter = InsertionAdapter(
            database,
            'weather',
            (Weather item) => <String, Object?>{
                  'forecast_day': item.forecast_day,
                  'condition': item.condition,
                  'maxtemp_c': item.maxtemp_c,
                  'mintemp_c': item.mintemp_c
                });

  final sqflite.DatabaseExecutor database;

  final StreamController<String> changeListener;

  final QueryAdapter _queryAdapter;

  final InsertionAdapter<Weather> _weatherInsertionAdapter;

  @override
  Future<List<Weather>> getAllList() async {
    return _queryAdapter.queryList('SELECT * FROM weather',
        mapper: (Map<String, Object?> row) => Weather(
            forecast_day: row['forecast_day'] as String,
            condition: row['condition'] as String,
            maxtemp_c: row['maxtemp_c'] as String,
            mintemp_c: row['mintemp_c'] as String));
  }

  @override
  Future<List<int>> insertList(List<Weather> list) {
    return _weatherInsertionAdapter.insertListAndReturnIds(
        list, OnConflictStrategy.replace);
  }
}
