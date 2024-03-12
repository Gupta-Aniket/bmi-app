import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'reusable_card_data.dart';
import 'reusable_card.dart';
import 'constants.dart';
import 'reusableButton.dart';

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
  int height = 180;
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
              cardChild: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  const Text(
                    "HEIGHT",
                    style: kDisplayStyle,
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    crossAxisAlignment: CrossAxisAlignment.baseline,
                    textBaseline: TextBaseline.alphabetic,
                    children: [
                      ReuseableButton(
                        icon: FontAwesomeIcons.minus,
                        onPress: () {
                          setState(() {
                            height--;
                          });
                        },
                      ),
                      SizedBox(
                        width: 40.0,
                      ),
                      Text(
                        height.toString(),
                        style: kNumberStyle,
                      ),
                      const Text(
                        " cm",
                        style: kDisplayStyle,
                      ),
                      SizedBox(
                        width: 20.0,
                      ),
                      ReuseableButton(
                        icon: FontAwesomeIcons.plus,
                        onPress: () {
                          setState(() {
                            height++;
                          });
                        },
                      ),
                    ],
                  ),
                  SliderTheme(
                    data: SliderTheme.of(context).copyWith(
                      activeTrackColor: Colors.white70,
                      thumbColor: kBottomCalcColor,
                      overlayColor: Color(0x29EB1555),
                      thumbShape:
                          RoundSliderThumbShape(enabledThumbRadius: 15.0),
                      overlayShape:
                          RoundSliderOverlayShape(overlayRadius: 30.0),
                      trackHeight: 2.0,
                    ),
                    child: Slider(
                        value: height.toDouble(),
                        min: 100,
                        max: 300,
                        // activeColor: kBottomCalcColor,
                        onChanged: (double newHeight) {
                          setState(() {
                            height = newHeight.round();
                          });
                        }),
                  ),
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
