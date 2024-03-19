import 'package:flutter/material.dart';
import 'result_page.dart';
import 'constants.dart';

class BottomCalculateButton extends StatelessWidget {
  VoidCallback onTap;
  String innerText;

  BottomCalculateButton({required this.onTap, required this.innerText});
  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: Container(
        decoration: BoxDecoration(
          color: kBottomCalcColor,
          borderRadius: BorderRadius.circular(10),
        ),
        margin: const EdgeInsets.only(top: 10.0),
        height: kBottomCalcHeight,
        width: double.infinity,
        child: Center(
          child: Text(
            innerText,
            style: kBottomCalculateButtonTextStyle,
          ),
        ),
      ),
    );
  }
}
