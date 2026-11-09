import 'package:flutter/material.dart';
import '../core/routes.dart';
import '../services/notification_service.dart';

class SOSRequestScreen extends StatefulWidget {
  const SOSRequestScreen({super.key});
  @override
  State<SOSRequestScreen> createState() => _SOSRequestScreenState();
}

class _SOSRequestScreenState extends State<SOSRequestScreen> {
  final nameC = TextEditingController();
  final hospitalC = TextEditingController();
  final phoneC = TextEditingController();
  String blood = 'O+';
  final groups = ['A+', 'A-', 'B+', 'B-', 'O+', 'O-', 'AB+', 'AB-'];

  Future<void> sendSOS() async {
    if (nameC.text.isEmpty || hospitalC.text.isEmpty) {
      ScaffoldMessenger.of(context).showSnackBar(const SnackBar(content: Text('রোগীর নাম আর হাসপাতালের নাম দিন')));
      return;
    }
    await NotificationService.showSOS(blood, hospitalC.text);
    if (!mounted) return;
    Navigator.pushNamed(context, Routes.sosSuccess);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('SOS পাঠান')),
      body: Padding(
        padding: const EdgeInsets.all(20),
        child: Column(
          children: [
            TextField(controller: nameC, decoration: const InputDecoration(labelText: 'রোগীর নাম', border: OutlineInputBorder())),
            const SizedBox(height: 12),
            DropdownButtonFormField<String>(
              value: blood,
              decoration: const InputDecoration(labelText: 'রক্তের গ্রুপ', border: OutlineInputBorder()),
              items: groups.map((g) => DropdownMenuItem(value: g, child: Text(g))).toList(),
              onChanged: (v) => setState(() => blood = v!),
            ),
            const SizedBox(height: 12),
            TextField(controller: hospitalC, decoration: const InputDecoration(labelText: 'হাসপাতালের নাম', border: OutlineInputBorder())),
            const SizedBox(height: 12),
            TextField(controller: phoneC, keyboardType: TextInputType.phone, decoration: const InputDecoration(labelText: 'যোগাযোগের নম্বর', border: OutlineInputBorder())),
            const SizedBox(height: 20),
            SizedBox(
              width: double.infinity,
              height: 50,
              child: ElevatedButton(
                onPressed: sendSOS,
                child: const Text('SOS পাঠান'),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
