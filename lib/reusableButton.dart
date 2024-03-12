import 'package:flutter/material.dart';
import 'constants.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

class ReuseableButton extends StatelessWidget {
  final IconData icon;
  final VoidCallback onPress;
  ReuseableButton({required this.icon, required this.onPress});

  @override
  Widget build(BuildContext context) {
    return ElevatedButton(
      onPressed: onPress,
      style: ElevatedButton.styleFrom(
        padding: const EdgeInsets.all(20),
        foregroundColor: kBottomCalcColor,
        backgroundColor: kActiveCardColor,
      ),
      child: Icon(icon),
    );
  }
}
