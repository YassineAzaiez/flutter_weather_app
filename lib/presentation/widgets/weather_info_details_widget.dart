import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:weath_app/core/values/colors.dart';

class WeatherDetailsBoxWidget extends StatelessWidget {
  const WeatherDetailsBoxWidget({
    required this.widget,
    super.key,
    this.title,
    this.icon,
    this.widgetPadding,
  });
  final String? title;
  final String? icon;
  final Widget widget;
  final EdgeInsets? widgetPadding;

  @override
  Widget build(BuildContext context) {
    return Container(
        padding: widgetPadding ?? const EdgeInsets.all(15),
        decoration: BoxDecoration(
          color: ColorName.blue203C6F.withOpacity(0.2),
          borderRadius: const BorderRadius.all(
            Radius.circular(20),
          ),
        ),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: <Widget>[
            Text(
              title ?? '',
              style: const TextStyle(
                color: Colors.black87,
                fontSize: 16,
              ),
            ),
            const SizedBox(
              height: 15,
            ),
            if (icon != null)
              SvgPicture.asset(
                icon!,
                width: 60,
                color:  ColorName.blue203C6F,
              ),
            const SizedBox(
              height: 15,
            ),
            widget,
          ],
        ),
      );
  }
}
