import 'package:flutter/material.dart';
import '../core/routes.dart';

class SOSRequestScreen extends StatefulWidget {
  const SOSRequestScreen({super.key});
  @override
  State<SOSRequestScreen> createState() => _SOSRequestScreenState();
}

class _SOSRequestScreenState extends State<SOSRequestScreen> {
  String selectedGroup = 'O+';
  final groups = ['A+', 'A-', 'B+', 'B-', 'O+', 'O-', 'AB+', 'AB-'];
  final nameCtrl = TextEditingController();
  final hospitalCtrl = TextEditingController();
  final phoneCtrl = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('SOS - জরুরি রক্ত চাই')),
      body: Padding(
        padding: const EdgeInsets.all(20),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            const Text('রক্তের গ্রুপ সিলেক্ট করুন', style: TextStyle(fontWeight: FontWeight.bold)),
            const SizedBox(height: 10),
            Wrap(
              spacing: 8,
              children: groups.map((g) {
                final isSel = g == selectedGroup;
                return ChoiceChip(
                  label: Text(g),
                  selected: isSel,
                  onSelected: (_) => setState(() => selectedGroup = g),
                  selectedColor: Colors.red.shade100,
                );
              }).toList(),
            ),
            const SizedBox(height: 16),
            TextField(controller: nameCtrl, decoration: const InputDecoration(labelText: 'রোগীর নাম', border: OutlineInputBorder())),
            const SizedBox(height: 12),
            TextField(controller: hospitalCtrl, decoration: const InputDecoration(labelText: 'হাসপাতালের নাম ও লোকেশন', border: OutlineInputBorder())),
            const SizedBox(height: 12),
            TextField(controller: phoneCtrl, keyboardType: TextInputType.phone, decoration: const InputDecoration(labelText: 'যোগাযোগের মোবাইল নম্বর', border: OutlineInputBorder())),
            const Spacer(),
            ElevatedButton(
              onPressed: () => Navigator.pushNamed(context, Routes.sosSuccess),
              child: const Text('SOS পাঠান - সব ডোনারকে জানান'),
            ),
          ],
        ),
      ),
    );
  }
}
