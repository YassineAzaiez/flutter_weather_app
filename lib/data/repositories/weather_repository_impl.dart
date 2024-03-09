import 'package:injectable/injectable.dart';
import 'package:weath_app/core/utils/networkHelper/api_result_model.dart';
import 'package:weath_app/core/utils/networkHelper/error.dart';
import 'package:weath_app/data/data_source/weather_remote_datasource.dart';
import 'package:weath_app/data/models/weather_info_response_model.dart';
import 'package:weath_app/domain/entities/weather_info_entity.dart';
import 'package:weath_app/domain/repositories/weather_repository.dart';
import 'package:weath_app/domain/requestes/weather_by_coordinates_request.dart';

@Injectable(as: WeatherRepository)
class WeatherRepositoryImpl implements WeatherRepository {
  WeatherRepositoryImpl({
    required this.remoteDataSource,
  });

  final WeatherRemoteDataSource remoteDataSource;

  @override
  Future<ApiResult<WeatherInfoEntity>> getWeatherDataByCoordinates(
       WeatherByCoordinatesRequest
          weatherByCoordinatesRequestModel) async {
    final ApiResult<WeatherInfoResponseModel> _result =
        await remoteDataSource.getWeatherDataByCoordinates(weatherByCoordinatesRequestModel);
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
}
