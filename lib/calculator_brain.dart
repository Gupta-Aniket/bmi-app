import 'package:flutter/material.dart';

class CalculateBmi {
  final int height;
  final int weight;
  late double _bmi;
  CalculateBmi({required this.height, required this.weight}) {
    _bmi = (weight * 10000) / (height * height);
  }
//something has happened by mistake, bmi found out to be 70, but the slider only goes till 50. it is good!

  double bmi() {
    if (_bmi > 50) _bmi = 50;
    if (_bmi < 10) _bmi = 10;
    return _bmi;
  }

  String bmiString() {
    return _bmi.toStringAsFixed(1);
  }

  Text getBMICategory() {
    String? bodyIndex = _bmi.toStringAsFixed(1);
    if (_bmi < 18.5) {
      return Text(
        textAlign: TextAlign.center,
        bodyIndex + ' \nUnderweight',
        style: TextStyle(
          color: Colors.red,
          fontSize: 24.0,
          fontWeight: FontWeight.bold,
        ),
      );
    } else if (_bmi >= 18.5 && _bmi < 25.0) {
      return Text(
        textAlign: TextAlign.center,
        bodyIndex + ' \nNormal',
        style: TextStyle(
          color: Colors.green,
          fontSize: 24.0,
          fontWeight: FontWeight.bold,
        ),
      );
    } else if (_bmi >= 25.0 && _bmi < 30.0) {
      return Text(
        textAlign: TextAlign.center,
        bodyIndex + ' \nOverweight',
        style: TextStyle(
          color: Colors.red,
          fontSize: 24.0,
          fontWeight: FontWeight.bold,
        ),
      );
    } else {
      return Text(
        textAlign: TextAlign.center,
        bodyIndex + ' \nObese',
        style: TextStyle(
          color: Colors.red,
          fontSize: 24.0,
          fontWeight: FontWeight.bold,
        ),
      );
    }
  }

  String bmiCategory() {
    if (_bmi > 30)
      return "Obese";
    else if (_bmi > 24)
      return "Over-Weight";
    else if (_bmi > 18)
      return "Normal";
    else
      return "Under-Weight";
  }

  Color bmiColor() {
    if (_bmi > 30)
      return Colors.red;
    else if (_bmi > 24)
      return Colors.orangeAccent;
    else if (_bmi > 18)
      return Colors.green;
    else
      return Colors.yellowAccent;
  }
}
