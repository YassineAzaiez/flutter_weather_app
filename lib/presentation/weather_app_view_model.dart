import 'dart:async';

import 'package:flutter/material.dart';
import 'package:injectable/injectable.dart';
import 'package:weath_app/core/utils/networkHelper/api_result_model.dart';
import 'package:weath_app/domain/entities/weather_info_entity.dart';
import 'package:weath_app/domain/repositories/weather_repository.dart';
import 'package:weath_app/domain/requestes/weather_by_coordinates_request.dart';

@injectable
class WeatherAppViewModel extends ChangeNotifier {
  WeatherAppViewModel(this._weatherRepository);

  final WeatherRepository _weatherRepository;

  final StreamController<ApiResult<WeatherInfoEntity>> _weatherResult =
      StreamController<ApiResult<WeatherInfoEntity>>.broadcast();

  StreamController<ApiResult<WeatherInfoEntity>> get weatherResult =>
      _weatherResult;

  final StreamController<bool> _showLoading =
      StreamController<bool>.broadcast();

  StreamController<bool> get showLoading => _showLoading;

  Future<void> getWeatherByCoordinates(
      WeatherByCoordinatesRequest weatherByCoordinatesRequest) async {
    toggleLoading(true);
    final ApiResult<WeatherInfoEntity> result = await _weatherRepository
        .getWeatherDataByCoordinates(weatherByCoordinatesRequest);

    _weatherResult.add(result);
  }

  void toggleLoading(isLoading) {
    _showLoading.add(isLoading);
  }

  @override
  void onDispose() {
    _weatherResult.close();
  }
}
