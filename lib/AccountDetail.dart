import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:i2c2_hackathon/LoginScreen.dart';
import 'package:shared_preferences/shared_preferences.dart';

class AccountDetails extends StatefulWidget {
  const AccountDetails({super.key});

  @override
  State<AccountDetails> createState() => _AccountDetailsState();
}

class _AccountDetailsState extends State<AccountDetails> {
  FirebaseAuth auth = FirebaseAuth.instance;
  @override
  Widget build(BuildContext context) {
    return Center(
      child: SafeArea(
        child: Container(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              IconButton(
                  onPressed: () async {
                    await auth.signOut();
                    final prefs = await SharedPreferences.getInstance();
                    Navigator.pop(context);
                    prefs.setBool('isLoggedIn', false);
                  },
                  icon: Icon(Icons.logout_outlined))
            ],
          ),
        ),
      ),
    );
  }
}
