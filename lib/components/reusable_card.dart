import 'package:flutter/material.dart';

class ReusableCard extends StatelessWidget {
  final Color cardBGColor;
  final Widget cardChild;
  final VoidCallback? onPress;

  // to remove null safety and actually using the function as is without providing requried in the constructor, we can use ? such as VoidCallback? instead of just using VoidCallback

  // the course used Function instead of VoidCallback but now i believe things have changed and now we have to use VoidCallback instead of Function

  // why final is important: this makes the card immutable, once the color is changed, it will remain as is.
  ReusableCard(
      {required this.cardBGColor,
      this.cardChild = const SizedBox(),
      this.onPress});
  // here Const SizedBox is added because the normal code was giving errors something on the lines non null.. etc etc so the 2 options i had were to first: make it required, and 2nd to make this const sized box. so I chose this option.
  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onPress,
      child: Container(
        child: cardChild,
        margin: const EdgeInsets.all(15),
        decoration: BoxDecoration(
          color: cardBGColor,
          borderRadius: BorderRadius.circular(10),
        ),
      ),
    );
  }
}
