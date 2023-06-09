import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/container.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:offline_classes/model/statics_list.dart';
import 'package:offline_classes/utils/constants.dart';
import 'package:offline_classes/utils/my_appbar.dart';
import 'package:offline_classes/widget/custom_button.dart';
import 'package:sizer/sizer.dart';

import '../../../widget/custom_textfield.dart';

class GKScreenForTeacher extends StatelessWidget {
  const GKScreenForTeacher({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: customAppbar2(context, 'General Knowledge'),
      body: SingleChildScrollView(
        child: Column(
          children: [
            addVerticalSpace(1.h),
            Center(
              child: Text(
                'For All Classes',
                style: kBodyText18wBold(black),
              ),
            ),
            ListView.builder(
                itemCount: gkList1.length,
                shrinkWrap: true,
                physics: const NeverScrollableScrollPhysics(),
                itemBuilder: (ctx, i) {
                  return Container(
                    margin: EdgeInsets.all(2.h),
                    width: 93.w,
                    decoration: k3DboxDecoration(42),
                    padding: EdgeInsets.only(
                        left: 9.w, right: 5.w, top: 2.h, bottom: 2.h),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          gkList1[i],
                          style: kBodyText18wNormal(black),
                        ),
                        addVerticalSpace(1.h),
                        Text(
                          'Lorem ipsum dolor sit amet consectetur. In cursus egestas amet nam sodales sollicitudin ut feugiat.',
                          style: kBodyText14w500(black),
                        )
                      ],
                    ),
                  );
                }),
          ],
        ),
      ),
      bottomNavigationBar: Padding(
        padding: const EdgeInsets.all(15.0),
        child: CustomButton(
            text: 'Add General Knowledge',
            onTap: () {
              nextScreen(context, AddGKContent());
            }),
      ),
    );
  }
}

class AddGKContent extends StatelessWidget {
  const AddGKContent({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: customAppbar2(context, 'Add General Knowledge'),
      body: Padding(
        padding: const EdgeInsets.all(12.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            addVerticalSpace(2.h),
            CustomTextfield(hintext: 'Title'),
            addVerticalSpace(3.h),
            CustomTextfieldMaxLine(hintext: 'Description'),
            addVerticalSpace(3.h),
            InkWell(
              onTap: () {
                selectFile(context);
              },
              child: Container(
                margin: EdgeInsets.only(left: 7),
                height: 6.h,
                width: 35.w,
                decoration: k3DboxDecoration(10),
                // padding: EdgeInsets.only(top: )
                // ,
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    Icon(
                      Icons.add_link,
                      color: textColor,
                    ),
                    addHorizontalySpace(6),
                    Text(
                      'Attach File',
                      style: kBodyText14w500(textColor),
                    ),
                  ],
                ),
              ),
            ),
            addVerticalSpace(6),
            Padding(
              padding: const EdgeInsets.only(left: 8.0),
              child: Text(
                'Attach PDF, JPEG, PNG',
                style: kBodyText10wBold(black),
              ),
            ),
            Spacer(),
            CustomButton(text: 'Post', onTap: () {})
          ],
        ),
      ),
    );
  }

  Future<dynamic> selectFile(BuildContext context) {
    return showDialog(
        context: context,
        builder: (_) => AlertDialog(
              contentPadding: const EdgeInsets.all(6),
              shape: const RoundedRectangleBorder(
                  borderRadius: BorderRadius.all(Radius.circular(10.0))),
              content: StatefulBuilder(
                builder: (BuildContext context, StateSetter setState) {
                  var height = MediaQuery.of(context).size.height;
                  var width = MediaQuery.of(context).size.width;

                  return Container(
                      height: height * 0.35,
                      // decoration: kFillBoxDecoration(0, white, 40),
                      padding: EdgeInsets.all(10),
                      child: Column(
                        children: [
                          Text(
                            'Select a File',
                            style: kBodyText18wBold(black),
                          ),
                          addVerticalSpace(5.h),
                          Row(
                            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                            children: [
                              InkWell(
                                onTap: () {},
                                child: Container(
                                  height: 12.h,
                                  width: 30.w,
                                  decoration: kGradientBoxDecoration(
                                      10, purpleGradident()),
                                  child: Column(
                                    mainAxisAlignment:
                                        MainAxisAlignment.spaceEvenly,
                                    children: [
                                      SizedBox(
                                          height: 5.h,
                                          child: Image.asset(
                                              'assets/images/camera.png')),
                                      Text(
                                        'Camera',
                                        style: kBodyText12wBold(white),
                                      )
                                    ],
                                  ),
                                ),
                              ),
                              InkWell(
                                onTap: () {},
                                child: Container(
                                  height: 12.h,
                                  width: 30.w,
                                  decoration: kGradientBoxDecoration(
                                      10, purpleGradident()),
                                  child: Column(
                                    mainAxisAlignment:
                                        MainAxisAlignment.spaceEvenly,
                                    children: [
                                      SizedBox(
                                          height: 7.h,
                                          child: Image.asset(
                                              'assets/images/gallary.png')),
                                      Text(
                                        'Gallary',
                                        style: kBodyText12wBold(white),
                                      )
                                    ],
                                  ),
                                ),
                              ),
                            ],
                          ),
                          addVerticalSpace(4.h),
                          Align(
                            alignment: Alignment.bottomRight,
                            child: TextButton(
                                onPressed: () {},
                                child: Text(
                                  'Upload',
                                  style: kBodyText16wBold(primary),
                                )),
                          )
                        ],
                      ));
                },
              ),
            ));
  }
}
