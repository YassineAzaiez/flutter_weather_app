import 'package:flutter/material.dart';


class WeatherInfoItemWidget extends StatelessWidget {
  const WeatherInfoItemWidget({
    required this.label,
    required this.value,
    Key? key,
  }) : super(key: key);
  final String? label;
  final String? value;

  @override
  Widget build(BuildContext context) {
    return  RichText(
        textAlign: TextAlign.center,
        text: TextSpan(
          text: '$label: ',
          style: const TextStyle(
            color: Colors.black87,
            fontSize: 15,
          ),
          children: <TextSpan>[
            TextSpan(
              text: value ?? '',
              style: const TextStyle(
                color: Colors.black87,
                fontSize: 13,
              ),
            ),
          ],
        ),
      );

  }
}
