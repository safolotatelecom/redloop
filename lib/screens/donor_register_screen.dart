import 'package:flutter/material.dart';

class DonorRegisterScreen extends StatefulWidget {
  const DonorRegisterScreen({super.key});
  @override
  State<DonorRegisterScreen> createState() => _DonorRegisterScreenState();
}

class _DonorRegisterScreenState extends State<DonorRegisterScreen> {
  final nameC = TextEditingController();
  final phoneC = TextEditingController();
  final areaC = TextEditingController();
  String blood = 'O+';
  final groups = ['A+', 'A-', 'B+', 'B-', 'O+', 'O-', 'AB+', 'AB-'];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('ডোনার হিসেবে রেজিস্টার করুন')),
      body: Padding(
        padding: const EdgeInsets.all(20),
        child: Column(
          children: [
            TextField(controller: nameC, decoration: const InputDecoration(labelText: 'আপনার নাম', border: OutlineInputBorder())),
            const SizedBox(height: 12),
            TextField(controller: phoneC, keyboardType: TextInputType.phone, decoration: const InputDecoration(labelText: 'মোবাইল নম্বর', border: OutlineInputBorder())),
            const SizedBox(height: 12),
            TextField(controller: areaC, decoration: const InputDecoration(labelText: 'এলাকা / লোকেশন', border: OutlineInputBorder())),
            const SizedBox(height: 12),
            DropdownButtonFormField<String>(
              value: blood,
              decoration: const InputDecoration(labelText: 'রক্তের গ্রুপ', border: OutlineInputBorder()),
              items: groups.map((g) => DropdownMenuItem(value: g, child: Text(g))).toList(),
              onChanged: (v) => setState(() => blood = v!),
            ),
            const SizedBox(height: 20),
            SizedBox(
              width: double.infinity,
              height: 50,
              child: ElevatedButton(
                onPressed: () {
                  if (nameC.text.isEmpty || phoneC.text.isEmpty) {
                    ScaffoldMessenger.of(context).showSnackBar(const SnackBar(content: Text('নাম আর মোবাইল নম্বর দিন')));
                    return;
                  }
                  ScaffoldMessenger.of(context).showSnackBar(const SnackBar(content: Text('ধন্যবাদ! রেজিস্ট্রেশন সফল হয়েছে')));
                  Navigator.pop(context);
                },
                child: const Text('রেজিস্টার করুন'),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
