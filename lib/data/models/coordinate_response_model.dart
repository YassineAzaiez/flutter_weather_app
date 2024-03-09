import 'package:json_annotation/json_annotation.dart';
import 'package:weath_app/core/utils/mapper/data_mapper.dart';
import 'package:weath_app/domain/entities/coordinate_entity.dart';

part 'coordinate_response_model.g.dart';

@JsonSerializable()
class CoordinateResponseModel extends DataMapper<CoordinateEntity> {
  CoordinateResponseModel({
    this.lon,
    this.lat,
  });

  factory CoordinateResponseModel.fromJson(Map<String, dynamic> json) =>
      _$CoordinateResponseModelFromJson(json);

  final double? lon;
  final double? lat;

  @override
  CoordinateEntity mapToEntity() {
    return CoordinateEntity(
      lat: lat ?? 0.0,
      lon: lon ?? 0.0,
    );
  }
}
