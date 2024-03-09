import 'package:json_annotation/json_annotation.dart';
import 'package:weath_app/core/utils/extensions/extension_functions.dart';
import 'package:weath_app/core/utils/mapper/data_mapper.dart';
import 'package:weath_app/domain/entities/wind_info_entity.dart';

part 'wind_info_response_model.g.dart';

@JsonSerializable()
class WindInfoResponseModel extends DataMapper<WindInfoEntity> {
  WindInfoResponseModel({
    this.speed,
    this.deg,
  });

  factory WindInfoResponseModel.fromJson(Map<String, dynamic> json) =>
      _$WindInfoResponseModelFromJson(json);
  final double? speed;
  final int? deg;


  @override
  WindInfoEntity mapToEntity() {
    return WindInfoEntity(
      deg: deg ?? 0,
      speed: speed?.toWindSpeed() ?? '',
    );
  }
}
