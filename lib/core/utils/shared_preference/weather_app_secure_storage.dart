import 'dart:convert';

import 'package:flutter_secure_storage/flutter_secure_storage.dart';
import 'package:injectable/injectable.dart';

@lazySingleton
class FlutterSecureStorageProvider {
  FlutterSecureStorage get flutterSecureStorage => const FlutterSecureStorage();
}

@lazySingleton
class WeatherAppSecureStorage {


  WeatherAppSecureStorage(this._secureStorageProvider);

  final FlutterSecureStorageProvider _secureStorageProvider;

  FlutterSecureStorage get _secureStorage => _secureStorageProvider.flutterSecureStorage;

  Future<dynamic> getField(String key) async {
    if (await _secureStorage.containsKey(key: key)) {
      final dynamic result = await _secureStorage.read(key: key);
      return result;
    } else {
      return null;
    }
  }

  Future<void> setField(String key, String value) async {
    await _secureStorage.write(key: key, value: value);
  }







}
