import 'package:flutter/material.dart';
import 'package:musicplayer/models/car_mode_radio_model.dart';

class CarModeRadio extends StatefulWidget {
  final CarModeRadioModel carModeRadioModel;

  const CarModeRadio(this.carModeRadioModel);

  @override
  _CarModeRadioState createState() => _CarModeRadioState();
}

class _CarModeRadioState extends State<CarModeRadio> {
  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.symmetric(horizontal: 6),
      height: 35,
      width: 110,
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(30),
        color: widget.carModeRadioModel.isSelected
            ? Colors.white
            : Colors.white.withOpacity(0.2),
      ),
      child: Center(
        child: Text(
          widget.carModeRadioModel.text!,
          style: TextStyle(
              color: widget.carModeRadioModel.isSelected
                  ? Colors.black
                  : Colors.white),
        ),
      ),
    );
  }
}
