import 'package:flutter/material.dart';

class AdminDashboard extends StatelessWidget {
  const AdminDashboard({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('Admin Dashboard')),
      body: Padding(
        padding: const EdgeInsets.all(20),
        child: Column(
          children: [
            Row(
              children: [
                Expanded(child: _card('মোট SOS', '24', Colors.red)),
                const SizedBox(width: 12),
                Expanded(child: _card('সফল ডোনেশন', '18', Colors.green)),
              ],
            ),
            const SizedBox(height: 12),
            Row(
              children: [
                Expanded(child: _card('মোট ডোনার', '156', Colors.blue)),
                const SizedBox(width: 12),
                Expanded(child: _card('পেন্ডিং', '6', Colors.orange)),
              ],
            ),
            const SizedBox(height: 24),
            const Align(
              alignment: Alignment.centerLeft,
              child: Text('সাম্প্রতিক SOS রিকোয়েস্ট', style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold)),
            ),
            const SizedBox(height: 12),
            Expanded(
              child: ListView(
                children: const [
                  ListTile(leading: CircleAvatar(child: Text('O+')), title: Text('O+ রক্ত দরকার - Dhaka Medical'), subtitle: Text('017XX-XXXXXX • 10 মিনিট আগে'), trailing: Chip(label: Text('Active'))),
                  ListTile(leading: CircleAvatar(child: Text('B-')), title: Text('B- রক্ত দরকার - Square Hospital'), subtitle: Text('018XX-XXXXXX • 1 ঘণ্টা আগে'), trailing: Chip(label: Text('Done'))),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }

  Widget _card(String title, String value, Color color) {
    return Container(
      padding: const EdgeInsets.all(16),
      decoration: BoxDecoration(color: color.withOpacity(0.1), borderRadius: BorderRadius.circular(12)),
      child: Column(
        children: [
          Text(value, style: TextStyle(fontSize: 28, fontWeight: FontWeight.bold, color: color)),
          Text(title),
        ],
      ),
    );
  }
}
