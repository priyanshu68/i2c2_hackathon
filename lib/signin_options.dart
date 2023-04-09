import 'package:flutter/material.dart';
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
                              builder: (context) => TeacherSigin()));
                    },
                    child: Text('Login as Teacher')),
                ElevatedButton(
                    onPressed: () {
                      Navigator.push(
                          context,
                          MaterialPageRoute(
                              builder: (context) => StudentSignin()));
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
