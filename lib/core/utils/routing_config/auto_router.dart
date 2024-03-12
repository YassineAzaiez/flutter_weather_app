import 'package:auto_route/auto_route.dart';

import 'auto_router.gr.dart';


@AutoRouterConfig()
class AppRouter extends $AppRouter {
  @override
  List<AutoRoute> get routes => <AutoRoute>[
            AutoRoute(page: WeatherDetailsView.page, initial: true),
            AutoRoute(page: AddCityView.page),
      ];
}
