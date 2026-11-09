import 'package:flutter/material.dart';
import '../core/routes.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('RedLoop - Blood Donation'),
        actions: [
          IconButton(
            icon: const Icon(Icons.admin_panel_settings),
            onPressed: () => Navigator.pushNamed(context, Routes.admin),
          ),
        ],
      ),
      body: Padding(
        padding: const EdgeInsets.all(20),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            Container(
              padding: const EdgeInsets.all(20),
              decoration: BoxDecoration(
                color: const Color(0xFFFFEBEE),
                borderRadius: BorderRadius.circular(16),
              ),
              child: const Column(
                children: [
                  Icon(Icons.bloodtype, size: 50, color: Colors.red),
                  SizedBox(height: 10),
                  Text('রক্ত দরকার?',
                      style: TextStyle(fontSize: 22, fontWeight: FontWeight.bold),
                      textAlign: TextAlign.center),
                  SizedBox(height: 8),
                  Text('একজন ডোনার খুঁজুন বা SOS পাঠান, কাছাকাছি ডোনাররা এগিয়ে আসবে',
                      textAlign: TextAlign.center),
                ],
              ),
            ),
            const SizedBox(height: 24),
            ElevatedButton.icon(
              onPressed: () => Navigator.pushNamed(context, Routes.sosRequest),
              icon: const Icon(Icons.emergency),
              label: const Text('SOS পাঠান - রক্ত দরকার'),
            ),
            const SizedBox(height: 12),
            OutlinedButton.icon(
              onPressed: () => Navigator.pushNamed(context, Routes.donorSearch),
              icon: const Icon(Icons.search),
              label: const Text('ডোনার খুঁজুন'),
            ),
            const SizedBox(height: 12),
            OutlinedButton.icon(
              onPressed: () => Navigator.pushNamed(context, Routes.donorRegister),
              icon: const Icon(Icons.favorite),
              label: const Text('ডোনার হিসেবে রেজিস্টার করুন'),
            ),
            const Spacer(),
            const Text('RedLoop - Dhaka, Bangladesh',
                textAlign: TextAlign.center,
                style: TextStyle(color: Colors.grey)),
          ],
        ),
      ),
    );
  }
}
