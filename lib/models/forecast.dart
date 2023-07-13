// ignore_for_file: public_member_api_docs, sort_constructors_first, non_constant_identifier_names
import 'dart:convert';

import 'package:flutter/foundation.dart';

import 'package:weather_app/models/current.dart';

class Forecast {
  List<Forecastday> forecastday;
  Forecast({
    required this.forecastday,
  });

  Forecast copyWith({
    List<Forecastday>? forecastday,
  }) {
    return Forecast(
      forecastday: forecastday ?? this.forecastday,
    );
  }

  Map<String, dynamic> toMap() {
    return <String, dynamic>{
      'forecastday': forecastday.map((x) => x.toMap()).toList(),
    };
  }

  factory Forecast.fromMap(Map<String, dynamic> map) {
    return Forecast(
      forecastday: List<Forecastday>.from(
        (map['forecastday'] as List<dynamic>).map<Forecastday>(
          (x) => Forecastday.fromMap(x as Map<String, dynamic>),
        ),
      ),
    );
  }

  String toJson() => json.encode(toMap());

  factory Forecast.fromJson(String source) =>
      Forecast.fromMap(json.decode(source) as Map<String, dynamic>);

  @override
  String toString() => 'Forecast(forecastday: $forecastday)';

  @override
  bool operator ==(covariant Forecast other) {
    if (identical(this, other)) return true;

    return listEquals(other.forecastday, forecastday);
  }

  @override
  int get hashCode => forecastday.hashCode;
}

class Forecastday {
  String? date;
  int? dateEpoch;
  Day? day;
  Astro? astro;
  List<Hour>? hour;

  Forecastday({
    required this.date,
    required this.dateEpoch,
    required this.day,
    required this.astro,
    required this.hour,
  });

  Forecastday copyWith({
    String? date,
    int? dateEpoch,
    Day? day,
    Astro? astro,
    List<Hour>? hour,
  }) {
    return Forecastday(
      date: date ?? this.date,
      dateEpoch: dateEpoch ?? this.dateEpoch,
      day: day ?? this.day,
      astro: astro ?? this.astro,
      hour: hour ?? this.hour,
    );
  }

  Map<String, dynamic> toMap() {
    return <String, dynamic>{
      'date': date,
      'dateEpoch': dateEpoch,
      'day': day?.toMap(),
      'astro': astro?.toMap(),
      'hour': hour?.map((x) => x.toMap()).toList(),
    };
  }

  factory Forecastday.fromMap(Map<String, dynamic> map) {
    return Forecastday(
      date: map['date'] as String,
      dateEpoch: map['date_epoch'] as int,
      day: Day.fromMap(map['day'] as Map<String, dynamic>),
      astro: null,
      hour: null,
    );
  }

  String toJson() => json.encode(toMap());

  factory Forecastday.fromJson(String source) =>
      Forecastday.fromMap(json.decode(source) as Map<String, dynamic>);

  @override
  String toString() {
    return 'Forecastday(date: $date, dateEpoch: $dateEpoch, day: $day, astro: $astro, hour: $hour)';
  }

  @override
  bool operator ==(covariant Forecastday other) {
    if (identical(this, other)) return true;

    return other.date == date &&
        other.dateEpoch == dateEpoch &&
        other.day == day &&
        other.astro == astro &&
        listEquals(other.hour, hour);
  }

  @override
  int get hashCode {
    return date.hashCode ^
        dateEpoch.hashCode ^
        day.hashCode ^
        astro.hashCode ^
        hour.hashCode;
  }
}

class Astro {
  String sunrise;
  String sunset;
  String moonrise;
  String moonset;
  String moonPhase;
  String moonIllumination;

  Astro({
    required this.sunrise,
    required this.sunset,
    required this.moonrise,
    required this.moonset,
    required this.moonPhase,
    required this.moonIllumination,
  });

  Astro copyWith({
    String? sunrise,
    String? sunset,
    String? moonrise,
    String? moonset,
    String? moonPhase,
    String? moonIllumination,
  }) {
    return Astro(
      sunrise: sunrise ?? this.sunrise,
      sunset: sunset ?? this.sunset,
      moonrise: moonrise ?? this.moonrise,
      moonset: moonset ?? this.moonset,
      moonPhase: moonPhase ?? this.moonPhase,
      moonIllumination: moonIllumination ?? this.moonIllumination,
    );
  }

