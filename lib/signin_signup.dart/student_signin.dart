import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:i2c2_hackathon/NavigationBar.dart';
import 'package:shared_preferences/shared_preferences.dart';

class StudentSignin extends StatefulWidget {
  const StudentSignin({super.key});

  @override
  State<StudentSignin> createState() => _StudentSigninState();
}

class _StudentSigninState extends State<StudentSignin> {
  TextEditingController email = TextEditingController();
  TextEditingController password = TextEditingController();

  Future _signin() async {
    try {
      final credential = await FirebaseAuth.instance.signInWithEmailAndPassword(
          email: email.text.trim(), password: password.text.trim());

      print("Logined as student");

      final prefs = await SharedPreferences.getInstance();
      prefs.setBool('isLoggedIn', true);

      email.clear();
      password.clear();
      Navigator.push(
          context, MaterialPageRoute(builder: (context) => Navbar()));
    } on FirebaseAuthException catch (e) {
      if (e.code == 'user-not-found') {
        print('No user found for that email.');
      } else if (e.code == 'wrong-password') {
        print('Wrong password provided for that user.');
      }
    }
  }

  void dispose() {
    email.dispose();
    password.dispose();
    super.dispose();
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
                  "assets/imgs/siginstu.png",
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
                  onPressed: () => _signin(),
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
                      onPressed: () {},
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
