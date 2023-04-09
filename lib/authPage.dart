import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:i2c2_hackathon/homeScreen.dart';

import 'package:shared_preferences/shared_preferences.dart';

import 'LoginScreen.dart';

class Authpage extends StatefulWidget {
  const Authpage({super.key});

  @override
  State<Authpage> createState() => _AuthpageState();
}

class _AuthpageState extends State<Authpage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: FutureBuilder<bool>(
          future: _checkIsLoggedIn(),
          builder: (context, snapshot) {
            if (snapshot.hasData) {
              final isLoggedIn = snapshot.data!;
              if (isLoggedIn) {
                // navigate to the home page
                return HomeScreen();
              } else {
                // navigate to the login page
                return LoginPage();
              }
            } else {
              return CircularProgressIndicator();
            }
          },
        ),
      ),
    );
  }

  Future<bool> _checkIsLoggedIn() async {
    final prefs = await SharedPreferences.getInstance();
    return prefs.getBool('isLoggedIn') ?? false;
  }

 
}
