import 'package:weath_app/core/utils/networkHelper/api_result_model.dart';
import 'package:weath_app/domain/entities/city_entity.dart';
import 'package:weath_app/domain/entities/weather_info_entity.dart';
import 'package:weath_app/domain/requestes/weather_by_coordinates_request.dart';

abstract class WeatherRepository {
  Future<ApiResult<WeatherInfoEntity>> getWeatherDataByCoordinates(
      WeatherByCoordinatesRequest weatherByCoordinatesRequestModel);

  Future<ApiResult<List<CityEntity>>> getSavedCities();
  Future<ApiResult<bool>> saveCity( CityEntity city);

}
