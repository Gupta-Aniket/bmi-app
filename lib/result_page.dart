import 'package:bmi_app/constants.dart';
import 'package:flutter/material.dart';
import 'package:sleek_circular_slider/sleek_circular_slider.dart';
import 'reusable_bottom_calculate_button.dart';
import 'input_page.dart';

class ResultPage extends StatelessWidget {
  const ResultPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("R E S U L T"),
        centerTitle: true,
      ),
      body: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: [
          Center(
            child: Text("Normal ", style: kResultTextStyle),
          ),
          Stack(
            alignment: Alignment.center,
            children: [
              SleekCircularSlider(
                min: 0,
                max: 100,
                initialValue: 50,
                appearance: CircularSliderAppearance(
                  size: 300, // Adjust the size here
                  startAngle: 135,
                  angleRange: 270,
                  customColors: CustomSliderColors(
                    progressBarColor: Colors.blue,
                    trackColor: Colors.grey,
                  ),
                ),
              ),
              Image.asset(
                "assets/male.png",
              ),
            ],
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
