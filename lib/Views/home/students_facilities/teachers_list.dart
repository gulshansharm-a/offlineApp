import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/container.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:offline_classes/Views/home/students_facilities/teacher_profile.dart';
import 'package:offline_classes/utils/constants.dart';
import 'package:offline_classes/utils/my_appbar.dart';
import 'package:sizer/sizer.dart';

class TeachersListScreen extends StatelessWidget {
  const TeachersListScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: customAppbar2(context, 'Teachers Profile'),
      body: Column(
        children: [
          addVerticalSpace(10),
          Expanded(
              child: ListView.builder(
                  itemCount: 3,
                  itemBuilder: (ctx, i) {
                    return InkWell(
                      onTap: () {
                        nextScreen(context, TeacherProfile());
                      },
                      child: Container(
                        margin: EdgeInsets.all(10),
                        padding: EdgeInsets.all(12),
                        // height: 12.h,
                        width: 93.w,
                        decoration:
                            kGradientBoxDecoration(35, purpleGradident()),
                        child: Row(
                          crossAxisAlignment: CrossAxisAlignment.center,
                          children: [
                            Container(
                              height: 11.h,
                              width: 25.w,
                              decoration:
                                  kGradientBoxDecoration(18, orangeGradient()),
                              child: Image.asset('assets/images/dummy2.png'),
                            ),
                            addHorizontalySpace(width(context) * 0.06),
                            Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                              children: [
                                Text(
                                  'Anup Sharma',
                                  style: kBodyText22bold(white),
                                ),
                                addVerticalSpace(10),
                                Text(
                                  'Science',
                                  style: kBodyText18wNormal(white),
                                ),
                              ],
                            ),
                          ],
                        ),
                      ),
                    );
                  }))
        ],
      ),
    );
  }
}