
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:weath_app/core/values/colors.dart';

class WeatherAppTextFieldWidget extends StatefulWidget {
  const WeatherAppTextFieldWidget({
    required this.onValueChanged,
    required this.lablel,
    super.key, required this.inputType,
  });

  final Function(String) onValueChanged;
  final String lablel;
  final TextInputType inputType;


  @override
  State<WeatherAppTextFieldWidget> createState() =>
      _WeatherAppTextFieldWidgetState();
}

class _WeatherAppTextFieldWidgetState extends State<WeatherAppTextFieldWidget> {



  @override
  void dispose() {

    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Container(
        height: 60,
        padding: const EdgeInsets.only(left: 16),
        decoration: const BoxDecoration(
          color: ColorName.grey_DADDE2,
          borderRadius: BorderRadius.all(
            Radius.circular(
              16,
            ),
          ),

        ),
        child: Center(
          child: TextFormField(
            keyboardType: widget.inputType,
            style:  const TextStyle(
              fontSize: 16,
              color: Colors.black87,
            ),
            decoration: InputDecoration(
              hintText: widget.lablel,
              hintStyle:  const TextStyle(
                fontSize: 16,
                color: ColorName.grey8B8B8B,
              ),
              enabledBorder: InputBorder.none,
              disabledBorder: InputBorder.none,
              errorBorder: InputBorder.none,
              focusedErrorBorder: InputBorder.none,
              border: InputBorder.none,
            ),
            onChanged: (String value) {
              widget.onValueChanged(value);
            },
          ),
        ),
      );
  }
}
