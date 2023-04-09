// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:i2c2_hackathon/homeScreen.dart';
import 'package:i2c2_hackathon/userdetails.dart';
import 'package:pinput/pinput.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'authPage.dart';

class OtpScreen extends StatefulWidget {
  final String verificationID;
  const OtpScreen({
    Key? key,
    required this.verificationID,
  }) : super(key: key);

  @override
  State<OtpScreen> createState() => _OtpScreenState();
}

class _OtpScreenState extends State<OtpScreen> {
  FirebaseAuth auth = FirebaseAuth.instance;
  final TextEditingController otp = TextEditingController();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        backgroundColor: Colors.white,
        shadowColor: Colors.white,
        foregroundColor: Colors.black,
        elevation: 0.0,
      ),
      body: SafeArea(
        child: SingleChildScrollView(
          child: Padding(
            padding: const EdgeInsets.all(16.0),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Image.asset("assets/imgs/Otp2.gif"),
                Text(
                  'Enter your OTP',
                  style: TextStyle(fontSize: 25, fontWeight: FontWeight.bold),
                ),
                SizedBox(
                  height: 10,
                ),
                // Text(
                //   'Enter your OTP here',
                //   style: TextStyle(fontSize: 16),
                // ),
                SizedBox(
                  height: 15,
                ),
                Pinput(
                  controller: otp,
                  length: 6,
                ),
                SizedBox(
                  height: 10,
                ),
                ElevatedButton(
                  onPressed: () async {
                    final credential = PhoneAuthProvider.credential(
                        verificationId: widget.verificationID,
                        smsCode: otp.text.toString());

                    try {
                      await auth.signInWithCredential(credential);
                      final existinguser = await existingUser();
                      if (existinguser) {
                        Navigator.push(
                            context,
                            MaterialPageRoute(
                                builder: (context) => HomeScreen()));
                        final prefs = await SharedPreferences.getInstance();
                        prefs.setBool('isLoggedIn', true);
                      } else {
                        Navigator.push(
                            context,
                            MaterialPageRoute(
                                builder: (context) => UserDetails()));
                      }
                    } catch (e) {
                      Fluttertoast.showToast(
                          msg: '${e}',
                          toastLength: Toast.LENGTH_SHORT,
                          gravity: ToastGravity.BOTTOM,
                          timeInSecForIosWeb: 1,
                          backgroundColor: Colors.red,
                          textColor: Colors.white,
                          fontSize: 16.0);
                    }
                  },
                  child: Text("verify"),
                  style: ElevatedButton.styleFrom(
                      backgroundColor: Color.fromARGB(255, 90, 71, 213)),
                ),
                SizedBox(
                  height: 10,
                ),
                Text("Didn't Receive the OTP?"),
                TextButton(
                  onPressed: () {},
                  child: Text(
                    "Resend OTP",
                    style: TextStyle(color: Color.fromARGB(255, 31, 25, 68)),
                  ),
                )
              ],
            ),
          ),
        ),
      ),
    );
  }

  Future<bool> existingUser() async {
    final user = FirebaseAuth.instance.currentUser;
    final _uid = user?.uid;

    DocumentSnapshot snapshot =
        await FirebaseFirestore.instance.collection('users').doc(_uid).get();
    if (snapshot.exists) {
      //user exists
      print("user exists");
      return true;
    } else {
      //new user
      print("NEW USER");
      return false;
    }
  }
}
