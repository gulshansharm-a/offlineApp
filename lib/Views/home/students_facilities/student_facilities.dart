import 'dart:developer';

import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/container.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:offline_classes/Views/home/students_facilities/attendance_screen.dart';
import 'package:offline_classes/Views/home/students_facilities/fee_payment_screen.dart';
import 'package:offline_classes/Views/home/students_facilities/gk_screen.dart';
import 'package:offline_classes/Views/home/students_facilities/logout_screen.dart';
import 'package:offline_classes/Views/home/students_facilities/my_profile_screen.dart';
import 'package:offline_classes/Views/home/students_facilities/notice_screen.dart';
import 'package:offline_classes/Views/home/students_facilities/parents_doubts.dart';
import 'package:offline_classes/Views/home/students_facilities/progress_reports.dart';
import 'package:offline_classes/Views/home/students_facilities/settings_screen.dart';
import 'package:offline_classes/Views/home/students_facilities/student_doubts.dart';
import 'package:offline_classes/Views/home/students_facilities/teachers_list.dart';
import 'package:offline_classes/Views/home/students_facilities/test_series_screen.dart';
import 'package:offline_classes/model/statics_list.dart';
import 'package:offline_classes/utils/constants.dart';
import 'package:sizer/sizer.dart';

class StudentFacilities extends StatelessWidget {
  const StudentFacilities({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        elevation: 0,
        backgroundColor: white,
        foregroundColor: black,
        leading: SizedBox(),
        title: Text(
          'Student Facilities',
          style: kBodyText20wBold(primary),
        ),
      ),
      body: SingleChildScrollView(
        child: Column(
          children: [
            InkWell(
              onTap: () {
                nextScreen(
                    context,
                    MyProfileScreen(
                      image: 'assets/images/dummy1.png',
                      username: 'Diksha Shah',
                    ));
              },
              child: Container(
                margin: EdgeInsets.all(10),
                padding: EdgeInsets.only(
                    left: 9.w, right: 5.w, top: 2.h, bottom: 2.h),
                // height: 12.h,
                width: 93.w,
                decoration: kGradientBoxDecoration(35, purpleGradident()),
                child: Row(
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    SizedBox(
                      height: 12.h,
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                        children: [
                          Text(
                            'Diksha Shah',
                            style: kBodyText24wBold(white),
                          ),
                          Text(
                            'Mumbai, Maharashtra',
                            style: kBodyText12wNormal(white),
                          ),
                          Text(
                            '+91-987543210',
                            style: kBodyText12wNormal(white),
                          )
                        ],
                      ),
                    ),
                    Spacer(),
                    Container(
                      height: 12.h,
                      width: 25.w,
                      decoration: kGradientBoxDecoration(18, orangeGradient()),
                      child: Image.asset('assets/images/dummy1.png'),
                    )
                  ],
                ),
              ),
            ),
            addVerticalSpace(1.h),
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: GridView.builder(
                  shrinkWrap: true,
                  itemCount: studentFacilityList.length,
                  physics: NeverScrollableScrollPhysics(),
                  gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                      mainAxisSpacing: 10,
                      crossAxisSpacing: 10,
                      crossAxisCount: 3,
                      childAspectRatio: 0.83),
                  itemBuilder: (ctx, i) {
                    return InkWell(
                      onTap: () {
                        if (i == 0) {
                          nextScreen(
                              context,
                              const MyProfileScreen(
                                image: 'assets/images/dummy1.png',
                                username: 'Diksha Shah',
                              ));
                        } else if (i == 1) {
                          nextScreen(context, TeachersListScreen());
                        } else if (i == 2) {
                          nextScreen(context, AttendanceTeacersList());
                        } else if (i == 3) {
                          nextScreen(context, FeePaymentScreen());
                        } else if (i == 4) {
                          nextScreen(context, TestSeriesScreen());
                        } else if (i == 5) {
                          nextScreen(context, ProgressReports());
                        } else if (i == 6) {
                          nextScreen(context, StudentsDoubts());
                        } else if (i == 7) {
                          nextScreen(context, ParentsDoubts());
                        } else if (i == 8) {
                          nextScreen(context, GKScreen());
                        } else if (i == 9) {
                          nextScreen(
                              context,
                              NoticeScreen(
                                isVisible: false,
                              ));
                        } else if (i == 10) {
                          nextScreen(
                              context,
                              SettingsScreen(
                                isVisible: true,
                              ));
                        } else if (i == 11) {
                          nextScreen(context, LogoutScreen());
                        }
                      },
                      child: Container(
                        padding: EdgeInsets.all(7),
                        // padding: EdgeInsets.all(10),
                        // height: 17.h,
                        width: 33.w,
                        decoration: k3DboxDecorationWithColor(
                          35,
                          studentFacilityList[i]['color'],
                        ),
                        child: Column(
                          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                          children: [
                            SizedBox(
                              height: 7.8.h,
                              child: Image.asset(
                                studentFacilityList[i]['img'],
                                fit: BoxFit.fill,
                              ),
                            ),
                            Text(
                              studentFacilityList[i]['title'],
                              style: kBodyText14w500withoutSizer(black),
                              textAlign: TextAlign.center,
                            )
                          ],
                        ),
                      ),
                    );
                  }),
            )
          ],
        ),
      ),
    );
  }
}
