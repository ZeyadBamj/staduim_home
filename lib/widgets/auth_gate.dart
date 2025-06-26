import 'package:flutter/material.dart';
import 'package:reservision_app/screens/personal_profile_screen.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:reservision_app/screens/profile_screen.dart'; // واجهة الزائر

class AuthGate extends StatefulWidget {
  const AuthGate({super.key});

  @override
  State<AuthGate> createState() => _AuthGateState();
}

class _AuthGateState extends State<AuthGate> {
  bool? isLoggedIn;

  @override
  void initState() {
    super.initState();
    _checkLoginStatus();
  }

  Future<void> _checkLoginStatus() async {
    final prefs = await SharedPreferences.getInstance();
    final loggedIn = prefs.getBool('isLoggedIn') ?? false;

    setState(() {
      isLoggedIn = loggedIn;
    });
  }

  @override
  Widget build(BuildContext context) {
    if (isLoggedIn == null) {
      return const Scaffold(body: Center(child: CircularProgressIndicator()));
    }

    return isLoggedIn! ? const PersonalProfileScreen() : const ProfileScreen();
  }
}
