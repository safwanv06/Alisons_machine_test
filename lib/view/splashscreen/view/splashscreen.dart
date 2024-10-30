import 'package:alison_ecommerce/main.dart';
import 'package:alison_ecommerce/view/authentication/sign_up/view/sign_up_view.dart';
import 'package:alison_ecommerce/view/home/view/home_view.dart';
import 'package:alison_ecommerce/view/splashscreen/model/model.dart';
import 'package:alison_ecommerce/view/splashscreen/service/service.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';

import '../../authentication/sign_in/view/sign_in_view.dart';

class SplashScreen extends StatelessWidget {
  const SplashScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: FutureBuilder(
        future: SplashScreenService.authStateCheck(),
        builder: (context, AsyncSnapshot<AuthState> snapshot) {
          if (snapshot.hasData) {
            Future.delayed(const Duration(seconds: 3)).then((value) {
              if (snapshot.data == AuthState.authenticated) {
                Navigator.pushReplacement(
                    context,
                    MaterialPageRoute(
                      builder: (context) => const HomeView(),
                    ));
              } else {
                Navigator.pushReplacement(
                    context,
                    MaterialPageRoute(
                      builder: (context) =>  SignInView(),
                    ));
              }
            },);
          }
          return Image(
            image: AssetImage(imageData.splashScreenBackgroundImage),
            fit: BoxFit.fill,
            width: screenUtil.screenWidth,
            height: screenUtil.screenHeight,
          );
        },
      ),
    );
  }
}