  Map<String, dynamic> toMap() {
    return <String, dynamic>{
      'sunrise': sunrise,
      'sunset': sunset,
      'moonrise': moonrise,
      'moonset': moonset,
      'moonPhase': moonPhase,
      'moonIllumination': moonIllumination,
    };
  }

  factory Astro.fromMap(Map<String, dynamic> map) {
    return Astro(
      sunrise: map['sunrise'] as String,
      sunset: map['sunset'] as String,
      moonrise: map['moonrise'] as String,
      moonset: map['moonset'] as String,
      moonPhase: map['moonPhase'] as String,
      moonIllumination: map['moonIllumination'] as String,
    );
  }

  String toJson() => json.encode(toMap());

  factory Astro.fromJson(String source) =>
      Astro.fromMap(json.decode(source) as Map<String, dynamic>);

  @override
  String toString() {
    return 'Astro(sunrise: $sunrise, sunset: $sunset, moonrise: $moonrise, moonset: $moonset, moonPhase: $moonPhase, moonIllumination: $moonIllumination)';
  }

  @override
  bool operator ==(covariant Astro other) {
    if (identical(this, other)) return true;

    return other.sunrise == sunrise &&
        other.sunset == sunset &&
        other.moonrise == moonrise &&
        other.moonset == moonset &&
        other.moonPhase == moonPhase &&
        other.moonIllumination == moonIllumination;
  }

  @override
  int get hashCode {
    return sunrise.hashCode ^
        sunset.hashCode ^
        moonrise.hashCode ^
        moonset.hashCode ^
        moonPhase.hashCode ^
        moonIllumination.hashCode;
  }
}

class Day {
  double maxtemp_c;
  double maxtemp_f;
  double mintemp_c;
  double mintemp_f;
  double avgtemp_c;
  double avgtemp_f;
  double maxwind_mph;
  double maxwind_kph;
  double totalprecip_mm;
  double totalprecip_in;
  double totalsnow_cm;
  double avgvis_km;
  double avgvis_miles;
  double avghumidity;
  num daily_will_it_rain;
  num daily_chance_of_rain;
  num daily_will_it_snow;
  num daily_chance_of_snow;
  Condition condition;
  num uv;
  Day({
    required this.maxtemp_c,
    required this.maxtemp_f,
    required this.mintemp_c,
    required this.mintemp_f,
    required this.avgtemp_c,
    required this.avgtemp_f,
    required this.maxwind_mph,
    required this.maxwind_kph,
    required this.totalprecip_mm,
    required this.totalprecip_in,
    required this.totalsnow_cm,
    required this.avgvis_km,
    required this.avgvis_miles,
    required this.avghumidity,
    required this.daily_will_it_rain,
    required this.daily_chance_of_rain,
    required this.daily_will_it_snow,
    required this.daily_chance_of_snow,
    required this.condition,
    required this.uv,
  });

  Day copyWith({
    double? maxtemp_c,
    double? maxtemp_f,
    double? mintemp_c,
    double? mintemp_f,
    double? avgtemp_c,
    double? avgtemp_f,
    double? maxwind_mph,
    double? maxwind_kph,
    double? totalprecip_mm,
    double? totalprecip_in,
    double? totalsnow_cm,
    double? avgvis_km,
    double? avgvis_miles,
    double? avghumidity,
    num? daily_will_it_rain,
    num? daily_chance_of_rain,
    num? daily_will_it_snow,
    num? daily_chance_of_snow,
    Condition? condition,
    num? uv,
  }) {
    return Day(
      maxtemp_c: maxtemp_c ?? this.maxtemp_c,
      maxtemp_f: maxtemp_f ?? this.maxtemp_f,
      mintemp_c: mintemp_c ?? this.mintemp_c,
      mintemp_f: mintemp_f ?? this.mintemp_f,
      avgtemp_c: avgtemp_c ?? this.avgtemp_c,
      avgtemp_f: avgtemp_f ?? this.avgtemp_f,
      maxwind_mph: maxwind_mph ?? this.maxwind_mph,
      maxwind_kph: maxwind_kph ?? this.maxwind_kph,
      totalprecip_mm: totalprecip_mm ?? this.totalprecip_mm,
      totalprecip_in: totalprecip_in ?? this.totalprecip_in,
      totalsnow_cm: totalsnow_cm ?? this.totalsnow_cm,
      avgvis_km: avgvis_km ?? this.avgvis_km,
      avgvis_miles: avgvis_miles ?? this.avgvis_miles,
      avghumidity: avghumidity ?? this.avghumidity,
      daily_will_it_rain: daily_will_it_rain ?? this.daily_will_it_rain,
      daily_chance_of_rain: daily_chance_of_rain ?? this.daily_chance_of_rain,
      daily_will_it_snow: daily_will_it_snow ?? this.daily_will_it_snow,
      daily_chance_of_snow: daily_chance_of_snow ?? this.daily_chance_of_snow,
      condition: condition ?? this.condition,
      uv: uv ?? this.uv,
    );
  }

