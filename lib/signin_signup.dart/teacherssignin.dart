// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';

import 'package:i2c2_hackathon/teachers/NavigationbarTeacher.dart';

class TeacherSigin extends StatefulWidget {
  final VoidCallback showSignup;
  const TeacherSigin({
    Key? key,
    required this.showSignup,
  }) : super(key: key);

  @override
  State<TeacherSigin> createState() => _TeacherSiginState();
}

class _TeacherSiginState extends State<TeacherSigin> {
  TextEditingController email = TextEditingController();
  TextEditingController password = TextEditingController();

  Future _teachersignin() async {
    try {
      final credential = await FirebaseAuth.instance.signInWithEmailAndPassword(
          email: email.text.trim(), password: password.text.trim());

      print("Logined as Teacher");

      final prefs = await SharedPreferences.getInstance();
      prefs.setBool('isLoggedIn', true);
      Navigator.push(
          context, MaterialPageRoute(builder: (context) => TeacherNav()));
    } on FirebaseAuthException catch (e) {
      if (e.code == 'user-not-found') {
        print('No user found for that email.');
      } else if (e.code == 'wrong-password') {
        print('Wrong password provided for that user.');
      }
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.all(16.0),
          child: SingleChildScrollView(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Image.asset(
                  "assets/imgs/signinteach.png",
                  height: 300,
                ),
                SizedBox(height: 10),
                Text(
                  'Login into your Account',
                  style: TextStyle(fontSize: 25, fontWeight: FontWeight.bold),
                ),
                SizedBox(
                  height: 30,
                ),
                Container(
                  decoration: BoxDecoration(
                      border: Border.all(
                          width: 1, color: Color.fromARGB(255, 103, 102, 102)),
                      borderRadius: BorderRadius.circular(8)),
                  child: Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 9.0),
                    child: TextField(
                      controller: email,
                      decoration: InputDecoration(
                          border: InputBorder.none,
                          hintText: 'Your e-mail address'),
                      keyboardType: TextInputType.emailAddress,
                    ),
                  ),
                ),
                SizedBox(
                  height: 20,
                ),
                Container(
                  decoration: BoxDecoration(
                      border: Border.all(
                          width: 1, color: Color.fromARGB(255, 103, 102, 102)),
                      borderRadius: BorderRadius.circular(8)),
                  child: Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 9.0),
                    child: TextField(
                      controller: password,
                      decoration: InputDecoration(
                          border: InputBorder.none, hintText: 'Password'),
                      obscureText: true,
                    ),
                  ),
                ),
                SizedBox(
                  height: 10,
                ),
                ElevatedButton(
                  onPressed: () => _teachersignin(),
                  child: Text('Sign In'),
                  style: ElevatedButton.styleFrom(
                      primary: Color.fromARGB(255, 247, 152, 43),
                      fixedSize: Size(170, 40)),
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Text(
                      "Don't have an account?",
                      style: TextStyle(
                          color: Color.fromARGB(255, 84, 84, 84), fontSize: 14),
                    ),
                    TextButton(
                      onPressed: widget.showSignup,
                      child: Text(
                        "Create Account",
                        style: TextStyle(fontSize: 14),
                      ),
                    ),
                  ],
                )
              ],
            ),
          ),
        ),
      ),
    );
  }
}
