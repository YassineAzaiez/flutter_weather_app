// GENERATED CODE - DO NOT MODIFY BY HAND

// **************************************************************************
// AutoRouterGenerator
// **************************************************************************

// ignore_for_file: type=lint
// coverage:ignore-file

// ignore_for_file: no_leading_underscores_for_library_prefixes
import 'package:auto_route/auto_route.dart' as _i2;
import 'package:flutter/material.dart' as _i3;
import 'package:weath_app/presentation/views/weather_details_view.dart' as _i1;

abstract class $AppRouter extends _i2.RootStackRouter {
  $AppRouter({super.navigatorKey});

  @override
  final Map<String, _i2.PageFactory> pagesMap = {
    WeatherDetailsView.name: (routeData) {
      final args = routeData.argsAs<WeatherDetailsViewArgs>(
          orElse: () => const WeatherDetailsViewArgs());
      return _i2.AutoRoutePage<dynamic>(
        routeData: routeData,
        child: _i1.WeatherDetailsView(
          key: args.key,
          lat: args.lat,
          lon: args.lon,
        ),
      );
    }
  };
}

/// generated route for
/// [_i1.WeatherDetailsView]
class WeatherDetailsView extends _i2.PageRouteInfo<WeatherDetailsViewArgs> {
  WeatherDetailsView({
    _i3.Key? key,
    double? lat,
    double? lon,
    List<_i2.PageRouteInfo>? children,
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

  static const _i2.PageInfo<WeatherDetailsViewArgs> page =
      _i2.PageInfo<WeatherDetailsViewArgs>(name);
}

class WeatherDetailsViewArgs {
  const WeatherDetailsViewArgs({
    this.key,
    this.lat,
    this.lon,
  });

  final _i3.Key? key;

  final double? lat;

  final double? lon;

  @override
  String toString() {
    return 'WeatherDetailsViewArgs{key: $key, lat: $lat, lon: $lon}';
  }
}
