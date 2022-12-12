import 'package:befit/utils/color_res.dart';
import 'package:befit/utils/const.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class TypeChangeViewButton extends StatelessWidget {
  final VoidCallback firstButtonClick;
  final VoidCallback secondButtonClick;
  final String? firstButtonTitle;
  final String? secondButtonTitle;

  const TypeChangeViewButton({
    required this.firstButtonClick,
    required this.secondButtonClick,
    required this.firstButtonTitle,
    required this.secondButtonTitle,
  });

  @override
  Widget build(BuildContext context) {
    return Obx(() => Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 8),
              child: GestureDetector(
                onTap: firstButtonClick,
                child: Container(
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(5),
                    border: Border.all(color: isSelectedWeightLBSType.value ? ColorRes.greenColor : Colors.transparent, width: 1.5),
                    color: Colors.transparent,
                  ),
                  width: 35,
                  height: 35,
                  child: Center(child: Text(firstButtonTitle!, style: TextStyle(fontSize: 16))),
                ),
              ),
            ),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 8),
              child: GestureDetector(
                onTap: secondButtonClick,
                child: Container(
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(5),
                    border: Border.all(color: isSelectedWeightKGType.value ? ColorRes.greenColor : Colors.transparent, width: 1.5),
                    color: Colors.transparent,
                  ),
                  width: 35,
                  height: 35,
                  child: Center(child: Text(secondButtonTitle!, style: TextStyle(fontSize: 16))),
                ),
              ),
            ),
          ],
        ));
  }
}
