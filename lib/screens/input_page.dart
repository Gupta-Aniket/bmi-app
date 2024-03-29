import 'package:bmi_app/screens/result_page.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import '../components/reusable_card_data.dart';
import 'package:bmi_app/components/reusable_card.dart';
import 'package:bmi_app/constants.dart';
import 'package:bmi_app/components/reusableButton.dart';
import 'package:bmi_app/components/reusable_bottom_calculate_button.dart';
//enums follow the Class naming convention, and they cannot be declared inside a class.

enum Genders {
  male,
  female,
  noGender,
}

class InputPage extends StatefulWidget {
  @override
  _InputPageState createState() => _InputPageState();
}

class _InputPageState extends State<InputPage> {
  // no gender as i am unable to make it empty or null variable.
  Genders selectedGender = Genders.noGender;
  int age = 20, weight = 70, height = 180;
  int increment(int n) {
    return n + 1;
  }

  int decrement(int n) {
    return n - 1;
  }

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
                ), // Male
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
                ), // Female
              ],
            ),
          ), //Gender Selection
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
                            if (height > 101) height = decrement(height);
                          });
                        },
                      ),
                      const SizedBox(
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
                      const SizedBox(
                        width: 20.0,
                      ),
                      ReuseableButton(
                        icon: FontAwesomeIcons.plus,
                        onPress: () {
                          setState(() {
                            if (height < 299) height = increment(height);
                          });
                        },
                      ),
                    ],
                  ),
                  SliderTheme(
                    data: SliderTheme.of(context).copyWith(
                      activeTrackColor: Colors.white70,
                      thumbColor: kBottomCalcColor,
                      overlayColor: const Color(0x29EB1555),
                      thumbShape:
                          const RoundSliderThumbShape(enabledThumbRadius: 15.0),
                      overlayShape:
                          const RoundSliderOverlayShape(overlayRadius: 30.0),
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
          ), //Height
          Expanded(
            child: Row(
              children: [
                Expanded(
                  child: ReusableCard(
                    cardBGColor: kActiveCardColor,
                    cardChild: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        const Text(
                          "WEIGHT",
                          style: kDisplayStyle,
                        ),
                        Text(
                          weight.toString(),
                          style: kNumberStyle,
                        ),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            ReuseableButton(
                                icon: FontAwesomeIcons.minus,
                                onPress: () {
                                  setState(() {
                                    if (weight >= 1) weight = decrement(weight);
                                  });
                                }),
                            const SizedBox(
                              width: 20,
                            ),
                            ReuseableButton(
                              icon: FontAwesomeIcons.plus,
                              onPress: () {
                                setState(() {
                                  weight = increment(weight);
                                });
                              },
                            ),
                          ],
                        ),
                      ],
                    ),
                  ),
                ), // Weight
                Expanded(
                  child: ReusableCard(
                    cardBGColor: kActiveCardColor,
                    cardChild: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        const Text(
                          "AGE",
                          style: kDisplayStyle,
                        ),
                        Text(
                          age.toString(),
                          style: kNumberStyle,
                        ),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            ReuseableButton(
                                icon: FontAwesomeIcons.minus,
                                onPress: () {
                                  setState(() {
                                    if (age > 1 && age < 100)
                                      age = decrement(age);
                                  });
                                }),
                            const SizedBox(
                              width: 20,
                            ),
                            ReuseableButton(
                              icon: FontAwesomeIcons.plus,
                              onPress: () {
                                setState(() {
                                  if (age > 0 && age < 99) age = increment(age);
                                });
                              },
                            ),
                          ],
                        ),
                      ],
                    ),
                  ),
                ), //Age
              ],
            ),
          ), // Weight and Age
          BottomCalculateButton(
            onTap: () {
              if (selectedGender == Genders.noGender) {
                showDialog(
                  context: context,
                  builder: (BuildContext context) {
                    return AlertDialog(
                      title: const Text('Choose Gender'),
                      content:
                          const Text('Please Select a Gender to continue!'),
                      actions: <Widget>[
                        TextButton(
                          onPressed: () {
                            Navigator.of(context).pop(); // Close the dialog
                          },
                          child: const Text('Close'),
                        ),
                      ],
                    );
                  },
                );
              } else {
                Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (context) {
                      return ResultPage(
                        height: height,
                        weight: weight,
                        gender: selectedGender.toString(),
                      );
                    },
                  ),
                );
              }
            },
            innerText: "Calculate your BMI",
          ),
        ],
      ),
    );
  }
}
