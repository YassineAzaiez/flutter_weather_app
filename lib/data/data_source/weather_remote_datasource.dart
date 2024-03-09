import 'package:weath_app/core/utils/networkHelper/api_result_model.dart';
import 'package:weath_app/data/models/weather_info_response_model.dart';
import 'package:weath_app/domain/requestes/weather_by_coordinates_request.dart';


abstract class WeatherRemoteDataSource {
  Future<ApiResult<WeatherInfoResponseModel>> getWeatherDataByCoordinates(
      WeatherByCoordinatesRequest weatherByCoordinatesRequest);

}
