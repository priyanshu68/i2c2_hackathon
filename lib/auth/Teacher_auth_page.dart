
import 'package:flutter/material.dart';
import 'package:i2c2_hackathon/signin_signup.dart/teacherSignUp.dart';
import 'package:i2c2_hackathon/signin_signup.dart/teacherssignin.dart';

class Teacher_Auth extends StatefulWidget {
  const Teacher_Auth({super.key});

  @override
  State<Teacher_Auth> createState() => _Teacher_AuthState();
}

class _Teacher_AuthState extends State<Teacher_Auth> {
  bool showSignin = true;

  void togglescreens() {
    setState(() {
      showSignin = !showSignin;
    });
  }

  @override
  Widget build(BuildContext context) {
    if (showSignin) {
      return TeacherSigin(
        showSignup: togglescreens,
      );
    } else {
      return TeacherSignup(
        showSignin: togglescreens,
      );
    }
  }
}
