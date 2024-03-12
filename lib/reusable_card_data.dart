import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'constants.dart';

class reuseableCardData extends StatelessWidget {
  IconData displayIcon = FontAwesomeIcons.mars;
  String displayText = " ";

  reuseableCardData({required this.displayIcon, this.displayText = ""});

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Icon(
          displayIcon,
          size: 80.0,
        ),
        const SizedBox(
          height: 15.0,
        ),
        Text(
          displayText,
          style: kDisplayStyle,
        ),
      ],
    );
  }
}
