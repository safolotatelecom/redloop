import 'package:flutter_local_notifications/flutter_local_notifications.dart';

class NotificationService {
  static final _plugin = FlutterLocalNotificationsPlugin();

  static Future<void> init() async {
    const android = AndroidInitializationSettings('@mipmap/ic_launcher');
    const settings = InitializationSettings(android: android);
    await _plugin.initialize(settings);
    await _plugin.resolvePlatformSpecificImplementation<AndroidFlutterLocalNotificationsPlugin>()?.requestNotificationsPermission();
  }

  static Future<void> showSOS(String blood, String area) async {
    const details = NotificationDetails(
      android: AndroidNotificationDetails(
        'sos_channel', 'SOS Alerts',
        importance: Importance.max, priority: Priority.high,
      ),
    );
    await _plugin.show(0, '🩸 জরুরি রক্ত দরকার! $blood', '$area এলাকায় রক্ত দরকার। এগিয়ে আসুন।', details);
  }

  static Future<void> showWelcome(String name) async {
    const details = NotificationDetails(
      android: AndroidNotificationDetails('donor_channel', 'Donor',
        importance: Importance.max, priority: Priority.high),
    );
    await _plugin.show(1, 'ধন্যবাদ $name!', 'আপনি RedLoop ডোনার হিসেবে রেজিস্টার হয়েছেন।', details);
  }
}
