import 'dart:math';

import 'package:flutter/material.dart';
import 'package:offline_classes/Views/home/courses_tab.dart';
import 'package:offline_classes/Views/home/home_page_for_register_user.dart';
import 'package:offline_classes/Views/home/home_screen.dart';
import 'package:offline_classes/Views/home/students_facilities/student_facilities.dart';
import 'package:offline_classes/Views/home/teachers_facilities/teacher_course_tab.dart';
import 'package:offline_classes/Views/home/teachers_facilities/teacher_facilities.dart';
import 'package:offline_classes/model/statics_list.dart';

import '../utils/constants.dart';

class MyBottomBar extends StatefulWidget {
  const MyBottomBar({
    Key? key,
    required this.whoRYou,
  }) : super(key: key);
  final String whoRYou;

  @override
  State<MyBottomBar> createState() => _MyBottomBarState();
}

class _MyBottomBarState extends State<MyBottomBar> {
  int _selectedIndex = 0;
  bool isIAm = false;

  // List<Widget> _widgetOptions = <Widget>[
  //   HomeScreen(),
  //   Text('data'),
  //   Text('data'),
  // ];
  Widget getPage(int index) {
    switch (index) {
      case 0:
        return HomeScreenForRegisterUser(
          whoAreYou: widget.whoRYou,
          serviceList: widget.whoRYou == 'Student'
              ? studentServiceList
              : teacherServiceList,
          sliderList: widget.whoRYou == 'Student'
              ? ['Trusted Teachers', 'Home to Home tuition service']
              : const ['Annual Gift Hamper', '100% Trusted & Satisfied'],
        );

        break;
      case 1:
        return widget.whoRYou == 'Student' ? CoursesTab() : TeachersCourseTab();
        break;
      default:
        return widget.whoRYou == 'Student'
            ? StudentFacilities()
            : TeacherFacilities();
        break;
    }
  }

  void _onItemTapped(int index) {
    setState(() {
      _selectedIndex = index;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: getPage(_selectedIndex),
      ),
      bottomNavigationBar: ClipRRect(
        borderRadius: BorderRadius.only(
          topLeft: Radius.circular(30.0),
          topRight: Radius.circular(30.0),
        ),
        child: SizedBox(
          height: height(context) * 0.08,
          child: BottomNavigationBar(
            elevation: 7,
            backgroundColor: Color.fromRGBO(239, 239, 239, 1),
            items: const <BottomNavigationBarItem>[
              BottomNavigationBarItem(
                icon: ImageIcon(AssetImage('assets/images/nav1.png')),
                label: 'Home',
              ),
              BottomNavigationBarItem(
                icon: ImageIcon(AssetImage('assets/images/nav2.png')),
                // activeIcon: ImageIcon(AssetImage('assets/images/active2.png')),

                label: 'Courses',
              ),
              BottomNavigationBarItem(
                // icon: ImageIcon(AssetImage('assets/images/inactive3.png')),
                icon: ImageIcon(AssetImage('assets/images/nav3.png')),

                label: 'Menu',
              ),
            ],
            currentIndex: _selectedIndex,
            unselectedItemColor: Colors.grey,
            selectedItemColor: primary2,
            selectedFontSize: 12,
            unselectedFontSize: 12,
            type: BottomNavigationBarType.fixed,
            onTap: _onItemTapped,
            showSelectedLabels: true,
            showUnselectedLabels: true,
          ),
        ),
      ),
    );
  }
}
