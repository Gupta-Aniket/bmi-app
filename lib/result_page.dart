import 'package:bmi_app/constants.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:sleek_circular_slider/sleek_circular_slider.dart';
import 'reusable_bottom_calculate_button.dart';
import 'input_page.dart';
import 'reusable_card.dart';

class ResultPage extends StatelessWidget {
  int height, weight, age;
  String gender;
  Image img = Image.asset(
    "assets/male.png",
  );
  Text getBMICategory(double bmi) {
    if (bmi < 18.5) {
      return Text(
        textAlign: TextAlign.center,
        bmi.round().toString() + ' \nUnderweight',
        style: TextStyle(
          color: Colors.red,
          fontSize: 24.0,
          fontWeight: FontWeight.bold,
        ),
      );
    } else if (bmi >= 18.5 && bmi < 25.0) {
      return Text(
        textAlign: TextAlign.center,
        bmi.round().toString() + ' \nNormal',
        style: TextStyle(
          color: Colors.green,
          fontSize: 24.0,
          fontWeight: FontWeight.bold,
        ),
      );
    } else if (bmi >= 25.0 && bmi < 30.0) {
      return Text(
        textAlign: TextAlign.center,
        bmi.round().toString() + ' \nOverweight',
        style: TextStyle(
          color: Colors.red,
          fontSize: 24.0,
          fontWeight: FontWeight.bold,
        ),
      );
    } else {
      return Text(
        textAlign: TextAlign.center,
        bmi.round().toString() + ' \nObese',
        style: TextStyle(
          color: Colors.red,
          fontSize: 24.0,
          fontWeight: FontWeight.bold,
        ),
      );
    }
  }

  ResultPage(
      {required this.height,
      required this.age,
      required this.weight,
      required this.gender});

  Widget build(BuildContext context) {
    if (gender == "Genders.male") {
      img = Image.asset("assets/male.png");
    } else {
      img = Image.asset("assets/female.png");
    }

    double bmi = (weight * 10000) / (height * height);
    if (bmi < 10)
      bmi = 10;
    else if (bmi > 50) bmi = 50;
    Text bmiCategory = getBMICategory(bmi);

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
                    child: bmiCategory,
                  ),
                  Stack(
                    alignment: Alignment.center,
                    children: [
                      SleekCircularSlider(
                        min: 10,
                        max: 50,
                        initialValue: bmi,
                        appearance: CircularSliderAppearance(
                          animDurationMultiplier: 2,
                          size: 300, // Adjust the size here
                          startAngle: 135,
                          angleRange: 270,

                          customColors: CustomSliderColors(
                            progressBarColors: [
                              kBottomCalcColor,
                              Colors.green,
                            ],
                            trackColor: Color(0xff6CE5E7),
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
