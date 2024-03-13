import 'package:flutter/material.dart';
import 'package:weath_app/core/values/colors.dart';

class NewCityItemWidget extends StatelessWidget {
  const NewCityItemWidget({
    required this.cityLat,
    required this.cityLong,
    required this.cityName,
    required this.onItemClicked,
    super.key,
  });

  final String cityLat;
  final String cityLong;
  final String cityName;
  final Function() onItemClicked;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onItemClicked,
      child: Container(
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(20.0),
          color: ColorName.grey_DADDE2.withOpacity(0.4),
        ),
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 16),
          child: ListTile(
            horizontalTitleGap: 8,
            contentPadding: const EdgeInsets.symmetric(vertical: 8),
            title: Text(
              cityName,
              style: const TextStyle(fontSize: 16),
              maxLines: 1,
              overflow: TextOverflow.ellipsis,
            ),
            subtitle: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: <Widget>[
                  Text(
                    cityLat,
                    style: const TextStyle(color: ColorName.grey8B8B8B, fontSize: 13),
                  ),
                  Text(
                    cityLong,
                    style: const TextStyle(color: ColorName.grey8B8B8B, fontSize: 13),
                  )
                ]),
          ),
        ),
      ),
    );
  }
}
