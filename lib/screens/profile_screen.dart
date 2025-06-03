import 'package:flutter/material.dart';

class ProfileScreen extends StatelessWidget {
  const ProfileScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xFFE8F5E9), // Light green background
      appBar: AppBar(
        backgroundColor: Colors.green[700],
        title: const Text('My Profile'),
        centerTitle: true,
      ),
      body: Padding(
        padding: const EdgeInsets.symmetric(vertical: 40.0, horizontal: 20.0),
        child: Column(
          children: [
            // Avatar Image
            const CircleAvatar(
              radius: 60,
              backgroundImage: AssetImage('assets/images/avatar.jpg'),
            ),
            const SizedBox(height: 20),
            const Text(
              'Aditya Vashisht',
              style: TextStyle(fontSize: 22, fontWeight: FontWeight.bold),
            ),
            const SizedBox(height: 5),
            const Text(
              'aditya@example.com',
              style: TextStyle(fontSize: 16, color: Colors.black54),
            ),
            const SizedBox(height: 15),
            const Text(
              'Believer in sustainability 🌿 and tech for good 🌍',
              textAlign: TextAlign.center,
              style: TextStyle(fontSize: 16),
            ),
            const SizedBox(height: 30),
            ElevatedButton.icon(
              onPressed: () {
                // Add edit functionality later
              },
              icon: const Icon(Icons.edit),
              label: const Text('Edit Profile'),
              style: ElevatedButton.styleFrom(
                backgroundColor: Colors.green[600],
              ),
            ),
            const Spacer(),
            TextButton.icon(
              onPressed: () {
                // Add logout logic
              },
              icon: const Icon(Icons.logout, color: Colors.red),
              label: const Text(
                'Logout',
                style: TextStyle(color: Colors.red),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
