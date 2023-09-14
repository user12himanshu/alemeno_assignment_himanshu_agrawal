import 'package:awesome_notifications/awesome_notifications.dart';

class NotificationService {
  AwesomeNotifications awesomeNotifications = AwesomeNotifications();
  final String notificationChannelKey = 'alemeno_test';

  void init() async {
    awesomeNotifications.initialize('resource://drawable/ic_launcher', [
      NotificationChannel(
        channelGroupKey: 'alemeno',
        channelKey: notificationChannelKey,
        channelName: 'Alemeno Assignment',
        channelDescription: 'Notification channel for Alemeno Assignment',
        channelShowBadge: true,
        importance: NotificationImportance.High,
        enableVibration: true,
      ),
    ]);
  }

  void showNotification() {
    awesomeNotifications.createNotification(
        content: NotificationContent(
            id: 123,
            channelKey: notificationChannelKey,
            title: 'Thank you for sharing food with me',
            body: ''));
  }

  static void askNotificationsPermissions() async {
    bool isallowed = await AwesomeNotifications().isNotificationAllowed();
    if (!isallowed) {
      AwesomeNotifications().requestPermissionToSendNotifications();
    }
  }
}
