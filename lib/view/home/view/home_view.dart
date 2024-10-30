import 'package:alison_ecommerce/main.dart';
import 'package:alison_ecommerce/utils/loading_screen/loading_screen.dart';
import 'package:alison_ecommerce/view/authentication/sign_in/view/sign_in_view.dart';
import 'package:alison_ecommerce/view/home/service/service.dart';
import 'package:flutter/material.dart';

class HomeView extends StatelessWidget {
  const HomeView({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        actions: [InkWell(
            onTap: () async{
              loadingScreen(context);
              await sharedPreferenceModel.clear();
              Navigator.pushReplacement(context, MaterialPageRoute(builder: (context) => SignInView(),));
            },
            child: Icon(Icons.logout))],
      ),
      body: FutureBuilder(
          future: HomeService().getHomeScreenData(),
          builder: (context, snapshot) {
            if (snapshot.connectionState == ConnectionState.waiting) {
              return Center(child: CircularProgressIndicator());
            } else if (snapshot.hasData) {
              return Text(snapshot.data.toString());
            } else {
              return Text("No Data");
            }
          }),
    );
  }
}
