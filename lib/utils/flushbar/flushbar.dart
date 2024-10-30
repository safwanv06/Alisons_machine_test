import 'package:another_flushbar/flushbar.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

void flushBarNotification(
    {required BuildContext context,
    required String title,
    bool? warning,
    bool? success,
    bool? failed}) {
  Color colors;
  String logos;
  Color backgrounds;
  if (success != null && success) {
    backgrounds = Colors.green;
  } else if (warning != null && warning) {
    backgrounds = Colors.orange;
  } else if (failed != null && failed) {
    backgrounds = Colors.red;
  } else {
    backgrounds = Colors.green;
  }

  Flushbar(
    borderRadius: BorderRadius.circular(8),
    backgroundColor: backgrounds,
    padding: EdgeInsets.symmetric(horizontal: 16.w, vertical: 12.h),
    margin: EdgeInsets.symmetric(horizontal: 24.w),
    messageText: Row(
      children: [
        Expanded(
          child: Text(
            title,
            softWrap: true,
            style: TextStyle(
              color: Colors.white,
              fontSize: 14.sp,
            ),
          ),
        ),
      ],
    ),
    duration: const Duration(seconds: 3),
    flushbarPosition: FlushbarPosition.TOP,
  ).show(context);
}
