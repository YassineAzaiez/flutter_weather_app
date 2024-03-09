import 'dart:convert';

import 'package:intl/intl.dart';

extension ExtensionsOnString on String {


  bool isEqual(String? value) {
    return toLowerCase() == value?.toLowerCase();
  }
}

extension ExtensionsOnDouble on double? {
  String? toWindSpeed() {
    if (this != null) {
      return '${toString()}km/h';
    }
    return null;
  }

  String? toCelsius() {
    if (this != null) {
      final NumberFormat numberFormat = NumberFormat('###.##', 'en_US');
      final double value = this! - 273.15;
      return '${numberFormat.format(value)}°';
    }
    return null;
  }
}

extension ExtensionsOnInt on int? {
  String? toKM() {
    if (this != null) {
      return '${(this! / 1000).round()}Km';
    }
    return null;
  }
}

extension ExtensionsOnNullableInt on int? {
  String? fromTimestampToDate() {
    if (this != null) {
      final DateTime _date = DateTime.fromMillisecondsSinceEpoch(this! * 1000);
      return DateFormat('dd-MM-yyyy').format(_date);
    }
    return null;
  }

  String? fromTimestampToTime() {
    if (this != null) {
      final DateTime _date = DateTime.fromMillisecondsSinceEpoch(this! * 1000);
      return DateFormat.Hms().format(_date);
    }
    return null;
  }
}


