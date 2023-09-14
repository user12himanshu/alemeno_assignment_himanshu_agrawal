import 'dart:io';

import 'package:amlemeno_assignment_test_himanshu_agrawal/screens/feedback_screen.dart';
import 'package:amlemeno_assignment_test_himanshu_agrawal/services/firebase_storage_service.dart';
import 'package:flutter/material.dart';

import '../widgets/background_container.dart';
import '../widgets/custom_back_button.dart';
import '../widgets/custom_icon_button.dart';
import '../widgets/image_container.dart';

class FeedMealScreen extends StatelessWidget {
  final File file;
  FirebaseStorageService storageService = FirebaseStorageService();

  FeedMealScreen({super.key, required this.file});

  @override
  Widget build(BuildContext context) {
    return SafeArea(
        child: Scaffold(
      appBar: AppBar(
        automaticallyImplyLeading: false,
        leading: const CustomBackButton(),
      ),
      body: Column(
        mainAxisAlignment: MainAxisAlignment.end,
        children: [
          Image.asset('assets/images/animal.png'),
          BackgroundContainer(
            isOnTop: false,
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Padding(
                  padding: const EdgeInsets.all(23.0),
                  child: Stack(alignment: Alignment.center, children: [
                    ImageContainer(
                      child: ClipOval(
                          child: Image.file(
                        file,
                        fit: BoxFit.fill,
                      )),
                    ),
                  ]),
                ),
                Text(
                  'Will you eat this?',
                  style: Theme.of(context).textTheme.titleMedium,
                ),
                const SizedBox(
                  height: 11,
                ),
                CustomIconButton(
                    onPressed: () {
                      storageService.uploadImage(file);
                      navigateToFeedbackScreen(context);
                    },
                    assetPath: 'assets/svg/tick.svg',
                    buttonSize: 64),
              ],
            ),
          )
        ],
      ),
    ));
  }

  void navigateToFeedbackScreen(BuildContext context) {
    Navigator.push(context,
        MaterialPageRoute(builder: (context) => const FeedbackScreen()));
  }
}
