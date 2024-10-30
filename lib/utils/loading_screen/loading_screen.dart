import 'package:flutter/material.dart';


loadingScreen(context) {
  showDialog(
    barrierDismissible: false,
    context: context,
    builder: (context) {
      return const LoaderScreen();
    },
  );
}

class LoaderScreen extends StatelessWidget {
  const LoaderScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return const Center(
      child: CircularProgressIndicator(),
    );
  }
}
