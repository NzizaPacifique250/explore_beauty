// [GRAPHICAL INTERFACE] handler
import 'package:flutter/material.dart';

Widget spacingHeight(double val) {
  return SizedBox(height: val);
}

Widget spacingWidht(double val) {
  return SizedBox(width: val);
}

double height(BuildContext context) {
  return MediaQuery.of(context).size.height;
}

double width(BuildContext context) {
  return MediaQuery.of(context).size.width;
} //Color Pallete

const Color primaryColor = Color(0xffff1616);
const Color primaryText = Color(0xff4A4B4D);
const Color secondaryText = Color(0xff7c7d7e);
const Color textFieldColor = Color(0xfffff2f2);
const Color dividerColor = Colors.grey;
const Color placeHolder = Color(0xffb6b7b7);
