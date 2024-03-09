import 'package:json_annotation/json_annotation.dart';
import 'package:weath_app/core/utils/extensions/extension_functions.dart';
import 'package:weath_app/core/utils/mapper/data_mapper.dart';
import 'package:weath_app/domain/entities/sunset_sunrise_entity.dart';

part 'sunset_sunrise_response_model.g.dart';

@JsonSerializable()
class SunsetSunriseResponseModel extends DataMapper<SunsetSunriseEntity> {
  SunsetSunriseResponseModel({
    this.type,
    this.id,
    this.country,
    this.sunrise,
    this.sunset,
  });

  factory SunsetSunriseResponseModel.fromJson(Map<String, dynamic> json) =>
      _$SunsetSunriseResponseModelFromJson(json);
  final int? type;
  final int? id;
  final String? country;
  final int? sunrise;
  final int? sunset;


  @override
  SunsetSunriseEntity mapToEntity() {
    return SunsetSunriseEntity(
      sunrise: sunrise?.fromTimestampToTime(),
      type: type ?? 0,
      id: id ?? 0,
      country: country ?? '',
      sunset: sunset?.fromTimestampToTime(),
    );
  }
}
