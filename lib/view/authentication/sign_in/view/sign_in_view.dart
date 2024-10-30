import 'package:alison_ecommerce/main.dart';
import 'package:alison_ecommerce/utils/button/button.dart';
import 'package:alison_ecommerce/utils/flushbar/flushbar.dart';
import 'package:alison_ecommerce/utils/loading_screen/loading_screen.dart';
import 'package:alison_ecommerce/view/authentication/sign_in/service/model/model.dart';
import 'package:alison_ecommerce/view/authentication/sign_in/service/service.dart';
import 'package:alison_ecommerce/view/authentication/sign_up/view/sign_up_view.dart';
import 'package:alison_ecommerce/view/home/view/home_view.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/flutter_svg.dart';

import '../../../../utils/textfield/text_field.dart';
import '../controller/controller.dart';

class SignInView extends StatelessWidget {
  SignInView({super.key});

  final TextEditingController emailController = TextEditingController();
  final TextEditingController passwordController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      resizeToAvoidBottomInset: false,
      body: Stack(
        children: [
          Image.asset(
            imageData.signInBackgroundImage,
            width: screenUtil.screenWidth,
            height: screenUtil.screenHeight,
            fit: BoxFit.fill,
            colorBlendMode: BlendMode.darken,
          ),
          SafeArea(
            child: Padding(
              padding: EdgeInsets.all(16.sp),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Text(
                    "Sign In",
                    style: textStyles.font32,
                  ),
                  SizedBox(
                    height: 8.h,
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
                  Row(
                    mainAxisAlignment: MainAxisAlignment.end,
                    children: [
                      Text(
                        "Forgot Password?",
                        style: textStyles.font14,
                      )
                    ],
                  ),
                  SizedBox(
                    height: 16.h,
                  ),
                  CustomButton(
                    buttonName: "Sign In",
                    onTap: () {
                      SignInModel signInModel = SignInModel(email: emailController.text, password: passwordController.text);
                      if(!isSignInValid(signInModel: signInModel)){
                        loadingScreen(context);
                        SignInService().signIn(signInModel: signInModel).then((value) {
                          Navigator.pop(context);
                          Navigator.pushReplacement(context, MaterialPageRoute(builder: (context) => HomeView(),));
                        },).onError((error, stackTrace) {
                          Navigator.pop(context);
                          flushBarNotification(context: context, title: "Sign in failed! please try again.",failed: true);
                        },);
                      }else{
                        flushBarNotification(context: context, title: "Enter valid credentials",failed: true);
                      }
                    },
                  ),
                  SizedBox(
                    height: 48.h,
                  ),
                  InkWell(
                      onTap: () {
                        Navigator.push(
                            context,
                            MaterialPageRoute(
                              builder: (context) => SignUpView(),
                            ));
                      },
                      child: Text(
                        "Don’t Have a account? Create Account",
                        style: textStyles.font14,
                      ))
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}
