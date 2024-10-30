import 'package:alison_ecommerce/main.dart';
import 'package:alison_ecommerce/utils/button/button.dart';
import 'package:alison_ecommerce/utils/flushbar/flushbar.dart';
import 'package:alison_ecommerce/utils/loading_screen/loading_screen.dart';
import 'package:alison_ecommerce/view/authentication/otp_verification/service/service.dart';
import 'package:alison_ecommerce/view/authentication/otp_verification/view/widget/otp_textfield.dart';
import 'package:alison_ecommerce/view/home/view/home_view.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:google_fonts/google_fonts.dart';

class OtpVerificationScreen extends StatelessWidget {
  OtpVerificationScreen({super.key});

  final TextEditingController pinOneController = TextEditingController();
  final TextEditingController pinTwoController = TextEditingController();
  final TextEditingController pinThreeController = TextEditingController();
  final TextEditingController pinFourController = TextEditingController();
  final TextEditingController pinFiveController = TextEditingController();
  final TextEditingController pinSixController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: Stack(
      alignment: Alignment.topLeft,
      children: [
        Image.asset(
          imageData.otpScreenBackgroundImage,
          height: screenUtil.screenHeight,
          width: screenUtil.screenWidth,
          fit: BoxFit.fill,
        ),
        Padding(
          padding: EdgeInsets.all(16.sp),
          child: SafeArea(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                SvgPicture.asset(iconData.backButtonArrow),
                const Spacer(),
                Text(
                  "Verify Email",
                  style: textStyles.font32,
                ),
                SizedBox(
                  height: 16.h,
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.start,
                  children: [
                    ///text field component of otp.
                    OtpTextfield(controller: pinOneController),
                    OtpTextfield(controller: pinTwoController),
                    OtpTextfield(controller: pinThreeController),
                    OtpTextfield(controller: pinFourController),
                    OtpTextfield(controller: pinFiveController),
                    OtpTextfield(
                      controller: pinSixController,
                      isLast: true,
                    ),
                  ],
                ),
                SizedBox(
                  height: 16.h,
                ),
                RichText(
                    text: TextSpan(children: [
                  TextSpan(
                      text: "Didn't receive otp?", style: textStyles.font14),
                  TextSpan(
                      text: " Resent",
                      style: GoogleFonts.rubik(
                          color: Colors.yellow,
                          fontWeight: FontWeight.w400,
                          fontSize: 14.sp,
                          decoration: TextDecoration.underline)),
                ])),
                SizedBox(
                  height: 32.h,
                ),
                CustomButton(
                  buttonName: "Verify",
                  onTap: () {
                    if (pinOneController.text.isNotEmpty &&
                        pinTwoController.text.isNotEmpty &&
                        pinThreeController.text.isNotEmpty &&
                        pinFourController.text.isNotEmpty &&
                        pinFiveController.text.isNotEmpty &&
                        pinSixController.text.isNotEmpty) {
                      loadingScreen(context);
                      OtpVerificationService.submitOtp(
                              otp: pinOneController.text +
                                  pinTwoController.text +
                                  pinThreeController.text +
                                  pinFourController.text +
                                  pinFiveController.text +
                                  pinSixController.text)
                          .then(
                        (value) {
                          Navigator.pop(context);
                          Navigator.pushReplacement(
                              context,
                              MaterialPageRoute(
                                builder: (context) => HomeView(),
                              ));
                        },
                      ).onError(
                        (error, stackTrace) {
                          Navigator.pop(context);
                          flushBarNotification(
                              context: context,
                              title: "Verification failed",
                              failed: true);
                        },
                      );
                    } else {
                      flushBarNotification(
                          context: context,
                          title: "Enter all fields",
                          failed: true);
                    }
                  },
                ),
                const Spacer()
              ],
            ),
          ),
        )
      ],
    ));
  }
}
