import 'package:flutter/material.dart';
import 'screens/home_screen.dart';
import 'screens/login_screen.dart';
import 'screens/register_screen.dart';
import 'screens/scan_screen.dart';
import 'screens/profile_screen.dart';

void main() {
  runApp(const SustainabilityApp());
}

class SustainabilityApp extends StatelessWidget {
  const SustainabilityApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Sustainably',
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        primarySwatch: Colors.green,
        scaffoldBackgroundColor: const Color(0xFFF1F8E9),
        textTheme: const TextTheme(
          bodyLarge: TextStyle(color: Colors.black87),
          titleLarge: TextStyle(
              color: Colors.green, fontWeight: FontWeight.bold, fontSize: 22),
        ),
        elevatedButtonTheme: ElevatedButtonThemeData(
          style: ElevatedButton.styleFrom(
            backgroundColor: Colors.green[700],
            foregroundColor: Colors.white,
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(12),
            ),
          ),
        ),
      ),
      initialRoute: '/login',
      routes: {
        '/': (context) => const HomeScreen(),
        '/login': (context) => const LoginScreen(),
        '/register': (context) => const RegisterScreen(),
        '/scan': (context) => const ScanScreen(),
        '/profile': (context) => const ProfileScreen(),
      },
    );
  }
}
