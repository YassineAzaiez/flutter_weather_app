// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'city_entity.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

CityEntity _$CityEntityFromJson(Map<String, dynamic> json) => CityEntity(
      json['lat'] as String,
      json['lon'] as String,
      json['cityName'] as String,
    );

Map<String, dynamic> _$CityEntityToJson(CityEntity instance) =>
    <String, dynamic>{
      'lat': instance.lat,
      'lon': instance.lon,
      'cityName': instance.cityName,
    };
