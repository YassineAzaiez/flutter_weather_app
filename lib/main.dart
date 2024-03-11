import 'package:flutter/material.dart';
import 'package:weath_app/core/utils/di/app_component.dart';
import 'package:weath_app/core/utils/routing_config/auto_router.dart';
import 'package:provider/provider.dart';
import 'package:flutter_localizations/flutter_localizations.dart';
import 'package:weath_app/l10n/support_locale.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';

import 'generated/l10n.dart';
import 'presentation/weather_app_view_model.dart';
void main() async{
  WidgetsFlutterBinding.ensureInitialized();
  await initAppComponentLocator();
  runApp(const MyApp());
}

class MyApp extends StatefulWidget {
  const MyApp({super.key});

  @override
  State<MyApp> createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {

  final AppRouter _appRouter = AppRouter();

  @override
  Widget build(BuildContext context) {
    return MultiProvider(
      providers: [
        ChangeNotifierProvider<WeatherAppViewModel>(
          create: (BuildContext context) => locator<WeatherAppViewModel>(),
        ),
      ],
      child: MaterialApp.router(
        localizationsDelegates: const [
          S.delegate, // Add this line
          GlobalMaterialLocalizations.delegate,
          GlobalWidgetsLocalizations.delegate,
          GlobalCupertinoLocalizations.delegate,
        ],
        supportedLocales: L10n.support,
        routerConfig: _appRouter.config(),
        debugShowCheckedModeBanner: false,
      ),
    );
  }
}

