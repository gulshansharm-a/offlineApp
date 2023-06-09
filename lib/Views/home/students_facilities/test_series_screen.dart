import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/container.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:offline_classes/utils/my_appbar.dart';
import 'package:offline_classes/widget/custom_button.dart';
import 'package:sizer/sizer.dart';

import '../../../utils/constants.dart';

class TestSeriesScreen extends StatefulWidget {
  const TestSeriesScreen({super.key});

  @override
  State<TestSeriesScreen> createState() => _TestSeriesScreenState();
}

class _TestSeriesScreenState extends State<TestSeriesScreen> {
  bool isPaperChecked = false;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: customAppbar2(context, 'Test Series'),
      body: Column(
        children: [
          InkWell(
            onTap: () {},
            child: Container(
              margin: EdgeInsets.all(10),
              padding:
                  EdgeInsets.only(left: 7.w, right: 5.w, top: 2.h, bottom: 2.h),
              // height: 12.h,
              width: 93.w,
              decoration: kGradientBoxDecoration(35, purpleGradident()),
              child: Row(
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  SizedBox(
                    // height: 14.h,
                    width: 55.w,
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          'Mathematics',
                          style: kBodyText22bold(white),
                        ),
                        Text(
                          'Algebra Chapter 3',
                          style: kBodyText14wNormal(white),
                        ),
                        addVerticalSpace(10),
                        Text(
                          'Exam Schedule: 30th Jan 23',
                          style: kBodyText14wNormal(white),
                        )
                      ],
                    ),
                  ),
                  Spacer(),
                  Container(
                    height: 12.h,
                    child: Image.asset('assets/images/test.png'),
                  )
                ],
              ),
            ),
          ),
          addVerticalSpace(3.h),
          InkWell(
            onTap: () {},
            child: Container(
              height: 17.h,
              width: width(context) * 0.92,
              decoration: k3DboxDecoration(38),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: [
                  SizedBox(
                      height: 10.h,
                      child: Image.asset('assets/images/upload.png')),
                  // addVerticalSpace(1.5.h),
                  Text(
                    'Upload File',
                    style: kBodyText16wNormal(black),
                  )
                ],
              ),
            ),
          ),
          Spacer(),
          if (isPaperChecked == true)
            SizedBox(
              width: width(context) * 0.78,
              child: Text(
                'You can upload your next test only when you have uploaded the previous checked paper result',
                textAlign: TextAlign.center,
                style: kBodyText14wBold(Colors.red),
              ),
            ),
          addVerticalSpace(6),
          CustomButton(
              text: isPaperChecked ? 'Upload Checked Paper' : 'Submit Test',
              onTap: () {
                isPaperChecked = !isPaperChecked;
                setState(() {});
              }),
          addVerticalSpace(2.h)
        ],
      ),
    );
  }
}
