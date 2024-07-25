// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'dust.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

Dust _$DustFromJson(Map<String, dynamic> json) => Dust(
      coord: Coord.fromJson(json['coord'] as Map<String, dynamic>),
      list: (json['list'] as List<dynamic>)
          .map((e) => WeatherList.fromJson(e as Map<String, dynamic>))
          .toList(),
    );

Map<String, dynamic> _$DustToJson(Dust instance) => <String, dynamic>{
      'coord': instance.coord,
      'list': instance.list,
    };

Coord _$CoordFromJson(Map<String, dynamic> json) => Coord(
      lon: (json['lon'] as num).toDouble(),
      lat: (json['lat'] as num).toDouble(),
    );

Map<String, dynamic> _$CoordToJson(Coord instance) => <String, dynamic>{
      'lon': instance.lon,
      'lat': instance.lat,
    };

WeatherList _$WeatherListFromJson(Map<String, dynamic> json) => WeatherList(
      main: Main.fromJson(json['main'] as Map<String, dynamic>),
      components:
          Components.fromJson(json['components'] as Map<String, dynamic>),
      dt: (json['dt'] as num).toInt(),
    );

Map<String, dynamic> _$WeatherListToJson(WeatherList instance) =>
    <String, dynamic>{
      'main': instance.main,
      'components': instance.components,
      'dt': instance.dt,
    };

Main _$MainFromJson(Map<String, dynamic> json) => Main(
      aqi: (json['aqi'] as num).toInt(),
    );

Map<String, dynamic> _$MainToJson(Main instance) => <String, dynamic>{
      'aqi': instance.aqi,
    };

Components _$ComponentsFromJson(Map<String, dynamic> json) => Components(
      co: (json['co'] as num).toDouble(),
      no: (json['no'] as num).toDouble(),
      no2: (json['no2'] as num).toDouble(),
      o3: (json['o3'] as num).toDouble(),
      so2: (json['so2'] as num).toDouble(),
      pm25: (json['pm2_5'] as num).toDouble(),
      pm10: (json['pm10'] as num).toDouble(),
      nh3: (json['nh3'] as num).toDouble(),
    );

Map<String, dynamic> _$ComponentsToJson(Components instance) =>
    <String, dynamic>{
      'co': instance.co,
      'no': instance.no,
      'no2': instance.no2,
      'o3': instance.o3,
      'so2': instance.so2,
      'pm2_5': instance.pm25,
      'pm10': instance.pm10,
      'nh3': instance.nh3,
    };
