import 'package:auto_route/auto_route.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:provider/provider.dart';
import 'package:weath_app/core/utils/networkHelper/api_result_model.dart';
import 'package:weath_app/core/utils/networkHelper/error.dart';
import 'package:weath_app/core/values/colors.dart';
import 'package:weath_app/domain/entities/city_entity.dart';
import 'package:weath_app/generated/l10n.dart';
import 'package:weath_app/presentation/views/add_city/add_city_view_model.dart';
import 'package:weath_app/presentation/widgets/weather_app_text_field.dart';

@RoutePage()
class AddCityView extends StatefulWidget {
  const AddCityView({super.key});

  @override
  State<AddCityView> createState() => _AddCityViewState();
}

class _AddCityViewState extends State<AddCityView> {
  List<CityEntity> _result = <CityEntity>[];

  void _listenTOAddCity(AddCityViewModel provider) {
    provider.saveCityResult.stream.listen((event) {
      event.when(
          success: (bool isSuccess) async {
            if (mounted && isSuccess) {
              await provider.getSavesCitiesList();
            }
          },
          error: (error) {});
    });
  }

  void _listenToWeatherDetails(AddCityViewModel provider) {
    provider.citiesListResult.stream.listen(
      (ApiResult<List<CityEntity>> result) {
        result.when(
          success: (List<CityEntity> data) {
            if (mounted) {
              setState(() {
                _result = data;
              });
            }
          },
          error: (Failure error) {
            // TODO add snack bar for error cases
          },
        );
      },
    );
  }

  @override
  Widget build(BuildContext context) {
    return Consumer<AddCityViewModel>(
      builder: (BuildContext context, AddCityViewModel provider, Widget? child) =>
          SafeArea(
              child: Scaffold(
        appBar: AppBar(
          title: Text(S.of(context).weather_add_new_city_title),
          centerTitle: true,
          leading: Row(
            crossAxisAlignment: CrossAxisAlignment.center,
            mainAxisAlignment: MainAxisAlignment.start,
            mainAxisSize: MainAxisSize.min,
            children: <Widget>[
              IconButton(
                onPressed: () {
                  Navigator.of(context).pop();
                },
                icon: Icon(
                  Icons.arrow_back,
                  color: ColorName.blue203C6F,
                ),
              ),
            ],
          ),
        ),
        body: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 20),
          child: Column(
            children: [
              Column(
                children: [
                  WeatherAppTextFieldWidget(
                      onValueChanged: (value) {
                        provider.lat = value;
                      },
                      inputType: TextInputType.number,
                      lablel: S.current.city_latitude),
                  const SizedBox(
                    height: 16,
                  ),
                  WeatherAppTextFieldWidget(
                      onValueChanged: (value) {
                        provider.long = value;
                      },
                      inputType: TextInputType.number,
                      lablel: S.current.city_longitude),
                  const SizedBox(
                    height: 16,
                  ),
                  WeatherAppTextFieldWidget(
                    onValueChanged: (value) {
                      provider.cityName = value;
                    },
                    lablel: S.current.city_name,
                    inputType: TextInputType.text,
                  ),
                  const SizedBox(
                    height: 16,
                  ),
                  SizedBox(
                    width: double.infinity,
                    child: OutlinedButton(
                      style: TextButton.styleFrom(
                          foregroundColor: Colors.blue,
                          textStyle: const TextStyle(fontSize: 18)),
                      onPressed: () {
                        provider.submitForm();
                      },
                      child: Text(S.current.add_new_city),
                    ),
                  ),
                  const SizedBox(
                    height: 16,
                  ),
                ],
              )
            ],
          ),
        ),
      )),
    );
  }

  @override
  void initState()  {
    final AddCityViewModel provider =
        Provider.of<AddCityViewModel>(context, listen: false);
    _listenToWeatherDetails(provider);
    _listenTOAddCity(provider);

     provider.getSavesCitiesList();
    super.initState();
  }
}
