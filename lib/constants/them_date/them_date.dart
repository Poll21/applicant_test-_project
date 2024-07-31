import 'package:applicant_test_project/constants/colors/colors.dart';
import 'package:flutter/material.dart';

final lateThemDate = ThemeData(
    primaryColor: primaryColor,
    useMaterial3: true,
    appBarTheme: const AppBarTheme(
        backgroundColor: primaryColor,
        titleTextStyle: TextStyle(
            color: Colors.black, fontSize: 20, fontWeight: FontWeight.w600)),
    bottomNavigationBarTheme: const BottomNavigationBarThemeData(
      type: BottomNavigationBarType.fixed,
      backgroundColor: primaryColor,
      showSelectedLabels: true,
      showUnselectedLabels: true,
      selectedItemColor: selectColor,
      unselectedItemColor: unSelectColor,
      selectedIconTheme: IconThemeData(
        color: selectColor,
      ),
      unselectedIconTheme: IconThemeData(color: unSelectColor),
    ));
