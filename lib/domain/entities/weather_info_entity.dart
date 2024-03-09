import 'package:equatable/equatable.dart';
import 'package:weath_app/domain/entities/clouds_entity.dart';
import 'package:weath_app/domain/entities/main_weather_info_entity.dart';

import 'sunset_sunrise_entity.dart';
import 'weather_description_entity.dart';
import 'weather_theme_entity.dart';
import 'wind_info_entity.dart';

class WeatherInfoEntity extends Equatable {
  const WeatherInfoEntity({
    this.weather,
    this.main,
    required this.visibility,
    this.wind,
    this.clouds,
    required this.dt,
    this.sys,
    required this.timezone,
    required this.id,
    required this.name,
  });
  final List<WeatherDescriptionEntity?>? weather;
  final MainWeatherInfoEntity? main;
  final String visibility;
  final WindInfoEntity? wind;
  final CloudsEntity? clouds;
  final String dt;
  final SunsetSunriseEntity? sys;
  final int timezone;
  final int id;
  final String name;

  @override
  List<Object?> get props => <Object?>[
        weather,
        main,
        visibility,
        wind,
        clouds,
        dt,
        sys,
        timezone,
        id,
        name,

      ];
}
