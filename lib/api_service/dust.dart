import 'package:json_annotation/json_annotation.dart';

part 'dust.g.dart';

@JsonSerializable()
class Dust {
  final Coord coord;
  final List<WeatherList> list;

  Dust({
    required this.coord,
    required this.list,
  });

  factory Dust.fromJson(Map<String, dynamic> json) => _$DustFromJson(json);
  Map<String, dynamic> toJson() => _$DustToJson(this);
}

@JsonSerializable()
class Coord {
  final double lon;
  final double lat;

  Coord({
    required this.lon,
    required this.lat,
  });

  factory Coord.fromJson(Map<String, dynamic> json) => _$CoordFromJson(json);
  Map<String, dynamic> toJson() => _$CoordToJson(this);
}

@JsonSerializable()
class WeatherList {
  final Main main;
  final Components components;
  final int dt;

  WeatherList({
    required this.main,
    required this.components,
    required this.dt,
  });

  factory WeatherList.fromJson(Map<String, dynamic> json) => _$WeatherListFromJson(json);
  Map<String, dynamic> toJson() => _$WeatherListToJson(this);
}

@JsonSerializable()
class Main {
  final int aqi;

  Main({
    required this.aqi,
  });

  factory Main.fromJson(Map<String, dynamic> json) => _$MainFromJson(json);
  Map<String, dynamic> toJson() => _$MainToJson(this);
}

@JsonSerializable()
class Components {
  final double co;
  final double no;
  final double no2;
  final double o3;
  final double so2;

  @JsonKey(name: 'pm2_5')
  final double pm25;

  final double pm10;
  final double nh3;

  Components({
    required this.co,
    required this.no,
    required this.no2,
    required this.o3,
    required this.so2,
    required this.pm25,
    required this.pm10,
    required this.nh3,
  });

  factory Components.fromJson(Map<String, dynamic> json) => _$ComponentsFromJson(json);
  Map<String, dynamic> toJson() => _$ComponentsToJson(this);
}
