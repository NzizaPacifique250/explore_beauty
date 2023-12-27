// ignore_for_file: must_be_immutable

import 'package:explore_beauty/utils/constants/constant.dart';
import 'package:flutter/material.dart';

enum CircledButtonType { bgPrimary, textPrimary }

class CircledButton extends StatelessWidget {
  final IconData icon;
  Color? color;
  final VoidCallback onTap;
  final CircledButtonType type;

  CircledButton(
      {super.key,
      required this.icon,
      required this.onTap,
      this.color,
      this.type = CircledButtonType.bgPrimary});
  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: onTap,
      child: Container(
        width: 40,
        height: 40,
        alignment: Alignment.center,
        decoration: BoxDecoration(
          border: type == CircledButtonType.bgPrimary
              ? null
              : Border.all(color: primaryColor, width: 1),
          color:
              type == CircledButtonType.bgPrimary ? primaryColor : Colors.white,
          shape: BoxShape.circle,
        ),
        child: Icon(
          icon,
          color:
              type == CircledButtonType.bgPrimary ? Colors.white : primaryColor,
          size: 16,
        ),
      ),
    );
  }
}
