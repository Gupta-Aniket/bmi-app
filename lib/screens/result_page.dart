import 'package:bmi_app/constants.dart';
import 'package:flutter/material.dart';
import 'package:sleek_circular_slider/sleek_circular_slider.dart';
import 'package:bmi_app/components/reusable_bottom_calculate_button.dart';
import 'package:bmi_app/components/reusable_card.dart';
import 'package:bmi_app/calculator_brain.dart';

class ResultPage extends StatelessWidget {
  int height, weight;
  String gender;
  Image img = Image.asset(
    "assets/male.png",
  );

  ResultPage(
      {required this.height, required this.weight, required this.gender});

  Widget build(BuildContext context) {
    CalculateBmi calc = CalculateBmi(
      height: height,
      weight: weight,
    );

    if (gender == "Genders.male") {
      img = Image.asset(
        "assets/male.png",
      );
    } else {
      img = Image.asset(
        "assets/female.png",
      );
    }

    return Scaffold(
      appBar: AppBar(
        title: const Text("R E S U L T"),
        centerTitle: true,
      ),
      body: Column(
        children: [
          Expanded(
            child: ReusableCard(
              cardBGColor: kActiveCardColor,
              cardChild: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                crossAxisAlignment: CrossAxisAlignment.stretch,
                children: [
                  Center(
                    child: Text(
                      calc.bmiString(),
                      style: TextStyle(
                        fontSize: 48,
                        color: calc.bmiColor(),
                      ),
                    ),
                  ),
                  Center(
                    child: Text(
                      calc.bmiCategory(),
                      style: TextStyle(
                        fontSize: 24,
                        color: calc.bmiColor(),
                      ),
                    ),
                  ),
                  Stack(
                    alignment: Alignment.center,
                    children: [
                      SleekCircularSlider(
                        min: 10,
                        max: 50,
                        initialValue: calc.bmi(),
                        innerWidget: null,
                        appearance: CircularSliderAppearance(
                          animDurationMultiplier: 2,
                          size: 300, // Adjust the size here
                          startAngle: 135,
                          angleRange: 270,
                          customColors: CustomSliderColors(
                            dotColor: Colors.transparent,
                            hideShadow: true,
                            gradientStartAngle: 0,
                            gradientEndAngle: 180,
                            progressBarColors: [
                              Colors.red,
                              Colors.orangeAccent,
                              Colors.green,
                            ],
                            trackColor: const Color(0xff6CE5E7),
                          ),
                        ),
                      ),
                      img,
                    ],
                  ),
                ],
              ),
            ),
          ),
          BottomCalculateButton(
            onTap: () {
              Navigator.pop(context);
            },
            innerText: "ReCalculate",
          ),
        ],
      ),
    );
  }
}
