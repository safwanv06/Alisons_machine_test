import 'package:alison_ecommerce/main.dart';
import 'package:alison_ecommerce/utils/button/button.dart';
import 'package:alison_ecommerce/utils/flushbar/flushbar.dart';
import 'package:alison_ecommerce/utils/loading_screen/loading_screen.dart';
import 'package:alison_ecommerce/utils/textfield/text_field.dart';
import 'package:alison_ecommerce/view/authentication/sign_up/controller/controller.dart';
import 'package:alison_ecommerce/view/authentication/sign_up/service/service.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:google_fonts/google_fonts.dart';

import '../../otp_verification/view/otp_verification_screen.dart';
import '../service/model/model.dart';

class SignUpView extends StatelessWidget {
  SignUpView({super.key});

  final TextEditingController nameController = TextEditingController();
  final TextEditingController phoneController = TextEditingController();
  final TextEditingController emailController = TextEditingController();
  final TextEditingController passwordController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        height: screenUtil.screenHeight,
        width: screenUtil.screenWidth,
        decoration: BoxDecoration(
            image: DecorationImage(
                colorFilter:
                    const ColorFilter.mode(Colors.black12, BlendMode.darken),
                fit: BoxFit.fill,
                image: AssetImage(imageData.signUpBackgroundImage))),
        child: SafeArea(
          child: Padding(
            padding: EdgeInsets.all(16.sp),
            child: SingleChildScrollView(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  InkWell(
                      onTap: () {
                        Navigator.pop(context);
                      },
                      child: SvgPicture.asset(iconData.backButtonArrow)),
                  SizedBox(
                    height: 36.h,
                  ),
                  Text(
                    "Create Account",
                    style: textStyles.font32,
                  ),
                  SizedBox(
                    height: 30.h,
                  ),
                  CustomTextField(
                    hintText: "Full Name",
                    prefix: Icon(
                      Icons.person,
                      color: Colors.white,
                      size: 18.sp,
                    ),
                    textEditingController: nameController,
                    onChanged: (text) {},
                  ),
                  CustomTextField(
                    prefix: Icon(
                      Icons.phone,
                      color: Colors.white,
                      size: 18.sp,
                    ),
                    hintText: "Phone Number",
                    textEditingController: phoneController,
                    onChanged: (text) {},
                  ),
                  CustomTextField(
                    prefix: Icon(
                      Icons.mail_rounded,
                      color: Colors.white,
                      size: 18.sp,
                    ),
                    hintText: "E mail",
                    textEditingController: emailController,
                    onChanged: (text) {},
                  ),
                  CustomTextField(
                    prefix: Icon(
                      Icons.lock,
                      color: Colors.white,
                      size: 18.sp,
                    ),
                    hintText: "Password",
                    textEditingController: passwordController,
                    onChanged: (text) {},
                  ),
                  Text(
                    "Password must contain minimum 6 characters, at least one upper case and one lower case",
                    style: textStyles.font16,
                  ),
                  SizedBox(
                    height: 36.h,
                  ),
                  RichText(
                      text: TextSpan(children: [
                    TextSpan(
                        text: "By signing up, you agree with our ",
                        style: textStyles.font14),
                    TextSpan(
                        text: "Terms & Conditions ",
                        style: GoogleFonts.rubik(
                            color: Colors.yellow,
                            fontWeight: FontWeight.w400,
                            fontSize: 14.sp)),
                    TextSpan(text: "and ", style: textStyles.font14),
                    TextSpan(
                        text: "Privacy Policy",
                        style: GoogleFonts.rubik(
                            color: Colors.yellow,
                            fontWeight: FontWeight.w400,
                            fontSize: 14.sp)),
                  ])),
                  SizedBox(
                    height: 30.h,
                  ),
                  CustomButton(
                    buttonName: "Sign Up",
                    onTap: () async {
                      SignUpModel signUpModel = SignUpModel(
                          name: nameController.text,
                          phone: phoneController.text,
                          mail: emailController.text,
                          password: passwordController.text);
                      if (validateSignUpData(signUpModel: signUpModel)) {
                        flushBarNotification(
                            context: context,
                            title: "Enter valid data",
                            failed: true);
                      } else {
                        loadingScreen(context);
                        SignUpService().signUp(signUpModel: signUpModel).then(
                          (value) {
                            Navigator.pop(context);
                            Navigator.pushReplacement(
                                context,
                                MaterialPageRoute(
                                  builder: (context) => OtpVerificationScreen(),
                                ));
                            flushBarNotification(
                                context: context,
                                title: "Verify your account to continue",
                                warning: true);
                          },
                        ).onError(
                          (error, stackTrace) {
                            Navigator.pop(context);
                            flushBarNotification(
                                context: context, title: "Registration failed");
                          },
                        );
                      }
                    },
                  )
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}
