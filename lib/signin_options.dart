import 'package:flutter/material.dart';
import 'package:i2c2_hackathon/auth/Student_auth.dart';

import 'package:i2c2_hackathon/auth/Teacher_auth_page.dart';
import 'package:i2c2_hackathon/signin_signup.dart/student_signin.dart';
import 'package:i2c2_hackathon/signin_signup.dart/teacherssignin.dart';

class SiginOption extends StatelessWidget {
  const SiginOption({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Center(
          child: Padding(
            padding: EdgeInsets.all(16.0),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Text('Welcome to OpenED!'),
                SizedBox(
                  height: 20,
                ),
                ElevatedButton(
                    onPressed: () {
                      Navigator.push(
                          context,
                          MaterialPageRoute(
                              builder: (context) => Teacher_Auth()));
                    },
                    child: Text('Login as Teacher')),
                ElevatedButton(
                    onPressed: () {
                      Navigator.push(
                          context,
                          MaterialPageRoute(
                              builder: (context) => Student_auth()));
                    },
                    child: Text('Login as Student'))
              ],
            ),
          ),
        ),
      ),
    );
  }
}