  Map<String, dynamic> toMap() {
    return <String, dynamic>{
      'maxtemp_c': maxtemp_c,
      'maxtemp_f': maxtemp_f,
      'mintemp_c': mintemp_c,
      'mintemp_f': mintemp_f,
      'avgtemp_c': avgtemp_c,
      'avgtemp_f': avgtemp_f,
      'maxwind_mph': maxwind_mph,
      'maxwind_kph': maxwind_kph,
      'totalprecip_mm': totalprecip_mm,
      'totalprecip_in': totalprecip_in,
      'totalsnow_cm': totalsnow_cm,
      'avgvis_km': avgvis_km,
      'avgvis_miles': avgvis_miles,
      'avghumidity': avghumidity,
      'daily_will_it_rain': daily_will_it_rain,
      'daily_chance_of_rain': daily_chance_of_rain,
      'daily_will_it_snow': daily_will_it_snow,
      'daily_chance_of_snow': daily_chance_of_snow,
      'condition': condition.toMap(),
      'uv': uv,
    };
  }

  factory Day.fromMap(Map<String, dynamic> map) {
    return Day(
      maxtemp_c: map['maxtemp_c'] as double,
      maxtemp_f: map['maxtemp_f'] as double,
      mintemp_c: map['mintemp_c'] as double,
      mintemp_f: map['mintemp_f'] as double,
      avgtemp_c: map['avgtemp_c'] as double,
      avgtemp_f: map['avgtemp_f'] as double,
      maxwind_mph: map['maxwind_mph'] as double,
      maxwind_kph: map['maxwind_kph'] as double,
      totalprecip_mm: map['totalprecip_mm'] as double,
      totalprecip_in: map['totalprecip_in'] as double,
      totalsnow_cm: map['totalsnow_cm'] as double,
      avgvis_km: map['avgvis_km'] as double,
      avgvis_miles: map['avgvis_miles'] as double,
      avghumidity: map['avghumidity'] as double,
      daily_will_it_rain: map['daily_will_it_rain'] as num,
      daily_chance_of_rain: map['daily_chance_of_rain'] as num,
      daily_will_it_snow: map['daily_will_it_snow'] as num,
      daily_chance_of_snow: map['daily_chance_of_snow'] as num,
      condition: Condition.fromMap(map['condition'] as Map<String, dynamic>),
      uv: map['uv'] as num,
    );
  }

  String toJson() => json.encode(toMap());

  factory Day.fromJson(String source) =>
      Day.fromMap(json.decode(source) as Map<String, dynamic>);

  @override
  String toString() {
    return 'Day(maxtemp_c: $maxtemp_c, maxtemp_f: $maxtemp_f, mintemp_c: $mintemp_c, mintemp_f: $mintemp_f, avgtemp_c: $avgtemp_c, avgtemp_f: $avgtemp_f, maxwind_mph: $maxwind_mph, maxwind_kph: $maxwind_kph, totalprecip_mm: $totalprecip_mm, totalprecip_in: $totalprecip_in, totalsnow_cm: $totalsnow_cm, avgvis_km: $avgvis_km, avgvis_miles: $avgvis_miles, avghumidity: $avghumidity, daily_will_it_rain: $daily_will_it_rain, daily_chance_of_rain: $daily_chance_of_rain, daily_will_it_snow: $daily_will_it_snow, daily_chance_of_snow: $daily_chance_of_snow, condition: $condition, uv: $uv)';
  }

