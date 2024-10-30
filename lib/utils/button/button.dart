import 'package:alison_ecommerce/main.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class CustomButton extends StatelessWidget {
  CustomButton(
      {super.key,
      this.buttonColor,
      required this.buttonName,
      required this.onTap});

  final Color? buttonColor;
  final String buttonName;
  final void Function()? onTap;

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: onTap,
      child: Container(
        width: double.infinity,
        decoration: BoxDecoration(
            color: buttonColor ?? Colors.white,
            borderRadius: BorderRadius.circular(28.r)),
        padding: EdgeInsets.symmetric(horizontal: 32.w, vertical: 12.h),
        child: Center(
          child: Text(
            buttonName,
            style: textStyles.fontBlack16,
          ),
        ),
      ),
    );
  }
}
