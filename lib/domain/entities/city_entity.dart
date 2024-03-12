
import 'package:freezed_annotation/freezed_annotation.dart';

part 'city_entity.g.dart';

@JsonSerializable()
class CityEntity {
  CityEntity(this.lat, this.lon, this.cityName);

  factory CityEntity.fromJson(Map<String, dynamic> json) =>
      _$CityEntityFromJson(json);

  Map<String, dynamic> toJson() => _$CityEntityToJson(this);

  final String lat;
  final String lon;
  final String cityName;
}
