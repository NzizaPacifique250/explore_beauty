// ignore_for_file: must_be_immutable

import 'package:explore_beauty/utils/constants/constant.dart';
import 'package:flutter/material.dart';

enum RoundedButtonType { bgPrimary, textPrimary }

class RoundedButton extends StatelessWidget {
  final String text;
  final double? width;
  Color? color;
  final VoidCallback onTap;
  final RoundedButtonType type;

  RoundedButton(
      {super.key,
      this.width,
      required this.text,
      required this.onTap,
      this.color,
      this.type = RoundedButtonType.bgPrimary});
  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: onTap,
      child: Container(
        width: width,
        height: width != null ? null : 56,
        padding: width == null
            ? EdgeInsets.symmetric(horizontal: 0)
            : EdgeInsets.symmetric(horizontal: 10),
        alignment: Alignment.center,
        decoration: BoxDecoration(
          border: type == RoundedButtonType.bgPrimary
              ? null
              : Border.all(color: primaryColor, width: 1),
          color:
              type == RoundedButtonType.bgPrimary ? primaryColor : Colors.white,
          borderRadius: BorderRadius.circular(28),
        ),
        child: Text(
          text,
          style: TextStyle(
              color: type == RoundedButtonType.bgPrimary
                  ? Colors.white
                  : primaryColor,
              fontSize: 16,
              fontWeight: FontWeight.w600),
        ),
      ),
    );
  }
}
