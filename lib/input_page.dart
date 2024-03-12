import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'reusable_card_data.dart';
import 'reusable_card.dart';
import 'constants.dart';

//enums follow the Class naming convention, and they cannot be declared inside a class.
enum Genders {
  noGender,
  male,
  female,
}

class InputPage extends StatefulWidget {
  @override
  _InputPageState createState() => _InputPageState();
}

class _InputPageState extends State<InputPage> {
  // no gender as i am unable to make it empty or null variable.
  Genders selectedGender = Genders.noGender;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("BMI CALCULATOR"),
        centerTitle: true,
      ),
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: [
          Expanded(
            child: Row(
              children: [
                Expanded(
                  child: ReusableCard(
                    onPress: () {
                      setState(() {
                        selectedGender = Genders.male;
                      });
                    },
                    cardBGColor: selectedGender == Genders.male
                        ? kActiveCardColor
                        : kInactiveCardColor,
                    cardChild: reuseableCardData(
                      displayIcon: FontAwesomeIcons.mars,
                      displayText: "MALE",
                    ),
                  ),
                ),
                Expanded(
                  child: ReusableCard(
                    onPress: () {
                      setState(() {
                        selectedGender = Genders.female;
                      });
                    },
                    cardBGColor: selectedGender == Genders.female
                        ? kActiveCardColor
                        : kInactiveCardColor,
                    cardChild: reuseableCardData(
                      displayIcon: FontAwesomeIcons.venus,
                      displayText: "FEMALE",
                    ),
                  ),
                ),
              ],
            ),
          ),
          Expanded(
            child: ReusableCard(
              cardBGColor: kActiveCardColor,
              cardChild: const Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Text(
                    "HEIGHT",
                    style: kDisplayStyle,
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    crossAxisAlignment: CrossAxisAlignment.baseline,
                    textBaseline: TextBaseline.alphabetic,
                    children: [
                      Text(
                        "100",
                        style: kNumberStyle,
                      ),
                      Text(
                        "cm",
                        style: kDisplayStyle,
                      ),
                    ],
                  )
                ],
              ),
            ),
          ),
          Expanded(
            child: Row(
              children: [
                Expanded(
                  child: ReusableCard(cardBGColor: kActiveCardColor),
                ),
                Expanded(
                  child: ReusableCard(cardBGColor: kActiveCardColor),
                ),
              ],
            ),
          ),
          Container(
            decoration: BoxDecoration(
              color: kBottomCalcColor,
              borderRadius: BorderRadius.circular(10),
            ),
            margin: EdgeInsets.only(top: 10.0),
            height: kBottomCalcHeight,
            width: double.infinity,
          ),
        ],
      ),
    );
  }
}
