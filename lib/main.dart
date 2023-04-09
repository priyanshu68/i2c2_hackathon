import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:i2c2_hackathon/LoginScreen.dart';
import 'package:i2c2_hackathon/authPage.dart';
import 'package:i2c2_hackathon/homeScreen.dart';
import 'package:i2c2_hackathon/NavigationBar.dart';
import 'package:i2c2_hackathon/signin_options.dart';
import 'package:i2c2_hackathon/signin_signup.dart/student_signin.dart';
import 'package:i2c2_hackathon/teachers/CatagoryDetailpage.dart';
import 'package:i2c2_hackathon/teachers/NavigationbarTeacher.dart';
import 'package:i2c2_hackathon/teachers/teacherScreen.dart';
import 'package:i2c2_hackathon/userdetails.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp();

  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Flutter Demo',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: const Authpage(),
    );
  }
}
