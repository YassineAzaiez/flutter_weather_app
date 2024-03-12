// GENERATED CODE - DO NOT MODIFY BY HAND

// **************************************************************************
// InjectableConfigGenerator
// **************************************************************************

// ignore_for_file: type=lint
// coverage:ignore-file

// ignore_for_file: no_leading_underscores_for_library_prefixes
import 'package:get_it/get_it.dart' as _i1;
import 'package:injectable/injectable.dart' as _i2;
import 'package:weath_app/core/utils/networkHelper/api_helper.dart' as _i4;
import 'package:weath_app/core/utils/shared_preference/weather_app_secure_storage.dart'
    as _i3;
import 'package:weath_app/data/data_source/weather_remote_datasource.dart'
    as _i5;
import 'package:weath_app/data/data_source/weather_remote_datasource_impl.dart'
    as _i6;
import 'package:weath_app/data/repositories/weather_repository_impl.dart'
    as _i8;
import 'package:weath_app/domain/repositories/weather_repository.dart' as _i7;
import 'package:weath_app/presentation/views/add_city/add_city_view_model.dart'
    as _i9;
import 'package:weath_app/presentation/views/weather_details/weather_app_view_model.dart'
    as _i10;

extension GetItInjectableX on _i1.GetIt {
// initializes the registration of main-scope dependencies inside of GetIt
  _i1.GetIt init({
    String? environment,
    _i2.EnvironmentFilter? environmentFilter,
  }) {
    final gh = _i2.GetItHelper(
      this,
      environment,
      environmentFilter,
    );
    gh.lazySingleton<_i3.FlutterSecureStorageProvider>(
        () => _i3.FlutterSecureStorageProvider());
    gh.factory<_i4.RemoteApi>(() => _i4.RemoteApi());
    gh.lazySingleton<_i3.WeatherAppSecureStorage>(() =>
        _i3.WeatherAppSecureStorage(gh<_i3.FlutterSecureStorageProvider>()));
    gh.factory<_i4.ApiHelper>(() => _i4.ApiHelper(gh<_i4.RemoteApi>()));
    gh.factory<_i5.WeatherRemoteDataSource>(
        () => _i6.WeatherRemoteDataSourceImpl(gh<_i4.ApiHelper>()));
    gh.factory<_i7.WeatherRepository>(() => _i8.WeatherRepositoryImpl(
          weatherAppSecureStorage: gh<_i3.WeatherAppSecureStorage>(),
          remoteDataSource: gh<_i5.WeatherRemoteDataSource>(),
        ));
    gh.factory<_i9.AddCityViewModel>(
        () => _i9.AddCityViewModel(gh<_i7.WeatherRepository>()));
    gh.factory<_i10.WeatherAppViewModel>(
        () => _i10.WeatherAppViewModel(gh<_i7.WeatherRepository>()));
    return this;
  }
}
