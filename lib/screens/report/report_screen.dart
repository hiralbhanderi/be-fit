import 'package:befit/utils/assets_paths.dart';
import 'package:befit/utils/color_res.dart';
import 'package:befit/utils/const.dart';
import 'package:befit/utils/height_cosnt.dart';
import 'package:befit/utils/shared_preferences_const.dart';
import 'package:befit/utils/type_change_view_button.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:get/get.dart';
import 'package:sizer/sizer.dart';

class ReportScreen extends StatefulWidget {
  static const routeName = '/ReportScreen';

  ReportScreen({Key? key}) : super(key: key);

  @override
  State<ReportScreen> createState() => _ReportScreenState();
}

class _ReportScreenState extends State<ReportScreen> {
  // String changeHeight = '';

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
        child: Padding(
          padding: EdgeInsets.symmetric(horizontal: 4.w),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              SizedBox(
                height: 12.w,
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text(
                    'My Report',
                    style: TextStyle(
                      fontWeight: FontWeight.w600,
                      fontSize: 21,
                      color: Colors.black,
                    ),
                  ),
                  Icon(
                    Icons.settings_outlined,
                    size: 8.w,
                    color: Colors.green,
                  )
                ],
              ),
              SizedBox(
                height: 4.h,
              ),
              Container(
                decoration: BoxDecoration(
                    color: ColorRes.whiteColor,
                    borderRadius: BorderRadius.circular(15),
                    boxShadow: [BoxShadow(color: ColorRes.greyColor.withOpacity(0.6), blurRadius: 3)]),
                child: mainView(
                  title: 'Steps',
                  subtitle: 'steps',
                  icon: ImagesAsset.stepImage,
                  iconBackGround: ColorRes.whiteColor,
                  iconColor: ColorRes.greenColor,
                  // onTap: () {},
                ),
              ),
              SizedBox(
                height: 4.h,
              ),
              Container(
                decoration: BoxDecoration(
                    color: ColorRes.whiteColor,
                    borderRadius: BorderRadius.circular(15),
                    boxShadow: [BoxShadow(color: ColorRes.greyColor.withOpacity(0.6), blurRadius: 2)]),
                child: Column(
                  children: [
                    Obx(()=>GestureDetector(
                      onTap: () {
                        print('click working');
                        showDialog(
                          context: context,
                          builder: (BuildContext context) {
                            return AlertDialog(
                              content: Container(
                                // height: 90,
                                child: Column(
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  mainAxisSize: MainAxisSize.min,
                                  children: [
                                    Container(
                                        height: 150,
                                        // width: 200,
                                        child: Height(
                                          heightController: heightController,
                                        )),
                                    const SizedBox(height: 20),
                                    Row(
                                      children: [
                                        Expanded(
                                          child: ElevatedButton(
                                            onPressed: () {
                                              Navigator.of(context).pop();
                                              // Navigator.of(context).pop();
                                            },
                                            style: ElevatedButton.styleFrom(
                                              backgroundColor: ColorRes.whiteColor,
                                            ),
                                            child: const Text("Cancel", style: TextStyle(color: ColorRes.greenColor, fontSize: 15)),
                                          ),
                                        ),
                                        const SizedBox(width: 15),
                                        Expanded(
                                            child: ElevatedButton(
                                              onPressed: () async {
                                                // print('no selected');
                                                storeHeightOfUser.value =
                                                selectedUnit == HeightUnit.ft ? heightController.text : '${heightController.text} cm';
                                                await SharedPreferencesConst.setHeightOfUser(storeHeightOfUser.value);
                                                heightOfUser.value = storeHeightOfUser.value;
                                                // setState(() {
                                                //   changeHeight = heightController.text;
                                                //
                                                //   ///
                                                // });
                                                Navigator.of(context).pop();
                                              },
                                              style: ElevatedButton.styleFrom(backgroundColor: ColorRes.greenColor),
                                              child: const Text("Save", style: TextStyle(color: ColorRes.whiteColor, fontSize: 15)),
                                            ))
                                      ],
                                    )
                                  ],
                                ),
                              ),
                            );
                          },
                        );
                      },
                      child: mainView(
                        title: 'Height',
                        // subtitle: selectedUnit == HeightUnit.ft
                        //     ? (changeHeight.isEmpty ? heightController.text : changeHeight)
                        //     : ('${(changeHeight.isEmpty ? heightController.text : changeHeight)} CM'),
                        subtitle: heightOfUser.value,
                        icon: ImagesAsset.heightImage,
                        iconBackGround: ColorRes.purpleColor.withOpacity(0.5),
                        iconColor: ColorRes.whiteColor,
                      ),
                    ),),
                    Divider(
                      thickness: 0.8,
                    ),
                   Obx(()=> GestureDetector(
                     onTap: () {
                       showDialog(
                         context: context,
                         builder: (BuildContext context) {
                           return AlertDialog(
                             content: Container(
                               // height: 90,
                               child: Column(
                                 crossAxisAlignment: CrossAxisAlignment.center,
                                 mainAxisSize: MainAxisSize.min,
                                 children: [
                                   Container(
                                       height: 100,
                                       // width: 200,
                                       child: Column(
                                         children: [
                                           Container(
                                             width: 28.w,
                                             child: TextFormField(
                                               enabled: true,
                                               controller: yourWeightController,
                                               keyboardType: TextInputType.number,
                                               textAlign: TextAlign.center,
                                               cursorColor: ColorRes.greenColor,
                                               style: TextStyle(fontWeight: FontWeight.w500, fontSize: 22),
                                               decoration: InputDecoration(
                                                 focusedBorder: UnderlineInputBorder(
                                                   borderSide: BorderSide(color: ColorRes.greyColor),
                                                 ),
                                                 contentPadding: EdgeInsets.only(top: 5.w),
                                                 hintText: '132',
                                                 suffixIcon: Padding(
                                                   padding: EdgeInsets.only(top: 4.5.w),
                                                   child: Obx(() => weightOfUser.value.contains('kg')
                                                       ? Text(
                                                     'KG',
                                                     style: TextStyle(color: ColorRes.blackColor, fontWeight: FontWeight.w600, fontSize: 24),
                                                   )
                                                       : Text(
                                                     'LBS',
                                                     style: TextStyle(color: ColorRes.blackColor, fontWeight: FontWeight.w600, fontSize: 24),
                                                   )),
                                                 ),
                                                 hintStyle: TextStyle(color: ColorRes.blackColor.withOpacity(0.1)),
                                               ),
                                               inputFormatters: [FilteringTextInputFormatter.allow(RegExp("[0-9.]"))],
                                             ),
                                           ),
                                           // SizedBox(
                                           //   height: 10.w,
                                           // ),
                                           // TypeChangeViewButton(
                                           //   firstButtonTitle: 'LBS',
                                           //   secondButtonTitle: 'KG',
                                           //   firstButtonClick: () {
                                           //     isSelectedWeightLBSType.value = true;
                                           //     // changeYourWeightType = 'lbs';
                                           //     if (isSelectedWeightLBSType.value) {
                                           //       isSelectedWeightKGType.value = false;
                                           //     }
                                           //     if (yourWeightDataStore != null) {
                                           //       yourWeightController.text = yourWeightDataStore!;
                                           //
                                           //       ///
                                           //     }
                                           //   },
                                           //   secondButtonClick: () {
                                           //     if (yourWeightController.text.isEmpty) {
                                           //       ScaffoldMessenger.of(context).showSnackBar(const SnackBar(content: Text('Please enter height')));
                                           //     } else {
                                           //       isSelectedWeightKGType.value = true;
                                           //       // changeYourWeightType = 'kg';
                                           //       if (isSelectedWeightKGType.value) {
                                           //         isSelectedWeightLBSType.value = false;
                                           //       }
                                           //       yourWeightDataStore ??= yourWeightController.text;
                                           //       yourWeightController.text = yourWeightDataStore!;
                                           //       String a = yourWeightController.text;
                                           //       yourWeightController.text = (int.parse(a) / 2.205).toStringAsFixed(0);
                                           //
                                           //       ///
                                           //     }
                                           //   },
                                           // )
                                           ///
                                           // Obx(
                                           //   () => Row(
                                           //     mainAxisAlignment: MainAxisAlignment.center,
                                           //     children: [
                                           //       Padding(
                                           //         padding: const EdgeInsets.symmetric(horizontal: 8),
                                           //         child: GestureDetector(
                                           //           onTap: () {
                                           //             isSelectedWeightLBSType.value = true;
                                           //             // changeYourWeightType = 'lbs';
                                           //             if (isSelectedWeightLBSType.value) {
                                           //               isSelectedWeightKGType.value = false;
                                           //             }
                                           //             yourWeightController.text = yourWeightDataStore!;
                                           //           },
                                           //           child: Container(
                                           //             decoration: BoxDecoration(
                                           //               borderRadius: BorderRadius.circular(5),
                                           //               border: Border.all(color: isSelectedWeightLBSType.value ? ColorRes.greenColor : Colors.transparent, width: 1.5),
                                           //               color: Colors.transparent,
                                           //             ),
                                           //             width: 35,
                                           //             height: 35,
                                           //             child: Center(child: Text('LBS', style: TextStyle(fontSize: 16))),
                                           //           ),
                                           //         ),
                                           //       ),
                                           //       Padding(
                                           //         padding: const EdgeInsets.symmetric(horizontal: 8),
                                           //         child: GestureDetector(
                                           //           onTap: () {
                                           //             isSelectedWeightKGType.value = true;
                                           //             // changeYourWeightType = 'kg';
                                           //             if (isSelectedWeightKGType.value) {
                                           //               isSelectedWeightLBSType.value = false;
                                           //             }
                                           //             if (yourWeightDataStore == null) {
                                           //               yourWeightDataStore = yourWeightController.text;
                                           //             }
                                           //             yourWeightController.text = yourWeightDataStore!;
                                           //             String a = yourWeightController.text;
                                           //             yourWeightController.text = (int.parse(a) / 2.205).toStringAsFixed(0);
                                           //           },
                                           //           child: Container(
                                           //             decoration: BoxDecoration(
                                           //               borderRadius: BorderRadius.circular(5),
                                           //               border: Border.all(color: isSelectedWeightKGType.value ? ColorRes.greenColor : Colors.transparent, width: 1.5),
                                           //               color: Colors.transparent,
                                           //             ),
                                           //             width: 35,
                                           //             height: 35,
                                           //             child: Center(child: Text('KG', style: TextStyle(fontSize: 16))),
                                           //           ),
                                           //         ),
                                           //       ),
                                           //     ],
                                           //   ),
                                           // ),
                                         ],
                                       )),
                                   // const SizedBox(height: 20),
                                   Row(
                                     children: [
                                       Expanded(
                                         child: ElevatedButton(
                                           onPressed: () {
                                             Navigator.of(context).pop();
                                             // Navigator.of(context).pop();
                                           },
                                           style: ElevatedButton.styleFrom(
                                             backgroundColor: ColorRes.whiteColor,
                                           ),
                                           child: const Text("Cancel", style: TextStyle(color: ColorRes.greenColor, fontSize: 15)),
                                         ),
                                       ),
                                       const SizedBox(width: 15),
                                       Expanded(
                                           child: ElevatedButton(
                                             onPressed: () async {
                                               // print('no selected');
                                               // setState(() async {
                                               // changeHeight = heightController.text;

                                               storeWeightOfUser.value = isSelectedWeightKGType.value ? '${yourWeightController.text} kg' : '${yourWeightController.text} lbs';
                                               await SharedPreferencesConst.setWeightOfUser(storeWeightOfUser.value);
                                               weightOfUser.value = storeWeightOfUser.value;
                                               Navigator.of(context).pop();
                                               // });
                                             },
                                             style: ElevatedButton.styleFrom(backgroundColor: ColorRes.greenColor),
                                             child: const Text("Save", style: TextStyle(color: ColorRes.whiteColor, fontSize: 15)),
                                           ))
                                     ],
                                   )
                                 ],
                               ),
                             ),
                           );
                         },
                       );
                     },
                     child: mainView(
                       title: 'Weight',
                       // subtitle: '${yourWeightController.text} $changeYourWeightType',
                       // subtitle: '${weightOfUser.value} $changeYourWeightType',
                       subtitle: weightOfUser.value,
                       icon: ImagesAsset.weightImage,
                       iconBackGround: ColorRes.orangeColor.withOpacity(0.5),
                       iconColor: ColorRes.whiteColor,
                     ),
                   ),),
                    Divider(
                      thickness: 0.8,
                    ),
                    Obx(()=>GestureDetector(
                      onTap: () {
                        showDialog(
                          context: context,
                          builder: (BuildContext context) {
                            return AlertDialog(
                              content: Container(
                                // height: 90,
                                child: Column(
                                  crossAxisAlignment: CrossAxisAlignment.center,
                                  mainAxisSize: MainAxisSize.min,
                                  children: [
                                    Container(
                                        height: 100,
                                        // width: 200,
                                        child: Column(
                                          children: [
                                            Container(
                                              width: 28.w,
                                              child: TextFormField(
                                                enabled: true,
                                                controller: yourTargetWeightController,
                                                keyboardType: TextInputType.number,
                                                textAlign: TextAlign.center,
                                                cursorColor: ColorRes.greenColor,
                                                style: TextStyle(fontWeight: FontWeight.w500, fontSize: 22),
                                                decoration: InputDecoration(
                                                  focusedBorder: UnderlineInputBorder(
                                                    borderSide: BorderSide(color: ColorRes.greyColor),
                                                  ),
                                                  contentPadding: EdgeInsets.only(top: 5.w),
                                                  hintText: '132',
                                                  suffixIcon: Padding(
                                                    padding: EdgeInsets.only(top: 4.5.w),
                                                    child: Obx(() => targetWeightOfUser.value.contains('kg')
                                                        ? Text(
                                                      'KG',
                                                      style: TextStyle(color: ColorRes.blackColor, fontWeight: FontWeight.w600, fontSize: 24),
                                                    )
                                                        : Text(
                                                      'LBS',
                                                      style: TextStyle(color: ColorRes.blackColor, fontWeight: FontWeight.w600, fontSize: 24),
                                                    )),
                                                  ),
                                                  hintStyle: TextStyle(color: ColorRes.blackColor.withOpacity(0.1)),
                                                ),
                                                inputFormatters: [FilteringTextInputFormatter.allow(RegExp("[0-9.]"))],
                                              ),
                                            ),
                                            // SizedBox(
                                            //   height: 10.w,
                                            // ),
                                            // TypeChangeViewButton(
                                            //   firstButtonTitle: 'LBS',
                                            //   secondButtonTitle: 'KG',
                                            //   firstButtonClick: () {
                                            //     isSelectedWeightLBSType.value = true;
                                            //     // changeYourTargetWeightType = 'lbs';
                                            //     if (isSelectedWeightLBSType.value) {
                                            //       isSelectedWeightKGType.value = false;
                                            //     }
                                            //     if (yourTargetWeightDataStore != null) {
                                            //       yourTargetWeightController.text = yourTargetWeightDataStore!;
                                            //     }
                                            //   },
                                            //   secondButtonClick: () {
                                            //     if (yourTargetWeightController.text.isEmpty) {
                                            //       ScaffoldMessenger.of(context)
                                            //           .showSnackBar(const SnackBar(content: Text('Please enter target weight first')));
                                            //     } else {
                                            //       isSelectedWeightKGType.value = true;
                                            //       // changeYourTargetWeightType = 'kg';
                                            //       if (isSelectedWeightKGType.value) {
                                            //         isSelectedWeightLBSType.value = false;
                                            //       }
                                            //       if (yourTargetWeightDataStore == null) {
                                            //         yourTargetWeightDataStore = yourTargetWeightController.text;
                                            //       }
                                            //       yourTargetWeightController.text = yourTargetWeightDataStore!;
                                            //       String a = yourTargetWeightController.text;
                                            //       yourTargetWeightController.text = (int.parse(a) / 2.205).toStringAsFixed(0);
                                            //     }
                                            //   },
                                            // ),
                                            ///
                                            // Obx(
                                            //       () => Row(
                                            //     mainAxisAlignment: MainAxisAlignment.center,
                                            //     children: [
                                            //       Padding(
                                            //         padding: const EdgeInsets.symmetric(horizontal: 8),
                                            //         child: GestureDetector(
                                            //           onTap: () {
                                            //             isSelectedWeightLBSType.value = true;
                                            //             // changeYourTargetWeightType = 'lbs';
                                            //             if (isSelectedWeightLBSType.value) {
                                            //               isSelectedWeightKGType.value = false;
                                            //             }
                                            //             yourTargetWeightController.text = yourTargetWeightDataStore!;
                                            //           },
                                            //           child: Container(
                                            //             decoration: BoxDecoration(
                                            //               borderRadius: BorderRadius.circular(5),
                                            //               border: Border.all(color: isSelectedWeightLBSType.value ? ColorRes.greenColor : Colors.transparent, width: 1.5),
                                            //               color: Colors.transparent,
                                            //             ),
                                            //             width: 35,
                                            //             height: 35,
                                            //             child: Center(child: Text('LBS', style: TextStyle(fontSize: 16))),
                                            //           ),
                                            //         ),
                                            //       ),
                                            //       Padding(
                                            //         padding: const EdgeInsets.symmetric(horizontal: 8),
                                            //         child: GestureDetector(
                                            //           onTap: () {
                                            //             isSelectedWeightKGType.value = true;
                                            //             // changeYourTargetWeightType = 'kg';
                                            //             if (isSelectedWeightKGType.value) {
                                            //               isSelectedWeightLBSType.value = false;
                                            //             }
                                            //             if (yourTargetWeightDataStore == null) {
                                            //               yourTargetWeightDataStore = yourTargetWeightController.text;
                                            //             }
                                            //             yourTargetWeightController.text = yourTargetWeightDataStore!;
                                            //             String a = yourTargetWeightController.text;
                                            //             yourTargetWeightController.text = (int.parse(a) / 2.205).toStringAsFixed(0);
                                            //           },
                                            //           child: Container(
                                            //             decoration: BoxDecoration(
                                            //               borderRadius: BorderRadius.circular(5),
                                            //               border: Border.all(color: isSelectedWeightKGType.value ? ColorRes.greenColor : Colors.transparent, width: 1.5),
                                            //               color: Colors.transparent,
                                            //             ),
                                            //             width: 35,
                                            //             height: 35,
                                            //             child: Center(child: Text('KG', style: TextStyle(fontSize: 16))),
                                            //           ),
                                            //         ),
                                            //       ),
                                            //     ],
                                            //   ),
                                            // ),
                                          ],
                                        )),
                                    // const SizedBox(height: 20),
                                    Row(
                                      children: [
                                        Expanded(
                                          child: ElevatedButton(
                                            onPressed: () {
                                              Navigator.of(context).pop();
                                              // Navigator.of(context).pop();
                                            },
                                            style: ElevatedButton.styleFrom(
                                              backgroundColor: ColorRes.whiteColor,
                                            ),
                                            child: const Text("Cancel", style: TextStyle(color: ColorRes.greenColor, fontSize: 15)),
                                          ),
                                        ),
                                        const SizedBox(width: 15),
                                        Expanded(
                                            child: ElevatedButton(
                                              onPressed: () async {
                                                // print('no selected');
                                                // setState(() {
                                                // changeHeight = heightController.text;
                                                storeTargetWeightOfUser.value =
                                                isSelectedWeightKGType.value ? '${yourTargetWeightController.text} kg' : '${yourTargetWeightController.text} lbs';
                                                await SharedPreferencesConst.setTargetWeightOfUser(storeTargetWeightOfUser.value);
                                                targetWeightOfUser.value = storeTargetWeightOfUser.value;
                                                Navigator.of(context).pop();
                                                // });
                                              },
                                              style: ElevatedButton.styleFrom(backgroundColor: ColorRes.greenColor),
                                              child: const Text("Save", style: TextStyle(color: ColorRes.whiteColor, fontSize: 15)),
                                            ))
                                      ],
                                    )
                                  ],
                                ),
                              ),
                            );
                          },
                        );
                      },
                      child: mainView(
                        title: 'Target Weight',
                        // subtitle: '${targetWeightOfUser.value} ${(changeYourTargetWeightType.isEmpty?'kg':changeYourTargetWeightType)}',
                        subtitle: targetWeightOfUser.value,
                        icon: ImagesAsset.targetWeightImage,
                        iconBackGround: ColorRes.blueColor.withOpacity(0.5),
                        iconColor: ColorRes.whiteColor,
                      ),
                    ),)
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }

  Widget mainView({String? title, String? subtitle, String? icon, Color? iconBackGround, Color? iconColor}) {
    return SizedBox(
      height: 80,
      // decoration: BoxDecoration(
      //     color: ColorRes.whiteColor,
      //     borderRadius: BorderRadius.circular(15),
      //     boxShadow: [BoxShadow(color: ColorRes.grayColor.withOpacity(0.5), blurRadius: 3)]),
      child: Padding(
        padding: const EdgeInsets.only(left: 10, right: 15),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Row(
              children: [
                Container(
                  height: 40,
                  width: 40,
                  decoration: BoxDecoration(shape: BoxShape.circle, color: iconBackGround),
                  child: Image.asset(
                    icon ?? "",
                    scale: 22,
                    color: iconColor,
                  ),
                ),
                SizedBox(
                  width: 4.w,
                ),
                Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      title ?? '',
                      style: TextStyle(
                        fontWeight: FontWeight.w500,
                        fontSize: 18,
                        color: Colors.black,
                      ),
                    ),
                    SizedBox(
                      height: 2.w,
                    ),
                    Text(
                      subtitle ?? '',
                      style: TextStyle(
                        fontWeight: FontWeight.w500,
                        fontSize: 16,
                        color: Colors.black.withOpacity(0.3),
                      ),
                    ),
                  ],
                )
              ],
            ),
            Icon(
              Icons.arrow_forward_ios_rounded,
              color: ColorRes.blackColor.withOpacity(0.5),
              size: 17,
            )
          ],
        ),
      ),
    );
  }
}
