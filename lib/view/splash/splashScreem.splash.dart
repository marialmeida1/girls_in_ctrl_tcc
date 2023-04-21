import 'package:flutter/material.dart';

class SplashScreen extends StatelessWidget {
  final Widget myApp;

  const SplashScreen({Key? key, required this.myApp}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return FutureBuilder(
      future: Future.delayed(const Duration(seconds: 4)),
      builder: (context, snapshot) {
        if (snapshot.connectionState == ConnectionState.waiting) {
          return Scaffold(
            backgroundColor: Colors.white,
            body: Container(
              decoration: const BoxDecoration(
                image: DecorationImage(
                  image: AssetImage('lib/assets/fundoSplash.jpg'),
                  fit: BoxFit.contain,
                  alignment: Alignment.center,
                ),
              ),
              child: Center(
                child: Image.asset(
                  "lib/assets/logoSplash.png",
                  height: 120,
                ),
              ),
            ),
          );
        } else {
          return myApp;
        }
      },
    );
  }
}
