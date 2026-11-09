import 'package:flutter/material.dart';
import '../screens/home_screen.dart';
import '../screens/sos_request_screen.dart';
import '../screens/sos_success_screen.dart';
import '../screens/admin/admin_dashboard.dart';

class Routes {
  static const String home = '/';
  static const String sosRequest = '/sos-request';
  static const String sosSuccess = '/sos-success';
  static const String admin = '/admin';

  static Map<String, WidgetBuilder> map = {
    home: (context) => const HomeScreen(),
    sosRequest: (context) => const SOSRequestScreen(),
    sosSuccess: (context) => const SOSSuccessScreen(),
    admin: (context) => const AdminDashboard(),
  };
}
