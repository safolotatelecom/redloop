import 'dart:convert';
import 'package:shared_preferences/shared_preferences.dart';

class DatabaseService {
  static const String _key = 'donors_list';

  // ডোনার সেভ করা
  static Future<void> saveDonor(Map<String, String> donor) async {
    final prefs = await SharedPreferences.getInstance();
    final list = await getDonors();
    list.add(donor);
    await prefs.setString(_key, jsonEncode(list));
  }

  // সব ডোনার আনা
  static Future<List<Map<String, String>>> getDonors() async {
    final prefs = await SharedPreferences.getInstance();
    final data = prefs.getString(_key);
    if (data == null) {
      // প্রথমবার ডেমো ডাটা
      return [
        {'name': 'রাহিম উদ্দিন', 'blood': 'O+', 'area': 'ঢাকা - মিরপুর', 'phone': '01711-123456'},
        {'name': 'সুমাইয়া আক্তার', 'blood': 'B+', 'area': 'ঢাকা - উত্তরা', 'phone': '01811-234567'},
        {'name': 'করিম শেখ', 'blood': 'A+', 'area': 'ঢাকা - ধানমন্ডি', 'phone': '01911-345678'},
        {'name': 'নুসরাত জাহান', 'blood': 'O-', 'area': 'ঢাকা - মোহাম্মদপুর', 'phone': '01611-456789'},
        {'name': 'আরিফ হোসেন', 'blood': 'AB+', 'area': 'ঢাকা - বনানী', 'phone': '01511-567890'},
      ];
    }
    final decoded = jsonDecode(data) as List;
    return decoded.map((e) => Map<String, String>.from(e)).toList();
  }
}
