import 'package:json_annotation/json_annotation.dart';
import 'package:weath_app/core/utils/extensions/extension_functions.dart';
import 'package:weath_app/core/utils/mapper/data_mapper.dart';
import 'package:weath_app/domain/entities/main_weather_info_entity.dart';

part 'main_weather_info_response_model.g.dart';

@JsonSerializable()
class MainWeatherInfoResponseModel extends DataMapper<MainWeatherInfoEntity> {
  MainWeatherInfoResponseModel({
    this.temp,
    this.feelsLike,
    this.tempMin,
    this.tempMax,
    this.pressure,
    this.humidity,
  });

  factory MainWeatherInfoResponseModel.fromJson(Map<String, dynamic> json) =>
      _$MainWeatherInfoResponseModelFromJson(json);

  final double? temp;
  @JsonKey(name: 'feels_like')
  final double? feelsLike;
  @JsonKey(name: 'temp_min')
  final double? tempMin;
  @JsonKey(name: 'temp_max')
  final double? tempMax;
  final int? pressure;
  final int? humidity;

  @override
  MainWeatherInfoEntity mapToEntity() {
    return MainWeatherInfoEntity(
      temp: temp?.toCelsius() ?? '',
      feelsLike: feelsLike ?? 0.0,
      humidity: humidity ?? 0,
      pressure: pressure ?? 0,
      tempMax: tempMax ?? 0.0,
      tempMin: tempMin ?? 0.0,
    );
  }
}
