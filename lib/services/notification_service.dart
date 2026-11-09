import 'package:flutter/material.dart';

class NotificationService {
  static Future<void> init() async {
    // এখন কোনো প্লাগইন লাগবে না
  }

  static Future<void> showSOS(String blood, String area) async {
    // SOS পাঠালে অ্যাপের ভিতরে মেসেজ দেখাবে
    debugPrint('SOS: $blood needed in $area');
  }

  static Future<void> showWelcome(String name) async {
    debugPrint('Welcome: $name');
  }
}
