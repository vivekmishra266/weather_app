// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'dart:convert';

class Current {
  int lastUpdatedEpoch;
  String lastUpdated;
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
  int visKm;
  int visMiles;
  int uv;
  double gustMph;
  double gustKph;

  Current({
    required this.lastUpdatedEpoch,
    required this.lastUpdated,
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
    required this.visKm,
    required this.visMiles,
    required this.uv,
    required this.gustMph,
    required this.gustKph,
  });

  Current copyWith({
    int? lastUpdatedEpoch,
    String? lastUpdated,
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
    int? visKm,
    int? visMiles,
    int? uv,
    double? gustMph,
    double? gustKph,
  }) {
    return Current(
      lastUpdatedEpoch: lastUpdatedEpoch ?? this.lastUpdatedEpoch,
      lastUpdated: lastUpdated ?? this.lastUpdated,
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
      visKm: visKm ?? this.visKm,
      visMiles: visMiles ?? this.visMiles,
      uv: uv ?? this.uv,
      gustMph: gustMph ?? this.gustMph,
      gustKph: gustKph ?? this.gustKph,
    );
  }

  Map<String, dynamic> toMap() {
    return <String, dynamic>{
      'lastUpdatedEpoch': lastUpdatedEpoch,
      'lastUpdated': lastUpdated,
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
      'visKm': visKm,
      'visMiles': visMiles,
      'uv': uv,
      'gustMph': gustMph,
      'gustKph': gustKph,
    };
  }

  factory Current.fromMap(Map<String, dynamic> map) {
    return Current(
      lastUpdatedEpoch: map['lastUpdatedEpoch'] as int,
      lastUpdated: map['lastUpdated'] as String,
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
      visKm: map['visKm'] as int,
      visMiles: map['visMiles'] as int,
      uv: map['uv'] as int,
      gustMph: map['gustMph'] as double,
      gustKph: map['gustKph'] as double,
    );
  }

  String toJson() => json.encode(toMap());

  factory Current.fromJson(String source) =>
      Current.fromMap(json.decode(source) as Map<String, dynamic>);

  @override
  String toString() {
    return 'Current(lastUpdatedEpoch: $lastUpdatedEpoch, lastUpdated: $lastUpdated, tempC: $tempC, tempF: $tempF, isDay: $isDay, condition: $condition, windMph: $windMph, windKph: $windKph, windDegree: $windDegree, windDir: $windDir, pressureMb: $pressureMb, pressureIn: $pressureIn, precipMm: $precipMm, precipIn: $precipIn, humidity: $humidity, cloud: $cloud, feelslikeC: $feelslikeC, feelslikeF: $feelslikeF, visKm: $visKm, visMiles: $visMiles, uv: $uv, gustMph: $gustMph, gustKph: $gustKph)';
  }

  @override
  bool operator ==(covariant Current other) {
    if (identical(this, other)) return true;

    return other.lastUpdatedEpoch == lastUpdatedEpoch &&
        other.lastUpdated == lastUpdated &&
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
        other.visKm == visKm &&
        other.visMiles == visMiles &&
        other.uv == uv &&
        other.gustMph == gustMph &&
        other.gustKph == gustKph;
  }

  @override
  int get hashCode {
    return lastUpdatedEpoch.hashCode ^
        lastUpdated.hashCode ^
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
        visKm.hashCode ^
        visMiles.hashCode ^
        uv.hashCode ^
        gustMph.hashCode ^
        gustKph.hashCode;
  }
}

class Condition {
  String text;
  String icon;
  int code;

  Condition({
    required this.text,
    required this.icon,
    required this.code,
  });

  Condition copyWith({
    String? text,
    String? icon,
    int? code,
  }) {
    return Condition(
      text: text ?? this.text,
      icon: icon ?? this.icon,
      code: code ?? this.code,
    );
  }

  Map<String, dynamic> toMap() {
    return <String, dynamic>{
      'text': text,
      'icon': icon,
      'code': code,
    };
  }

  factory Condition.fromMap(Map<String, dynamic> map) {
    return Condition(
      text: map['text'] as String,
      icon: map['icon'] as String,
      code: map['code'] as int,
    );
  }

  String toJson() => json.encode(toMap());

  factory Condition.fromJson(String source) =>
      Condition.fromMap(json.decode(source) as Map<String, dynamic>);

  @override
  String toString() => 'Condition(text: $text, icon: $icon, code: $code)';

  @override
  bool operator ==(covariant Condition other) {
    if (identical(this, other)) return true;

    return other.text == text && other.icon == icon && other.code == code;
  }

  @override
  int get hashCode => text.hashCode ^ icon.hashCode ^ code.hashCode;
}

enum Text {
  PARTLY_CLOUDY,
  SUNNY,
  HEAVY_RAIN,
  CLEAR,
  OVERCAST,
  CLOUDY,
  THUNDERY_OUTBREAKS_POSSIBLE
}
