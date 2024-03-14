import 'package:flutter/material.dart';
import 'constants.dart';

class ReuseableButton extends StatelessWidget {
  final IconData icon;
  final VoidCallback onPress;
  ReuseableButton({required this.icon, required this.onPress});

  @override
  Widget build(BuildContext context) {
    return Center(
      child: FloatingActionButton(
        onPressed: onPress,
        foregroundColor: Color(0xAAEB1555),
        backgroundColor: kInactiveCardColor,
        shape: CircleBorder(),
        child: Icon(icon),
      ),
    );
  }
}
