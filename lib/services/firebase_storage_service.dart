import 'dart:io';

import 'package:amlemeno_assignment_test_himanshu_agrawal/services/notification_service.dart';
import 'package:firebase_storage/firebase_storage.dart';
import 'package:intl/intl.dart';

class FirebaseStorageService {
  void uploadImage(File file) async {
    String fileName = await _getImageFileName(file);
    final storageRef = FirebaseStorage.instance.ref(fileName);
    try {
      await storageRef.putFile(file).whenComplete(() async {
        NotificationService notificationService = NotificationService();
        notificationService.init();
        notificationService.showNotification();
      });
    } on FirebaseException catch (e) {
      print('Error uploading file');
    }
  }

  Future<String> _getImageFileName(File file) async {
    DateTime lastModified = await file.lastModified();
    String formattedDate =
        DateFormat('yyyy-MM-dd – kk:mm:ss').format(lastModified);
    return formattedDate;
  }
}
