import 'package:flutter/material.dart';

class RiwayatBelanjaScreen extends StatelessWidget {
  const RiwayatBelanjaScreen({super.key});

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
      body: const Center(
        child: Text(
          "Belum ada riwayat belanja.",
          style: TextStyle(fontSize: 16, color: Color(0xFF7C3E0F)),
        ),
      ),
    );
  }
}

