import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/container.dart';
import 'package:flutter/src/widgets/framework.dart';

class OptionScreem extends StatelessWidget {
  const OptionScreem({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        children: [
          LogoTop(),
          Option(context),
        ],
      ),
    );
  }
}

Widget LogoTop() {
  return Container(
    height: 300,
    child: Center(
      child: Image.asset(
        "lib/assets/logoSplash.png",
        height: 120,
      ),
    ),
  );
}

Widget Option(BuildContext context) {
  return Container(
    decoration: BoxDecoration(
      color: Color(0xffa17bff),
      borderRadius: const BorderRadius.only(
        topLeft: Radius.circular(30),
        topRight: Radius.circular(30),
      ),
      boxShadow: [
        BoxShadow(
          color: Colors.grey.withOpacity(0.8),
          spreadRadius: 4,
          blurRadius: 5,
          offset: const Offset(0, 3),
        ),
      ],
    ),
    child: Padding(
      padding: const EdgeInsets.only(
        right: 40,
        left: 40,
        top: 80,
        bottom: 80,
      ),
      child: Column(
        children: [
          Text(
            "Bem vinda",
            style: TextStyle(
              color: Theme.of(context).colorScheme.secondary,
            ),
          ),
          const SizedBox(
            height: 40,
          ),
          const Text(
              "Dolore cillum et elit culpa id velit exercitation magna et cillum dolore."),
          const SizedBox(
            height: 40,
          )
        ],
      ),
    ),
  );
}
