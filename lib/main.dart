import 'package:amlemeno_assignment_test_himanshu_agrawal/screens/home_screen.dart';
import 'package:amlemeno_assignment_test_himanshu_agrawal/services/notification_service.dart';
import 'package:amlemeno_assignment_test_himanshu_agrawal/theme.dart';
import 'package:camera/camera.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';

import 'firebase_options.dart';

late List<CameraDescription> cameras;

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp(
    options: DefaultFirebaseOptions.currentPlatform,
  );
  NotificationService.askNotificationsPermissions();
  cameras = await availableCameras();
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Alemeno Assignment Himanshu Agrawal',
      theme: ThemeData(
        primaryColor: CustomAppTheme.primaryColor,
        fontFamily: CustomAppTheme.fontFamily,
        scaffoldBackgroundColor: Colors.white,
        textTheme: TextTheme(
          titleMedium: CustomAppTheme.mediumTitle,
          displayLarge: CustomAppTheme.largeDisplay,
        ),
        appBarTheme: CustomAppTheme.appBarTheme,
      ),
      home: const HomeScreen(),
    );
  }
}
