import 'package:amlemeno_assignment_test_himanshu_agrawal/screens/capture_meal.dart';
import 'package:amlemeno_assignment_test_himanshu_agrawal/widgets/largeButton.dart';
import 'package:flutter/material.dart';
import 'package:lottie/lottie.dart';

import '../widgets/background_container.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return SafeArea(
        child: Scaffold(
      extendBodyBehindAppBar: true,
      appBar: AppBar(),
      body: Column(
        children: [
          BackgroundContainer(
            isOnTop: true,
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Lottie.asset('assets/lottie/tiger.json',
                    repeat: false, height: 300),
                const SizedBox(
                  height: 10,
                ),
                Text(
                  'Help the animal grow \nby feeding it!',
                  style: Theme.of(context).textTheme.titleMedium,
                  textAlign: TextAlign.center,
                )
              ],
            ),
          ),
          const Spacer(),
          Padding(
            padding: const EdgeInsets.only(bottom: 50),
            child: LargeButton(
                onPressed: () {
                  navigateToCaptureMeal(context);
                },
                text: "Share your meal"),
          )
        ],
      ),
    ));
  }

  void navigateToCaptureMeal(BuildContext context) {
    Navigator.push(
        context, MaterialPageRoute(builder: (context) => CaptureMealScreen()));
  }
}
