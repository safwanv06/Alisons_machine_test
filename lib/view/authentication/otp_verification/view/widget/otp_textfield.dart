import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../../../../main.dart';

class OtpTextfield extends StatelessWidget {
  OtpTextfield({super.key, required this.controller, this.isLast});

  final TextEditingController controller;
  final bool? isLast;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(right: 8.0),
      child: SizedBox(
        width: 44.w,
        child: AspectRatio(
          aspectRatio: 1.0,
          child: TextField(
            autofocus: true,
            controller: controller,
            maxLength: 1,
            textInputAction:
                isLast == true ? TextInputAction.done : TextInputAction.next,
            onChanged: (value) {},
            readOnly: false,
            style: textStyles.font16,
            textAlign: TextAlign.center,
            keyboardType: TextInputType.number,
            decoration: InputDecoration(
              contentPadding: EdgeInsets.only(bottom: 4.h),
              counter: const Offstage(),
              enabledBorder: const UnderlineInputBorder(
                  borderSide: BorderSide(color: Colors.white)),
              focusedBorder: const UnderlineInputBorder(
                  borderSide: BorderSide(color: Colors.white)),
            ),
          ),
        ),
      ),
    );
  }
}