  @override
  bool operator ==(covariant Day other) {
    if (identical(this, other)) return true;

    return other.maxtemp_c == maxtemp_c &&
        other.maxtemp_f == maxtemp_f &&
        other.mintemp_c == mintemp_c &&
        other.mintemp_f == mintemp_f &&
        other.avgtemp_c == avgtemp_c &&
        other.avgtemp_f == avgtemp_f &&
        other.maxwind_mph == maxwind_mph &&
        other.maxwind_kph == maxwind_kph &&
        other.totalprecip_mm == totalprecip_mm &&
        other.totalprecip_in == totalprecip_in &&
        other.totalsnow_cm == totalsnow_cm &&
        other.avgvis_km == avgvis_km &&
        other.avgvis_miles == avgvis_miles &&
        other.avghumidity == avghumidity &&
        other.daily_will_it_rain == daily_will_it_rain &&
        other.daily_chance_of_rain == daily_chance_of_rain &&
        other.daily_will_it_snow == daily_will_it_snow &&
        other.daily_chance_of_snow == daily_chance_of_snow &&
        other.condition == condition &&
        other.uv == uv;
  }

  @override
  int get hashCode {
    return maxtemp_c.hashCode ^
        maxtemp_f.hashCode ^
        mintemp_c.hashCode ^
        mintemp_f.hashCode ^
        avgtemp_c.hashCode ^
        avgtemp_f.hashCode ^
        maxwind_mph.hashCode ^
        maxwind_kph.hashCode ^
        totalprecip_mm.hashCode ^
        totalprecip_in.hashCode ^
        totalsnow_cm.hashCode ^
        avgvis_km.hashCode ^
        avgvis_miles.hashCode ^
        avghumidity.hashCode ^
        daily_will_it_rain.hashCode ^
        daily_chance_of_rain.hashCode ^
        daily_will_it_snow.hashCode ^
        daily_chance_of_snow.hashCode ^
        condition.hashCode ^
        uv.hashCode;
  }
}

class Hour {
  int timeEpoch;
  String time;
  double tempC;
  double tempF;
  int isDay;
  Condition condition;
  double windMph;
  double windKph;
  int windDegree;
  String windDir;
  int pressureMb;
  double pressureIn;
  int precipMm;
  int precipIn;
  int humidity;
  int cloud;
  double feelslikeC;
  double feelslikeF;
  double windchillC;
  double windchillF;
  double heatindexC;
  double heatindexF;
  double dewpointC;
  double dewpointF;
  int willItRain;
  int chanceOfRain;
  int willItSnow;
  int chanceOfSnow;
  int visKm;
  int visMiles;
  double gustMph;
  double gustKph;
  int uv;

  Hour({
    required this.timeEpoch,
    required this.time,
    required this.tempC,
    required this.tempF,
    required this.isDay,
    required this.condition,
    required this.windMph,
    required this.windKph,
    required this.windDegree,
    required this.windDir,
    required this.pressureMb,
    required this.pressureIn,
    required this.precipMm,
    required this.precipIn,
    required this.humidity,
    required this.cloud,
    required this.feelslikeC,
    required this.feelslikeF,
    required this.windchillC,
    required this.windchillF,
    required this.heatindexC,
    required this.heatindexF,
    required this.dewpointC,
    required this.dewpointF,
    required this.willItRain,
    required this.chanceOfRain,
    required this.willItSnow,
    required this.chanceOfSnow,
    required this.visKm,
    required this.visMiles,
    required this.gustMph,
    required this.gustKph,
    required this.uv,
  });

