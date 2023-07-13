import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:get_it/get_it.dart';
import 'package:weather_app/cubit/weather_cubit.dart';
import 'package:weather_app/database/database.dart';
import 'package:weather_app/database/database_helper.dart';
import 'package:weather_app/repository/weather_repository.dart';
import 'package:weather_app/screens/splash.dart';
import 'package:weather_app/screens/weather_forecast_screen.dart';

final getIt = GetIt.instance;
void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  final db = await DataBaseHelper.instance.database;
  registerClassesInGetIt(db);
  runApp(const MyApp());
}

void registerClassesInGetIt(FlutterDatabase database) async {
  getIt.registerSingleton(database);
  getIt.registerSingleton(WeatherRepository());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => WeatherCubit(),
      child: MaterialApp(
        title: 'Weather App',
        theme: ThemeData(
          colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
          useMaterial3: true,
        ),
        initialRoute: '/',
        routes: {
          '/': (context) => const SplashScreen(),
          '/home': (context) =>
              const WeatherForecastScreen(title: "Weather Forecast"),
        },
      ),
    );
  }
}
