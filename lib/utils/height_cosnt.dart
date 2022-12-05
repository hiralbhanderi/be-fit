import 'package:befit/utils/color_res.dart';
import 'package:befit/utils/const.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:sizer/sizer.dart';

enum HeightUnit { ft, cm }

// class Height extends StatefulWidget {
//   @override
//   _HeightState createState() => _HeightState();
// }

class Height extends StatefulWidget {
  final TextEditingController heightController;

  Height({required this.heightController});

  @override
  State<Height> createState() => _HeightState();
}

class _HeightState extends State<Height> {
  HeightUnit selectedUnit = HeightUnit.ft;

  // TextEditingController heightController = TextEditingController();
  // int ft = 0;
  //
  // int inches = 0;
  //
  // String? cm;

  cmToInches(inchess) {
    ft = inchess ~/ 12;
    inches = inchess % 12;
    print('$ft feet and $inches inches');
  }

  inchesToCm() {
    int inchesTotal = (ft * 12) + inches;
    cm = (inchesTotal * 2.54).round().toString();
    widget.heightController.text = cm ?? '0';
  }

  void checkHeightUnit() {
    if (selectedUnit == HeightUnit.ft) {
      setState(() {
        int inchess = (double.parse(widget.heightController.text) ~/ 2.54).toInt();
        cmToInches(inchess);
        widget.heightController.text = '$ft FT $inches IN';
      });
    } else if (selectedUnit == HeightUnit.cm) {
      setState(() {
        print(widget.heightController.text);
        inchesToCm();
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: Center(
            child: Column(
      children: [
        Container(
          width:34.w,
          child: TextFormField(
            onTap: selectedUnit == HeightUnit.ft
                ? () {
                    FocusScope.of(context).requestFocus(FocusNode());
                    showModalBottomSheet(
                        context: context,
                        builder: (BuildContext context) {
                          return Container(
                            height: 30.h,
                            color: ColorRes.whiteColor,
                            child: Row(
                              children: [
                                SizedBox(width: 4.w,),
                                Expanded(
                                  child: CupertinoPicker(
                                    selectionOverlay: Container(
                                      width: 8.w,
                                      decoration: BoxDecoration(color: ColorRes.greenColor.withOpacity(0.15),borderRadius: BorderRadius.circular(5)),),
                                    itemExtent: 32.0,
                                    onSelectedItemChanged: (int index) {
                                      print(index + 1);
                                      setState(() {
                                        ft = (index + 1);
                                        widget.heightController.text = "$ft FT $inches IN";
                                      });
                                    },
                                    children: List.generate(12, (index) {
                                      return Center(
                                        child: Text('${index + 1}',style: TextStyle(fontSize: 20,fontWeight: FontWeight.w500),),
                                      );
                                    }),
                                  ),
                                ),
                                SizedBox(width: 8.w,),
                                Text('FT',
                                    style: TextStyle(
                                      fontSize: 22,
                                      fontWeight: FontWeight.w500,
                                      color: Colors.black,
                                    )),
                                SizedBox(width: 8.w,),
                                Expanded(
                                  child: CupertinoPicker(
                                    itemExtent: 32.0,
                                    selectionOverlay: Container(decoration: BoxDecoration(color: ColorRes.greenColor.withOpacity(0.15),borderRadius: BorderRadius.circular(8)),),
                                    onSelectedItemChanged: (int index) {
                                      print(index);
                                      setState(() {
                                        inches = (index);
                                        widget.heightController.text = "$ft FT $inches IN";
                                      });
                                    },
                                    children: List.generate(12, (index) {
                                      return Center(
                                        child: Text('$index',style: TextStyle(fontSize: 20,fontWeight: FontWeight.w500),),
                                      );
                                    }),
                                  ),
                                ),
                                SizedBox(width: 8.w,),
                                Text('IN',
                                    style: TextStyle(
                                      fontSize: 22,
                                      fontWeight: FontWeight.w500,
                                      color: Colors.black,
                                    )),
                                SizedBox(width: 4.w,),
                              ],
                            ),
                          );
                        });
                  }
                : null,
            controller: widget.heightController,
            keyboardType: TextInputType.number,
            textAlign: TextAlign.center,
            cursorColor: ColorRes.greenColor,
            style: TextStyle(fontWeight: FontWeight.w500,fontSize: 22),
            decoration: InputDecoration(
              focusedBorder: UnderlineInputBorder(borderSide: BorderSide(color: ColorRes.greyColor),),
              contentPadding: EdgeInsets.only(top: 5.w),
                hintText: selectedUnit == HeightUnit.ft ? "__ FT __ IN" : 'CM',
                hintStyle: TextStyle(color: ColorRes.blackColor.withOpacity(0.5)),),
            inputFormatters: [FilteringTextInputFormatter.allow(RegExp("[0-9.]"))],
          ),
        ),
        SizedBox(height: 10.w),
        Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 8),
              child: GestureDetector(
                onTap: () {
                  setState(() {
                    if (widget.heightController.text.isEmpty) {
                      selectedUnit = HeightUnit.ft;
                    } else {
                      selectedUnit = HeightUnit.ft;
                      checkHeightUnit();
                      widget.heightController.clear();
                    }
                  });
                },
                child: Container(
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(5),
                    border: Border.all(
                      color: selectedUnit == HeightUnit.ft ? ColorRes.greenColor : Colors.transparent,
                      width: 1.5
                    ),
                    color: Colors.transparent,
                  ),
                  width: 35,
                  height: 35,
                  child: Center(child: Text('FT', style: TextStyle(fontSize: 16))),
                ),
              ),
            ),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 8),
              child: GestureDetector(
                onTap: () {
                  setState(() {
                    if (widget.heightController.text.isEmpty) {
                      selectedUnit = HeightUnit.cm;
                    } else {
                      selectedUnit = HeightUnit.cm;
                      checkHeightUnit();
                      widget.heightController.clear();
                    }
                  });
                },
                child: Container(
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(5),
                    border: Border.all(
                      color: selectedUnit == HeightUnit.cm ? ColorRes.greenColor : Colors.transparent,
                        width: 1.5
                    ),
                    color: Colors.transparent,
                  ),
                  width: 35,
                  height: 35,
                  child: Center(child: Text('CM', style: TextStyle(fontSize: 16))),
                ),
              ),
            ),
          ],
        ),
      ],
    )));
  }
}