  Hour copyWith({
    int? timeEpoch,
    String? time,
    double? tempC,
    double? tempF,
    int? isDay,
    Condition? condition,
    double? windMph,
    double? windKph,
    int? windDegree,
    String? windDir,
    int? pressureMb,
    double? pressureIn,
    int? precipMm,
    int? precipIn,
    int? humidity,
    int? cloud,
    double? feelslikeC,
    double? feelslikeF,
    double? windchillC,
    double? windchillF,
    double? heatindexC,
    double? heatindexF,
    double? dewpointC,
    double? dewpointF,
    int? willItRain,
    int? chanceOfRain,
    int? willItSnow,
    int? chanceOfSnow,
    int? visKm,
    int? visMiles,
    double? gustMph,
    double? gustKph,
    int? uv,
  }) {
    return Hour(
      timeEpoch: timeEpoch ?? this.timeEpoch,
      time: time ?? this.time,
      tempC: tempC ?? this.tempC,
      tempF: tempF ?? this.tempF,
      isDay: isDay ?? this.isDay,
      condition: condition ?? this.condition,
      windMph: windMph ?? this.windMph,
      windKph: windKph ?? this.windKph,
      windDegree: windDegree ?? this.windDegree,
      windDir: windDir ?? this.windDir,
      pressureMb: pressureMb ?? this.pressureMb,
      pressureIn: pressureIn ?? this.pressureIn,
      precipMm: precipMm ?? this.precipMm,
      precipIn: precipIn ?? this.precipIn,
      humidity: humidity ?? this.humidity,
      cloud: cloud ?? this.cloud,
      feelslikeC: feelslikeC ?? this.feelslikeC,
      feelslikeF: feelslikeF ?? this.feelslikeF,
      windchillC: windchillC ?? this.windchillC,
      windchillF: windchillF ?? this.windchillF,
      heatindexC: heatindexC ?? this.heatindexC,
      heatindexF: heatindexF ?? this.heatindexF,
      dewpointC: dewpointC ?? this.dewpointC,
      dewpointF: dewpointF ?? this.dewpointF,
      willItRain: willItRain ?? this.willItRain,
      chanceOfRain: chanceOfRain ?? this.chanceOfRain,
      willItSnow: willItSnow ?? this.willItSnow,
      chanceOfSnow: chanceOfSnow ?? this.chanceOfSnow,
      visKm: visKm ?? this.visKm,
      visMiles: visMiles ?? this.visMiles,
      gustMph: gustMph ?? this.gustMph,
      gustKph: gustKph ?? this.gustKph,
      uv: uv ?? this.uv,
    );
  }

  Map<String, dynamic> toMap() {
    return <String, dynamic>{
      'timeEpoch': timeEpoch,
      'time': time,
      'tempC': tempC,
      'tempF': tempF,
      'isDay': isDay,
      'condition': condition.toMap(),
      'windMph': windMph,
      'windKph': windKph,
      'windDegree': windDegree,
      'windDir': windDir,
      'pressureMb': pressureMb,
      'pressureIn': pressureIn,
      'precipMm': precipMm,
      'precipIn': precipIn,
      'humidity': humidity,
      'cloud': cloud,
      'feelslikeC': feelslikeC,
      'feelslikeF': feelslikeF,
      'windchillC': windchillC,
      'windchillF': windchillF,
      'heatindexC': heatindexC,
      'heatindexF': heatindexF,
      'dewpointC': dewpointC,
      'dewpointF': dewpointF,
      'willItRain': willItRain,
      'chanceOfRain': chanceOfRain,
      'willItSnow': willItSnow,
      'chanceOfSnow': chanceOfSnow,
      'visKm': visKm,
      'visMiles': visMiles,
      'gustMph': gustMph,
      'gustKph': gustKph,
      'uv': uv,
    };
  }

  factory Hour.fromMap(Map<String, dynamic> map) {
    return Hour(
      timeEpoch: map['timeEpoch'] as int,
      time: map['time'] as String,
      tempC: map['tempC'] as double,
      tempF: map['tempF'] as double,
      isDay: map['isDay'] as int,
      condition: Condition.fromMap(map['condition'] as Map<String, dynamic>),
      windMph: map['windMph'] as double,
      windKph: map['windKph'] as double,
      windDegree: map['windDegree'] as int,
      windDir: map['windDir'] as String,
      pressureMb: map['pressureMb'] as int,
      pressureIn: map['pressureIn'] as double,
      precipMm: map['precipMm'] as int,
      precipIn: map['precipIn'] as int,
      humidity: map['humidity'] as int,
      cloud: map['cloud'] as int,
      feelslikeC: map['feelslikeC'] as double,
      feelslikeF: map['feelslikeF'] as double,
      windchillC: map['windchillC'] as double,
      windchillF: map['windchillF'] as double,
      heatindexC: map['heatindexC'] as double,
      heatindexF: map['heatindexF'] as double,
      dewpointC: map['dewpointC'] as double,
      dewpointF: map['dewpointF'] as double,
      willItRain: map['willItRain'] as int,
      chanceOfRain: map['chanceOfRain'] as int,
      willItSnow: map['willItSnow'] as int,
      chanceOfSnow: map['chanceOfSnow'] as int,
      visKm: map['visKm'] as int,
      visMiles: map['visMiles'] as int,
      gustMph: map['gustMph'] as double,
      gustKph: map['gustKph'] as double,
      uv: map['uv'] as int,
    );
  }

