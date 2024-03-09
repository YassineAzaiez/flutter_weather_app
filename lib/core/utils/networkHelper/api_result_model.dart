import 'package:freezed_annotation/freezed_annotation.dart';

import 'error.dart';
part 'api_result_model.freezed.dart';

@freezed
class ApiResult<T> with _$ApiResult<T> {
  const factory ApiResult.success({required T data}) = Success<T>;

  const factory ApiResult.error(
      {required Failure errorResult}) = Error<T>;
}
