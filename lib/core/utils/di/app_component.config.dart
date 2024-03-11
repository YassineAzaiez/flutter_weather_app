// GENERATED CODE - DO NOT MODIFY BY HAND

// **************************************************************************
// InjectableConfigGenerator
// **************************************************************************

// ignore_for_file: type=lint
// coverage:ignore-file

// ignore_for_file: no_leading_underscores_for_library_prefixes
import 'package:get_it/get_it.dart' as _i1;
import 'package:injectable/injectable.dart' as _i2;
import 'package:weath_app/core/utils/networkHelper/api_helper.dart' as _i3;
import 'package:weath_app/data/data_source/weather_remote_datasource.dart'
    as _i4;
import 'package:weath_app/data/data_source/weather_remote_datasource_impl.dart'
    as _i5;
import 'package:weath_app/data/repositories/weather_repository_impl.dart'
    as _i7;
import 'package:weath_app/domain/repositories/weather_repository.dart' as _i6;
import 'package:weath_app/presentation/weather_app_view_model.dart' as _i8;

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
    gh.factory<_i3.RemoteApi>(() => _i3.RemoteApi());
    gh.factory<_i3.ApiHelper>(() => _i3.ApiHelper(gh<_i3.RemoteApi>()));
    gh.factory<_i4.WeatherRemoteDataSource>(
        () => _i5.WeatherRemoteDataSourceImpl(gh<_i3.ApiHelper>()));
    gh.factory<_i6.WeatherRepository>(() => _i7.WeatherRepositoryImpl(
        remoteDataSource: gh<_i4.WeatherRemoteDataSource>()));
    gh.factory<_i8.WeatherAppViewModel>(
        () => _i8.WeatherAppViewModel(gh<_i6.WeatherRepository>()));
    return this;
  }
}
