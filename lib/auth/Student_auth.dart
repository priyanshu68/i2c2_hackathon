import 'package:flutter/material.dart';
import 'package:i2c2_hackathon/signin_signup.dart/student_signin.dart';
import 'package:i2c2_hackathon/signin_signup.dart/student_signup.dart';
import 'package:i2c2_hackathon/signin_signup.dart/teacherSignUp.dart';
import 'package:i2c2_hackathon/signin_signup.dart/teacherssignin.dart';

class Student_auth extends StatefulWidget {
  const Student_auth({super.key});

  @override
  State<Student_auth> createState() => _Student_authState();
}

class _Student_authState extends State<Student_auth> {
  bool showSigninPage = true;

  void togglescreens() {
    setState(() {
      showSigninPage = !showSigninPage;
    });
  }

  @override
  Widget build(BuildContext context) {
    if (showSigninPage) {
      return StudentSignin(showsignUp: togglescreens);
    } else {
      return StudentSignUp(showSignIn: togglescreens);
    }
  }
}
