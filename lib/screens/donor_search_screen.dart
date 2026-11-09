import 'package:flutter/material.dart';
import 'package:url_launcher/url_launcher.dart';
import '../services/database_service.dart';

class DonorSearchScreen extends StatefulWidget {
  const DonorSearchScreen({super.key});
  @override
  State<DonorSearchScreen> createState() => _DonorSearchScreenState();
}

class _DonorSearchScreenState extends State<DonorSearchScreen> {
  String selected = 'সব';
  List<Map<String, String>> donors = [];
  bool isLoading = true;
  final groups = ['সব', 'A+', 'A-', 'B+', 'B-', 'O+', 'O-', 'AB+', 'AB-'];

  @override
  void initState() {
    super.initState();
    loadDonors();
  }

  Future<void> loadDonors() async {
    final data = await DatabaseService.getDonors();
    setState(() {
      donors = data;
      isLoading = false;
    });
  }

  Future<void> makeCall(String phone) async {
    final uri = Uri.parse('tel:$phone');
    if (await canLaunchUrl(uri)) {
      await launchUrl(uri);
    } else {
      if (!mounted) return;
      ScaffoldMessenger.of(context).showSnackBar(SnackBar(content: Text('কল করা যাচ্ছে না: $phone')));
    }
  }

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
            child: isLoading
                ? const Center(child: CircularProgressIndicator())
                : list.isEmpty
                    ? const Center(child: Text('এই গ্রুপের ডোনার পাওয়া যায়নি'))
                    : RefreshIndicator(
                        onRefresh: loadDonors,
                        child: ListView.builder(
                          itemCount: list.length,
                          itemBuilder: (c, i) {
                            final d = list[i];
                            return Card(
                              margin: const EdgeInsets.symmetric(horizontal: 12, vertical: 6),
                              child: ListTile(
                                leading: CircleAvatar(child: Text(d['blood'] ?? '')),
                                title: Text(d['name'] ?? ''),
                                subtitle: Text(d['area'] ?? ''),
                                trailing: IconButton(
                                  icon: const Icon(Icons.call, color: Colors.green),
                                  onPressed: () => makeCall(d['phone'] ?? ''),
                                ),
                              ),
                            );
                          },
                        ),
                      ),
          ),
        ],
      ),
    );
  }
}
