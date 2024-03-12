// GENERATED CODE - DO NOT MODIFY BY HAND

// **************************************************************************
// AutoRouterGenerator
// **************************************************************************

// ignore_for_file: type=lint
// coverage:ignore-file

// ignore_for_file: no_leading_underscores_for_library_prefixes
import 'package:auto_route/auto_route.dart' as _i3;
import 'package:flutter/material.dart' as _i4;
import 'package:weath_app/presentation/views/add_city/add_new_city_view.dart'
    as _i1;
import 'package:weath_app/presentation/views/weather_details/weather_details_view.dart'
    as _i2;

abstract class $AppRouter extends _i3.RootStackRouter {
  $AppRouter({super.navigatorKey});

  @override
  final Map<String, _i3.PageFactory> pagesMap = {
    AddCityView.name: (routeData) {
      return _i3.AutoRoutePage<dynamic>(
        routeData: routeData,
        child: const _i1.AddCityView(),
      );
    },
    WeatherDetailsView.name: (routeData) {
      final args = routeData.argsAs<WeatherDetailsViewArgs>(
          orElse: () => const WeatherDetailsViewArgs());
      return _i3.AutoRoutePage<dynamic>(
        routeData: routeData,
        child: _i2.WeatherDetailsView(
          key: args.key,
          lat: args.lat,
          lon: args.lon,
        ),
      );
    },
  };
}

/// generated route for
/// [_i1.AddCityView]
class AddCityView extends _i3.PageRouteInfo<void> {
  const AddCityView({List<_i3.PageRouteInfo>? children})
      : super(
          AddCityView.name,
          initialChildren: children,
        );

  static const String name = 'AddCityView';

  static const _i3.PageInfo<void> page = _i3.PageInfo<void>(name);
}

/// generated route for
/// [_i2.WeatherDetailsView]
class WeatherDetailsView extends _i3.PageRouteInfo<WeatherDetailsViewArgs> {
  WeatherDetailsView({
    _i4.Key? key,
    double? lat,
    double? lon,
    List<_i3.PageRouteInfo>? children,
  }) : super(
          WeatherDetailsView.name,
          args: WeatherDetailsViewArgs(
            key: key,
            lat: lat,
            lon: lon,
          ),
          initialChildren: children,
        );

  static const String name = 'WeatherDetailsView';

  static const _i3.PageInfo<WeatherDetailsViewArgs> page =
      _i3.PageInfo<WeatherDetailsViewArgs>(name);
}

class WeatherDetailsViewArgs {
  const WeatherDetailsViewArgs({
    this.key,
    this.lat,
    this.lon,
  });

  final _i4.Key? key;

  final double? lat;

  final double? lon;

  @override
  String toString() {
    return 'WeatherDetailsViewArgs{key: $key, lat: $lat, lon: $lon}';
  }
}