  String toJson() => json.encode(toMap());

  factory Hour.fromJson(String source) =>
      Hour.fromMap(json.decode(source) as Map<String, dynamic>);

  @override
  String toString() {
    return 'Hour(timeEpoch: $timeEpoch, time: $time, tempC: $tempC, tempF: $tempF, isDay: $isDay, condition: $condition, windMph: $windMph, windKph: $windKph, windDegree: $windDegree, windDir: $windDir, pressureMb: $pressureMb, pressureIn: $pressureIn, precipMm: $precipMm, precipIn: $precipIn, humidity: $humidity, cloud: $cloud, feelslikeC: $feelslikeC, feelslikeF: $feelslikeF, windchillC: $windchillC, windchillF: $windchillF, heatindexC: $heatindexC, heatindexF: $heatindexF, dewpointC: $dewpointC, dewpointF: $dewpointF, willItRain: $willItRain, chanceOfRain: $chanceOfRain, willItSnow: $willItSnow, chanceOfSnow: $chanceOfSnow, visKm: $visKm, visMiles: $visMiles, gustMph: $gustMph, gustKph: $gustKph, uv: $uv)';
  }

  @override
  bool operator ==(covariant Hour other) {
    if (identical(this, other)) return true;

    return other.timeEpoch == timeEpoch &&
        other.time == time &&
        other.tempC == tempC &&
        other.tempF == tempF &&
        other.isDay == isDay &&
        other.condition == condition &&
        other.windMph == windMph &&
        other.windKph == windKph &&
        other.windDegree == windDegree &&
        other.windDir == windDir &&
        other.pressureMb == pressureMb &&
        other.pressureIn == pressureIn &&
        other.precipMm == precipMm &&
        other.precipIn == precipIn &&
        other.humidity == humidity &&
        other.cloud == cloud &&
        other.feelslikeC == feelslikeC &&
        other.feelslikeF == feelslikeF &&
        other.windchillC == windchillC &&
        other.windchillF == windchillF &&
        other.heatindexC == heatindexC &&
        other.heatindexF == heatindexF &&
        other.dewpointC == dewpointC &&
        other.dewpointF == dewpointF &&
        other.willItRain == willItRain &&
        other.chanceOfRain == chanceOfRain &&
        other.willItSnow == willItSnow &&
        other.chanceOfSnow == chanceOfSnow &&
        other.visKm == visKm &&
        other.visMiles == visMiles &&
        other.gustMph == gustMph &&
        other.gustKph == gustKph &&
        other.uv == uv;
  }

  @override
  int get hashCode {
    return timeEpoch.hashCode ^
        time.hashCode ^
        tempC.hashCode ^
        tempF.hashCode ^
        isDay.hashCode ^
        condition.hashCode ^
        windMph.hashCode ^
        windKph.hashCode ^
        windDegree.hashCode ^
        windDir.hashCode ^
        pressureMb.hashCode ^
        pressureIn.hashCode ^
        precipMm.hashCode ^
        precipIn.hashCode ^
        humidity.hashCode ^
        cloud.hashCode ^
        feelslikeC.hashCode ^
        feelslikeF.hashCode ^
        windchillC.hashCode ^
        windchillF.hashCode ^
        heatindexC.hashCode ^
        heatindexF.hashCode ^
        dewpointC.hashCode ^
        dewpointF.hashCode ^
        willItRain.hashCode ^
        chanceOfRain.hashCode ^
        willItSnow.hashCode ^
        chanceOfSnow.hashCode ^
        visKm.hashCode ^
        visMiles.hashCode ^
        gustMph.hashCode ^
        gustKph.hashCode ^
        uv.hashCode;
  }
}
