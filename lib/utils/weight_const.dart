import 'package:befit/utils/color_res.dart';
import 'package:befit/utils/const.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:get/get.dart';
import 'package:sizer/sizer.dart';

class WeightConst extends StatefulWidget {
  final TextEditingController yourWeightController;
  WeightConst({required this.yourWeightController});

  @override
  State<WeightConst> createState() => _WeightConstState();
}

class _WeightConstState extends State<WeightConst> {

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
      Container(
      width:28.w,
      child: TextFormField(
        controller: widget.yourWeightController,
        keyboardType: TextInputType.number,
        textAlign: TextAlign.center,
        cursorColor: ColorRes.greenColor,
        style: TextStyle(fontWeight: FontWeight.w500,fontSize: 22),
        decoration: InputDecoration(
          focusedBorder: UnderlineInputBorder(borderSide: BorderSide(color: ColorRes.greyColor),),
          contentPadding: EdgeInsets.only(top: 5.w),
          hintText: '132',
          suffix: Text('LBS',style: TextStyle(color: ColorRes.blackColor),),
          hintStyle: TextStyle(color: ColorRes.blackColor.withOpacity(0.1)),),
        inputFormatters: [FilteringTextInputFormatter.allow(RegExp("[0-9.]"))],
      ),
    ),
        SizedBox(height: 10.w,),
        Obx(()=>Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 8),
              child: GestureDetector(
                onTap: () {
                  isSelectedWeightLBSType.value = true;
                  if(isSelectedWeightLBSType.value){
                    isSelectedWeightKGType.value = false;
                  }
                },
                child: Container(
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(5),
                    border: Border.all(
                        color: isSelectedWeightLBSType.value ? ColorRes.greenColor : Colors.transparent,
                        width: 1.5
                    ),
                    color: Colors.transparent,
                  ),
                  width: 35,
                  height: 35,
                  child: Center(child: Text('LBS', style: TextStyle(fontSize: 16))),
                ),
              ),
            ),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 8),
              child: GestureDetector(
                onTap: () {

                  isSelectedWeightKGType.value = true;
                  if(isSelectedWeightKGType.value){
                    isSelectedWeightLBSType.value = false;
                  }
                },
                child: Container(
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(5),
                    border: Border.all(
                        color:  isSelectedWeightKGType.value ? ColorRes.greenColor : Colors.transparent,
                        width: 1.5
                    ),
                    color: Colors.transparent,
                  ),
                  width: 35,
                  height: 35,
                  child: Center(child: Text('KG', style: TextStyle(fontSize: 16))),
                ),
              ),
            ),
          ],
        ),)
      ],
    );
  }
}
