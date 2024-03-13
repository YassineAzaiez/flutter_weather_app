import 'dart:convert';

import 'package:injectable/injectable.dart';
import 'package:weath_app/core/utils/constants/app_constants.dart';
import 'package:weath_app/core/utils/networkHelper/api_result_model.dart';
import 'package:weath_app/core/utils/networkHelper/error.dart';
import 'package:weath_app/core/utils/shared_preference/weather_app_secure_storage.dart';
import 'package:weath_app/data/data_source/weather_remote_datasource.dart';
import 'package:weath_app/data/models/weather_info_response_model.dart';
import 'package:weath_app/domain/entities/city_entity.dart';
import 'package:weath_app/domain/entities/weather_info_entity.dart';
import 'package:weath_app/domain/repositories/weather_repository.dart';
import 'package:weath_app/domain/requestes/weather_by_coordinates_request.dart';

@Injectable(as: WeatherRepository)
class WeatherRepositoryImpl implements WeatherRepository {
  WeatherRepositoryImpl({
    required this.weatherAppSecureStorage,
    required this.remoteDataSource,
  });

  final WeatherRemoteDataSource remoteDataSource;
  final WeatherAppSecureStorage weatherAppSecureStorage;

  @override
  Future<ApiResult<WeatherInfoEntity>> getWeatherDataByCoordinates(
      WeatherByCoordinatesRequest weatherByCoordinatesRequestModel) async {
    final ApiResult<WeatherInfoResponseModel> _result = await remoteDataSource
        .getWeatherDataByCoordinates(weatherByCoordinatesRequestModel);
    return _result.when(
      success: (WeatherInfoResponseModel weatherInfoResponseModel) async {
        return ApiResult<WeatherInfoEntity>.success(
          data: weatherInfoResponseModel.mapToEntity(),
        );
      },
      error: (Failure errorResult) {
        return ApiResult<WeatherInfoEntity>.error(
          errorResult: errorResult,
        );
      },
    );
  }

  @override
  Future<ApiResult<List<CityEntity>>> getSavedCities() async {
    try {
      return await weatherAppSecureStorage
          .getField(getSavedCitiesKey)
          .then((dynamic value) async {
        if (value == null) {
          return ApiResult<List<CityEntity>>.success(
            data: List<CityEntity>.empty(),
          );
        } else {
          final dynamic decoded = json.decode(value);
          final List<CityEntity> cities = List<CityEntity>.from(
            decoded.map(
              (dynamic entity) => CityEntity.fromJson(entity),
            ),
          );

          return ApiResult<List<CityEntity>>.success(
            data: cities,
          );
        }
      });
    } on Exception catch (_) {
      return const ApiResult<List<CityEntity>>.success(
        data: <CityEntity>[],
      );
    }
  }

  @override
  Future<ApiResult<bool>> saveCity(CityEntity city) async {
    try {
      // Retrieve the existing list of cities from SharedPreferences
     List<CityEntity> cities = await _getSavedCities();

      // Add the new city to the existing list
      cities.add(city);

      // Convert the list of cities to JSON
      String citiesJson = json.encode(cities);

      // Save the updated list to SharedPreferences
      await weatherAppSecureStorage.setField(getSavedCitiesKey, citiesJson);

      // Return success
      return const ApiResult<bool>.success(data: true);
    } catch (error) {
      // Return error if any exception occurs
      return ApiResult<bool>.error(
        errorResult: Failure(
          message: error.toString(),
        ),
      );
    }
  }

// Method to retrieve the existing list of cities from SharedPreferences
  Future<List<CityEntity>> _getSavedCities() async {
    String citiesJson =
        await weatherAppSecureStorage.getField(getSavedCitiesKey) ?? '';
    if (citiesJson.isNotEmpty) {
      // Convert JSON to list of cities
      dynamic decodedJson = json.decode(citiesJson);
      List<CityEntity> cities = fromJsonToList(
        decodedJson,
        (dynamic entity) => CityEntity.fromJson(entity),
      );
      return cities;
    } else {
      return []; // Return an empty list if no cities are found
    }
  }

  List<T> fromJsonToList<T>(
          dynamic decodedJson, T Function(dynamic) fromJson) =>
      List<T>.from(decodedJson.map((dynamic entity) => fromJson(entity)));
}
