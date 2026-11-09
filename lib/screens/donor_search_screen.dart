import 'package:flutter/material.dart';

class DonorSearchScreen extends StatefulWidget {
  const DonorSearchScreen({super.key});
  @override
  State<DonorSearchScreen> createState() => _DonorSearchScreenState();
}

class _DonorSearchScreenState extends State<DonorSearchScreen> {
  String selected = 'সব';
  final donors = [
    {'name': 'রাহিম উদ্দিন', 'blood': 'O+', 'area': 'ঢাকা - মিরপুর', 'phone': '01711-123456'},
    {'name': 'সুমাইয়া আক্তার', 'blood': 'B+', 'area': 'ঢাকা - উত্তরা', 'phone': '01811-234567'},
    {'name': 'করিম শেখ', 'blood': 'A+', 'area': 'ঢাকা - ধানমন্ডি', 'phone': '01911-345678'},
    {'name': 'নুসরাত জাহান', 'blood': 'O-', 'area': 'ঢাকা - মোহাম্মদপুর', 'phone': '01611-456789'},
    {'name': 'আরিফ হোসেন', 'blood': 'AB+', 'area': 'ঢাকা - বনানী', 'phone': '01511-567890'},
  ];
  final groups = ['সব', 'A+', 'A-', 'B+', 'B-', 'O+', 'O-', 'AB+', 'AB-'];

  @override
  Widget build(BuildContext context) {
    final list = selected == 'সব' ? donors : donors.where((d) => d['blood'] == selected).toList();
    return Scaffold(
      appBar: AppBar(title: const Text('ডোনার খুঁজুন')),
      body: Column(
        children: [
          SizedBox(
            height: 60,
            child: ListView(
              scrollDirection: Axis.horizontal,
              padding: const EdgeInsets.all(8),
              children: groups.map((g) => Padding(
                padding: const EdgeInsets.only(right: 6),
                child: ChoiceChip(
                  label: Text(g),
                  selected: selected == g,
                  onSelected: (_) => setState(() => selected = g),
                ),
              )).toList(),
            ),
          ),
          Expanded(
            child: list.isEmpty
                ? const Center(child: Text('এই গ্রুপের ডোনার পাওয়া যায়নি'))
                : ListView.builder(
                    itemCount: list.length,
                    itemBuilder: (c, i) {
                      final d = list[i];
                      return Card(
                        margin: const EdgeInsets.symmetric(horizontal: 12, vertical: 6),
                        child: ListTile(
                          leading: CircleAvatar(child: Text(d['blood']!)),
                          title: Text(d['name']!),
                          subtitle: Text('${d['area']}'),
                          trailing: IconButton(
                            icon: const Icon(Icons.call, color: Colors.green),
                            onPressed: () {
                              ScaffoldMessenger.of(context).showSnackBar(SnackBar(content: Text('কল করছেন: ${d['phone']}')));
                            },
                          ),
                        ),
                      );
                    },
                  ),
          ),
        ],
      ),
    );
  }
}
