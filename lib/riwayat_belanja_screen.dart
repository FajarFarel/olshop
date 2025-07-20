import 'dart:convert';
import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';

class RiwayatBelanjaScreen extends StatefulWidget {
  const RiwayatBelanjaScreen({super.key});

  @override
  State<RiwayatBelanjaScreen> createState() => _RiwayatBelanjaScreenState();
}

class _RiwayatBelanjaScreenState extends State<RiwayatBelanjaScreen> {
  List<List<dynamic>> riwayatBelanja = [];

  @override
  void initState() {
    super.initState();
    _loadRiwayat();
  }

  Future<void> _loadRiwayat() async {
    final prefs = await SharedPreferences.getInstance();
    List<String> data = prefs.getStringList('riwayat') ?? [];
    List<List<dynamic>> result = data.map((e) => jsonDecode(e) as List<dynamic>).toList();

    setState(() {
      riwayatBelanja = result;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xFFFFF4E6),
      appBar: AppBar(
        backgroundColor: Colors.transparent,
        elevation: 0,
        title: const Text(
          "Riwayat Belanja",
          style: TextStyle(color: Color(0xFF7C3E0F)),
        ),
        centerTitle: true,
        iconTheme: const IconThemeData(color: Color(0xFF7C3E0F)),
      ),
      body: riwayatBelanja.isEmpty
          ? const Center(
              child: Text(
                "Belum ada riwayat belanja.",
                style: TextStyle(fontSize: 16, color: Color(0xFF7C3E0F)),
              ),
            )
          : ListView.builder(
              itemCount: riwayatBelanja.length,
              itemBuilder: (context, index) {
                final transaksi = riwayatBelanja[index];
                return Card(
                  margin: const EdgeInsets.all(12),
                  child: Padding(
                    padding: const EdgeInsets.all(12),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: transaksi.map((item) {
                        return ListTile(
                          leading: Image.asset(item['imageAsset'], width: 50, height: 50),
                          title: Text(item['name']),
                          subtitle: Text("Qty: ${item['quantity']}"),
                          trailing: Text("Rp ${item['price'] * item['quantity']}"),
                        );
                      }).toList(),
                    ),
                  ),
                );
              },
            ),
    );
  }
}
