
import 'package:json_annotation/json_annotation.dart';
import 'package:weath_app/core/utils/extensions/extension_functions.dart';
import 'package:weath_app/core/utils/mapper/data_mapper.dart';
import 'package:weath_app/data/models/sunset_sunrise_response_model.dart';
import 'package:weath_app/data/models/weather_description_response_model.dart';
import 'package:weath_app/data/models/wind_info_response_model.dart';
import 'package:weath_app/domain/entities/clouds_entity.dart';
import 'package:weath_app/domain/entities/main_weather_info_entity.dart';
import 'package:weath_app/domain/entities/sunset_sunrise_entity.dart';
import 'package:weath_app/domain/entities/weather_description_entity.dart';
import 'package:weath_app/domain/entities/weather_info_entity.dart';
import 'package:weath_app/domain/entities/wind_info_entity.dart';

import 'clouds_response_model.dart';
import 'coordinate_response_model.dart';
import 'main_weather_info_response_model.dart';

part 'weather_info_response_model.g.dart';

@JsonSerializable()
class WeatherInfoResponseModel extends DataMapper<WeatherInfoEntity> {
  WeatherInfoResponseModel(
      {this.coordinateData,
      this.weatherDescription,
      this.mainWeatherData,
      this.weatherVisibility,
      this.windData,
      this.cloudsData,
      this.date,
      this.sunsetAndSunriseData,
      this.timezone,
      this.id,
      this.cityName,
     });
  factory WeatherInfoResponseModel.fromJson(Map<String, dynamic> json) =>
      _$WeatherInfoResponseModelFromJson(json);
  @JsonKey(name: 'coord')
  CoordinateResponseModel? coordinateData;
  @JsonKey(name: 'weather')
  List<WeatherDescriptionResponseModel>? weatherDescription;
  @JsonKey(name: 'main')
  MainWeatherInfoResponseModel? mainWeatherData;
  @JsonKey(name: 'visibility')
  int? weatherVisibility;
  @JsonKey(name: 'wind')
  WindInfoResponseModel? windData;
  @JsonKey(name: 'clouds')
  CloudsResponseModel? cloudsData;
  @JsonKey(name: 'dt')
  int? date;
  @JsonKey(name: 'sys')
  SunsetSunriseResponseModel? sunsetAndSunriseData;
  int? timezone;
  int? id;
  @JsonKey(name: 'name')
  String? cityName;



  @override
  WeatherInfoEntity mapToEntity() {
    final List<WeatherDescriptionEntity>? _weatherDescription =
        weatherDescription
            ?.map((WeatherDescriptionResponseModel weatherDescriptionEntity) =>
                weatherDescriptionEntity.mapToEntity())
            .toList();

    return WeatherInfoEntity(
      main: mainWeatherData?.mapToEntity() ?? const MainWeatherInfoEntity(),
      id: id ?? 0,
      visibility: weatherVisibility?.toKM() ?? '',
      clouds: cloudsData?.mapToEntity() ?? const CloudsEntity(),
      weather: _weatherDescription,
      dt: date?.fromTimestampToDate() ?? '',
      name: cityName ?? '',
      sys: sunsetAndSunriseData?.mapToEntity() ?? const SunsetSunriseEntity(),
      timezone: timezone ?? 0,
      wind: windData?.mapToEntity() ?? const WindInfoEntity(),
    );
  }
}
