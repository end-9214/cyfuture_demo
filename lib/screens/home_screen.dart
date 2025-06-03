import 'package:flutter/material.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        children: [
          // Wallpaper GIF as Background
          Positioned.fill(
            child: Image.asset(
              'assets/animations/earth_day_celebration.jpg',
              fit: BoxFit.cover,
            ),
          ),
          // Foreground Content
          Center(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                // Symbol GIF
                Image.asset(
                  'assets/animations/symbol_animation.gif',
                  height: 150,
                ),
                const SizedBox(height: 20),
                const Text(
                  'No image selected',
                  style: TextStyle(fontSize: 18, color: Colors.white),
                ),
                const SizedBox(height: 20),
                ElevatedButton(
                  onPressed: () {
                    // Capture image functionality
                  },
                  child: const Text('Capture Image'),
                ),
                const SizedBox(height: 10),
                ElevatedButton(
                  onPressed: () {
                    // Submit functionality
                  },
                  child: const Text('Submit'),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
