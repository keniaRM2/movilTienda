import 'package:flutter/material.dart';

class BottomNavyBarItem {
  String title;
  Icon icon;
  Color activeColor;
  Color inActiveColor;
  bool? visible;
  Widget widget;

  BottomNavyBarItem(
    this.title,
    this.icon,
    this.activeColor,
    this.inActiveColor,
    this.visible,
    this.widget,
  );
}
