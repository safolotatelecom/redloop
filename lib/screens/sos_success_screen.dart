import 'package:flutter/material.dart';
import '../core/routes.dart';

class SOSSuccessScreen extends StatelessWidget {
  const SOSSuccessScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Padding(
        padding: const EdgeInsets.all(24),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            const Text('✅', style: TextStyle(fontSize: 80), textAlign: TextAlign.center),
            const SizedBox(height: 20),
            const Text('SOS সফলভাবে পাঠানো হয়েছে!',
              style: TextStyle(fontSize: 24, fontWeight: FontWeight.bold),
              textAlign: TextAlign.center,
            ),
            const SizedBox(height: 12),
            const Text('আশেপাশের ১২ জন ডোনারকে নোটিফিকেশন গেছে। কেউ রেসপন্ড করলেই আপনাকে কল করা হবে।',
              textAlign: TextAlign.center,
              style: TextStyle(fontSize: 16, color: Colors.grey),
            ),
            const SizedBox(height: 32),
            ElevatedButton(
              onPressed: () => Navigator.pushNamedAndRemoveUntil(context, Routes.home, (r) => false),
              child: const Text('হোমে ফিরে যান'),
            ),
          ],
        ),
      ),
    );
  }
}
