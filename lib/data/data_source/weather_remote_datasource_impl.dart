import 'package:dio/dio.dart';
import 'package:injectable/injectable.dart';
import 'package:weath_app/core/utils/constants/app_constants.dart';
import 'package:weath_app/core/utils/networkHelper/api_helper.dart';
import 'package:weath_app/core/utils/networkHelper/api_result_model.dart';
import 'package:weath_app/core/utils/networkHelper/error.dart';
import 'package:weath_app/core/utils/networkHelper/http_method.dart';
import 'package:weath_app/data/models/weather_info_response_model.dart';
import 'package:weath_app/domain/requestes/weather_by_coordinates_request.dart';

import 'weather_remote_datasource.dart';

@Injectable(as: WeatherRemoteDataSource)
class WeatherRemoteDataSourceImpl implements WeatherRemoteDataSource {
  WeatherRemoteDataSourceImpl(this._apiCallHelper);

  final ApiHelper _apiCallHelper;


  @override
  Future<ApiResult<WeatherInfoResponseModel>> getWeatherDataByCoordinates(
       WeatherByCoordinatesRequest
          weatherByCoordinatesRequestModel) async {

      final ApiResult<Response> result = await _apiCallHelper.makeRequest(
          method: HttpMethod.get,
          endPoint: getWeatherInfo,
          queryParams: <String, dynamic>{
            latKey: weatherByCoordinatesRequestModel.lat,
            loKey: weatherByCoordinatesRequestModel.lon,
            appId: appIdValue,
          });
      return result.when(
        success: (Response response) {
          return ApiResult<WeatherInfoResponseModel>.success(
            data: WeatherInfoResponseModel.fromJson(
              response.extra,
            ),
          );
        },
        error: (Failure errorModel) {
          return ApiResult<WeatherInfoResponseModel>.error(
              errorResult: errorModel);
        },
      );
    }
}
