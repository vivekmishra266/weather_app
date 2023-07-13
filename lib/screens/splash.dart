import 'dart:async';
import 'package:flutter/material.dart';
import 'package:weather_app/main.dart';
import 'package:weather_app/repository/weather_repository.dart';

class SplashScreen extends StatefulWidget {
  const SplashScreen({super.key});

  @override
  State<SplashScreen> createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {
  double _width = 150;
  double _height = 150;
  double _fontSize = 30;
  late Timer _timer;

  @override
  void initState() {
    setTimer();
    super.initState();
  }

  void setTimer() {
    _timer = Timer(const Duration(seconds: 1), () {
      setState(() {
        _width = 300;
        _height = 300;
        _fontSize = 40;
      });
    });
  }

  @override
  Widget build(BuildContext context) {
    getIt.get<WeatherRepository>().getWeather("London");
    return Scaffold(
      backgroundColor: Theme.of(context).colorScheme.background,
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            AnimatedContainer(
              width: _width,
              height: _height,
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(10),
              ),
              duration: const Duration(seconds: 1),
              onEnd: () {
                Navigator.of(context).pushNamedAndRemoveUntil(
                    "/home", ModalRoute.withName("/home"));
              },
              curve: Curves.fastOutSlowIn,
              child: FlutterLogo(
                size: _width / 2,
              ),
            ),
            const SizedBox(
              height: 40,
            ),
            Text(
              "Weather App",
              style: TextStyle(
                  color: Theme.of(context).colorScheme.primary,
                  fontSize: _fontSize),
            )
          ],
        ),
      ),
    );
  }

  @override
  void dispose() {
    _timer.cancel();
    super.dispose();
  }
}
