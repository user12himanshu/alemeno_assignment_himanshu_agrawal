import 'dart:io';

import 'package:amlemeno_assignment_test_himanshu_agrawal/screens/feed_meal_screen.dart';
import 'package:amlemeno_assignment_test_himanshu_agrawal/services/camera_service.dart';
import 'package:amlemeno_assignment_test_himanshu_agrawal/widgets/background_container.dart';
import 'package:amlemeno_assignment_test_himanshu_agrawal/widgets/camera_circle.dart';
import 'package:amlemeno_assignment_test_himanshu_agrawal/widgets/custom_icon_button.dart';
import 'package:camera/camera.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';

import '../widgets/custom_back_button.dart';
import '../widgets/image_container.dart';

class CaptureMealScreen extends StatelessWidget {
  CaptureMealScreen({super.key});

  CameraService cameraService = CameraService();

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
                    SvgPicture.asset('assets/svg/cutlery_with_frame.svg'),
                    ImageContainer(
                      child: CameraCircle(
                        cameraService: cameraService,
                      ),
                    ),
                  ]),
                ),
                Text(
                  'Click your meal',
                  style: Theme.of(context).textTheme.titleMedium,
                ),
                const SizedBox(
                  height: 11,
                ),
                CustomIconButton(
                    onPressed: () async {
                      try {
                        XFile file = await cameraService.takePicture();
                        routeToFeedScreenPage(context, file);
                      } catch (e) {
                        return;
                      }
                    },
                    assetPath: 'assets/svg/camera_logo.svg',
                    buttonSize: 64),
              ],
            ),
          )
        ],
      ),
    ));
  }

  void routeToFeedScreenPage(BuildContext context, file) {
    Navigator.push(
        context,
        MaterialPageRoute(
            builder: (context) => FeedMealScreen(file: File(file.path))));
  }
}
