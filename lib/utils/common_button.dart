import 'package:befit/utils/color_res.dart';
import 'package:flutter/material.dart';

class CommonButton extends StatelessWidget {
  final String buttonName;
  final double height;
  final double width;
  final double buttonNameSize;
  final Color buttonNameColor;
  final Gradient buttonColor;
  final FontWeight buttonNameWeight;
  final VoidCallback onTap;

  const CommonButton(
      {required this.buttonName,
      required this.height,
      required this.width,
      required this.buttonNameSize,
      required this.buttonNameColor,
      required this.buttonColor,
      required this.buttonNameWeight,
      required this.onTap});

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: Container(
        height: height,
        width: width,
        decoration: BoxDecoration(gradient: buttonColor, borderRadius: BorderRadius.circular(15)),
        child: Center(
            child: Text(
          buttonName,
          style: TextStyle(color: buttonNameColor, fontWeight: buttonNameWeight, fontSize: buttonNameSize),
        )),
      ),
    );
  }
}
