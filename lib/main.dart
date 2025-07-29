import 'package:flutter/material.dart';
import 'package:edupilot_web/welcome_screen.dart';
import 'package:edupilot_web/admin_login.dart';
import 'package:edupilot_web/instructor_login.dart';
import 'package:edupilot_web/admin_dashboard.dart';

void main() {
  runApp(const EduPilotApp());
}

class EduPilotApp extends StatelessWidget {
  const EduPilotApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'EduPilot LMS',
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(
          seedColor: Colors.indigo,
          brightness: Brightness.light,
        ),
        useMaterial3: true,
        fontFamily: 'Poppins', // chagua font nzuri kwa UI
      ),
      home: const WelcomeScreen(), // 👈 Entry point
      routes: {
        '/admin-login': (context) => const AdminLogin(),
        '/instructor-login': (context) => const InstructorLoginScreen(),
        '/admin-dashboard': (context) => const AdminDashboardScreen(),
        // unaweza kuongeza '/forgot-password': ...
      },
    );
  }
}