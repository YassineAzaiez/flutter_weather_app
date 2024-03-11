import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:weath_app/core/utils/networkHelper/api_result_model.dart';
import 'package:weath_app/core/utils/networkHelper/error.dart';
import 'package:weath_app/domain/entities/weather_info_entity.dart';
import 'package:weath_app/domain/requestes/weather_by_coordinates_request.dart';
import 'package:weath_app/presentation/weather_app_view_model.dart';
import 'package:weath_app/generated/l10n.dart';
import 'package:weath_app/presentation/widgets/weather_info_details_widget.dart';
import 'package:weath_app/presentation/widgets/weather_info_widget.dart';

@RoutePage()
class WeatherDetailsView extends StatefulWidget {
  const WeatherDetailsView({super.key, this.lat, this.lon});

  final double? lat;
  final double? lon;

  @override
  State<WeatherDetailsView> createState() => _WeatherDetailsViewState();
}

class _WeatherDetailsViewState extends State<WeatherDetailsView> {
  WeatherInfoEntity? _result;
  bool _isLoading = true;
  @override
  Widget build(BuildContext context) {
    return Consumer<WeatherAppViewModel>(
      builder:
          (BuildContext context, WeatherAppViewModel value, Widget? child) =>
              SafeArea(
        child: Scaffold(
          floatingActionButton:  FloatingActionButton(
              elevation: 0.0,
              child:  const Icon(
                Icons.add,
                color:  Colors.black87,
              ),

              onPressed: (){}
          ),
          appBar: AppBar(
            centerTitle: true,
            title: Text(S.of(context).weather_details),
          ),
          body: Stack(
            children: [
              _isLoading == true ?
            AnimatedOpacity(
            opacity: 1,
            duration: const Duration(milliseconds: 200),
            child: Expanded(
              child: Container(
                color: Colors.transparent,
                child: Center(
                  child: Container(
                    decoration: const BoxDecoration(
                      shape: BoxShape.circle,
                    ),
                    padding: const EdgeInsets.all(
                      15,
                    ),
                    width: 70,
                    height: 70,
                    child: const CircularProgressIndicator(),
                  ),
                ),
              ),
            ),
          )

             :  Column(
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  Padding(
                    padding: const EdgeInsets.only(top: 40.0),
                    child: ListTile(
                      title: Center(
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: <Widget>[
                            const Icon(
                              Icons.location_on,
                              color:  Colors.black87,
                            ),
                            const SizedBox(
                              width: 10.0,
                            ),
                            Text(
                             _result?.name ?? '',
                             style:  const TextStyle(
                                fontSize: 30.0,
                                color: Colors.black87,
                              ),
                            ),
                          ],
                        ),
                      ),
                      subtitle: const Center(
                        child: Text(
                          'Today',
                          style:  TextStyle(
                            color: Colors.black87,
                            fontSize: 20.0,
                          ),
                        ),
                      ),
                    ),
                  ),
                  const SizedBox(height: 16,),
                  Center(
                    child: Column(children: [
                      Image.asset(
                        'assets/${_result?.weather?.first?.icon}.png',
                        color: Colors.black87,
                        scale: 1.5,

                      ),
                      Text(
                        '${_result?.weather?.first?.description}',
                        style: const TextStyle(
                          fontSize: 40,
                          color: Colors.black87,
                        ),
                      ),


                    ],),
                  ),
                  const SizedBox(
                    height: 16
                  ),
                  Row(
                    crossAxisAlignment: CrossAxisAlignment.center,
                    mainAxisAlignment: MainAxisAlignment.spaceAround,
                    children: <Widget>[
                      WeatherDetailsBoxWidget(
                        widget: Column(
                          mainAxisAlignment: MainAxisAlignment.start,
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: <Widget>[
                            WeatherInfoItemWidget(
                              label: 'Sunset',
                              value: _result?.sys?.sunset,
                            ),
                            WeatherInfoItemWidget(
                              label: 'Sunrise',
                              value: _result?.sys?.sunrise,
                            ),
                          ],
                        ),
                        icon: 'assets/sunset_icon.svg',
                        title: 'Sunset & Sunrise',
                      ),
                      WeatherDetailsBoxWidget(
                        widgetPadding: const EdgeInsets.symmetric(
                          horizontal: 20,
                          vertical: 15,
                        ),
                        widget: Column(
                          mainAxisAlignment: MainAxisAlignment.start,
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: <Widget>[
                            WeatherInfoItemWidget(
                              label: 'Speed',
                              value: _result?.wind?.speed,
                            ),
                            WeatherInfoItemWidget(
                              label: 'Degree',
                              value: _result?.wind?.deg.toString(),
                            ),
                          ],
                        ),
                        icon: 'assets/wind_icon.svg',
                        title: 'Wind info',
                      ),
                    ],
                  ),
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }

  void _listenToWeatherDetails(WeatherAppViewModel provider) {
    provider.weatherResult.stream.listen(
          (ApiResult<WeatherInfoEntity> result) {
        result.when(
          success: (WeatherInfoEntity data) {
            if (mounted) {
              setState(() {
                _result = data;
                _isLoading = false;
              });
            }
          },
          error: (Failure error) {

          },
        );
      },
    );

  }

  @override
  void initState() {
    super.initState();
    final WeatherAppViewModel provider =
        Provider.of<WeatherAppViewModel>(context, listen: false);
    _listenToWeatherDetails(provider);
    provider.getWeatherByCoordinates(WeatherByCoordinatesRequest(
        lat: widget.lat ?? 48.86, lon: widget.lon ?? 2.35));
  }
}
