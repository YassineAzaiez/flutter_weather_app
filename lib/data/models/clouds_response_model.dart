import 'package:json_annotation/json_annotation.dart';
import 'package:weath_app/core/utils/mapper/data_mapper.dart';
import 'package:weath_app/domain/entities/clouds_entity.dart';

part 'clouds_response_model.g.dart';

@JsonSerializable()
class CloudsResponseModel extends DataMapper<CloudsEntity> {
  CloudsResponseModel({
    this.all,
  });

  factory CloudsResponseModel.fromJson(Map<String, dynamic> json) =>
      _$CloudsResponseModelFromJson(json);

  final int? all;

  @override
  CloudsEntity mapToEntity() {
    return CloudsEntity(
      all: all ?? 0,
    );
  }
}
