import 'package:flutter/material.dart';
import 'package:toko_aksesoris/edit_profile_screen.dart';
import 'riwayat_belanja_screen.dart';

class ProfileScreen extends StatelessWidget {
  const ProfileScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xFFFFF4E6),
      appBar: AppBar(
        backgroundColor: Colors.transparent,
        elevation: 0,
        title: const Text(
          "Profil Saya",
          style: TextStyle(color: Color(0xFF7C3E0F)),
        ),
        centerTitle: true,
        iconTheme: const IconThemeData(color: Color(0xFF7C3E0F)),
      ),
      body: Padding(
        padding: const EdgeInsets.all(24.0),
        child: Column(
          children: [
            const CircleAvatar(
              radius: 50,
              backgroundImage: AssetImage("assets/aku2.jpg"), // Ganti dengan gambar user kamu
            ),
            const SizedBox(height: 16),
            const Text(
              "Saskia Atha",
              style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold, color: Color(0xFF7C3E0F)),
            ),
            const Text(
              "saskia@email.com",
              style: TextStyle(fontSize: 16, color: Color(0xFF7C3E0F)),
            ),
            const SizedBox(height: 30),
            ListTile(
              leading: const Icon(Icons.edit, color: Color(0xFF7C3E0F)),
              title: const Text("Edit Profil"),
              onTap: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(builder: (_) => const EditProfileScreen()),
                );
              },
            ),
            ListTile(
              leading: const Icon(Icons.history, color: Color(0xFF7C3E0F)),
              title: const Text("Riwayat Belanja"),
              onTap: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(builder: (_) => const RiwayatBelanjaScreen()),
                );
              },
            ),
            const Spacer(),
            ElevatedButton.icon(
              onPressed: () {
                // Logout dan kembali ke halaman login
                Navigator.pushReplacementNamed(context, '/login');
              },
              icon: const Icon(Icons.logout),
              label: const Text("Logout"),
              style: ElevatedButton.styleFrom(
                backgroundColor: const Color(0xFF7C3E0F),
                minimumSize: const Size(double.infinity, 50),
                shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(12)),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
