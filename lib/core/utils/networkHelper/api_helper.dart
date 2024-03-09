

import 'package:dio/dio.dart';
import 'package:injectable/injectable.dart';
import 'package:weath_app/core/utils/constants/app_constants.dart';
import 'package:weath_app/core/utils/networkHelper/http_method.dart';

import 'api_result_model.dart';
import 'error.dart';



@injectable
class ApiHelper {

  ApiHelper(this._remoteApi);

   final RemoteApi _remoteApi;


  Future<ApiResult<Response>> makeRequest(

      {Map<String, dynamic>? data,
        required String endPoint,
      Map<String, dynamic>? queryParams, required HttpMethod method,
      ResponseType? responseType,
      bool noCache = false}) async {


    try {
      Response? response;
      switch (method) {
        case HttpMethod.get:
          response = await _remoteApi.dio.get(
            '$baseUrl$endPoint',
            queryParameters: queryParams,
            options: Options(
                extra: {'noCache': noCache},
                responseType: responseType ?? ResponseType.json),
          );
          break;
        case HttpMethod.post:
          response = await _remoteApi.dio.post(
            '$baseUrl$endPoint',
            data: data,
            queryParameters: queryParams,
          );
          break;
        case HttpMethod.put:
          response = await _remoteApi.dio.put(
            '$baseUrl$endPoint',
            data: data,
            queryParameters: queryParams,
          );
          break;
        case HttpMethod.delete:
          response = await _remoteApi.dio.delete(
            '$baseUrl$endPoint',
            queryParameters: queryParams,
          );
          break;
      }
      return _remoteApi.handleHttpRequest(response);
    } on DioException catch (error) {

        return ApiResult.error(errorResult: Failure(message:error.message ?? 'Something went Wrong' ));


    }
  }


}


@injectable
class RemoteApi {
  late Dio dio;


  RemoteApi() {
    dio = Dio();
  }

  ApiResult<Response> handleHttpRequest(Response response) {
    if (response.statusCode! >= 200 && response.statusCode! < 300) {
      return ApiResult<Response>.success(data: response);
    } else {
      return ApiResult<Response>.error(
        errorResult: Failure(
          message: response.statusMessage?? 'Something went Wrong',
        ),
      );
    }
  }


}
