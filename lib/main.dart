import 'package:alison_ecommerce/utils/api_routes/api_routes.dart';
import 'package:alison_ecommerce/utils/shared_data/image_path.dart';
import 'package:alison_ecommerce/utils/shared_preference/shared_preference.dart';
import 'package:alison_ecommerce/utils/style/text_style.dart';
import 'package:alison_ecommerce/view/splashscreen/view/splashscreen.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

ApiRoutes apiRoutes = ApiRoutes();
SharedPreferenceModel sharedPreferenceModel = SharedPreferenceModel();
ImageData imageData = ImageData();
TextStyles textStyles = TextStyles();
IconImageData iconData = IconImageData();
ScreenUtil screenUtil = ScreenUtil();


void main() {
  WidgetsFlutterBinding.ensureInitialized();
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return ScreenUtilInit(
      designSize: Size(390, 844),
      builder: (context, child) {
        return MaterialApp(
          title: 'Alisons',
          debugShowCheckedModeBanner: false,
          theme: ThemeData(
            colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
            useMaterial3: true,
          ),
          home: SplashScreen(),
        );
      },
    );
  }
}
