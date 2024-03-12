import 'dart:async';

import 'package:flutter/material.dart';
import 'package:injectable/injectable.dart';
import 'package:weath_app/core/utils/networkHelper/api_result_model.dart';
import 'package:weath_app/domain/entities/city_entity.dart';
import 'package:weath_app/domain/entities/weather_info_entity.dart';
import 'package:weath_app/domain/repositories/weather_repository.dart';
import 'package:weath_app/domain/requestes/weather_by_coordinates_request.dart';

@injectable
class AddCityViewModel extends ChangeNotifier {
  AddCityViewModel(this._weatherRepository);

  final WeatherRepository _weatherRepository;


  String cityName ='';
  String long ='';
  String lat ='';

  final StreamController<ApiResult<List<CityEntity>>> _citiesListResult =
      StreamController<ApiResult<List<CityEntity>>>.broadcast();

  StreamController<ApiResult<List<CityEntity>>> get citiesListResult =>
      _citiesListResult;

  final StreamController<ApiResult<bool>> _saveCityResult =
      StreamController<ApiResult<bool>>.broadcast();

  StreamController<ApiResult<bool>> get saveCityResult => _saveCityResult;

  final StreamController<bool> _showLoading =
      StreamController<bool>.broadcast();

  StreamController<bool> get showLoading => _showLoading;

  Future<void> getSavesCitiesList() async {
    toggleLoading(true);
    final ApiResult<List<CityEntity>> result =
        await _weatherRepository.getSavedCities();

    _citiesListResult.add(result);
  }

  Future<void> _saveCity(CityEntity city) async {
    toggleLoading(true);
    final ApiResult<bool> result = await _weatherRepository.saveCity(city);

    _saveCityResult.add(result);
  }

  void toggleLoading(isLoading) {
    _showLoading.add(isLoading);
  }

  Future<void> submitForm() async {
    if (cityName.isNotEmpty && long.isNotEmpty && lat.isNotEmpty) {
      _saveCity(CityEntity(lat, long, cityName));
    }
  }

  @override
  void onDispose() {
    _citiesListResult.close();
    _saveCityResult.close();
    super.dispose();
  }
}
