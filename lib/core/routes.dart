import 'package:flutter/material.dart';
import '../screens/home_screen.dart';
import '../screens/sos_request_screen.dart';
import '../screens/sos_success_screen.dart';
import '../screens/admin/admin_dashboard.dart';
import '../screens/donor_search_screen.dart';
import '../screens/donor_register_screen.dart';

class Routes {
  static const String home = '/';
  static const String sosRequest = '/sos-request';
  static const String sosSuccess = '/sos-success';
  static const String admin = '/admin';
  static const String donorSearch = '/donor-search';
  static const String donorRegister = '/donor-register';

  static Map<String, WidgetBuilder> map = {
    home: (context) => const HomeScreen(),
    sosRequest: (context) => const SOSRequestScreen(),
    sosSuccess: (context) => const SOSSuccessScreen(),
    admin: (context) => const AdminDashboard(),
    donorSearch: (context) => const DonorSearchScreen(),
    donorRegister: (context) => const DonorRegisterScreen(),
  };
}
