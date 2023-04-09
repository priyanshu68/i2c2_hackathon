import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';

import 'otpScreen.dart';

class LoginPage extends StatefulWidget {
  const LoginPage({Key? key}) : super(key: key);

  @override
  State<LoginPage> createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  FirebaseAuth auth = FirebaseAuth.instance;
  TextEditingController country = TextEditingController();
  TextEditingController phone = TextEditingController();
  @override
  void initState() {
    // TODO: implement initState
    country.text = '+91';
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.all(16.0),
          child: SingleChildScrollView(
            child: Column(
              // crossAxisAlignment: CrossAxisAlignment.center,
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Image.asset(
                  "assets/imgs/Login2.png",
                  height: 400,
                ),
                Text(
                  'Login using OTP',
                  style: TextStyle(fontSize: 25, fontWeight: FontWeight.bold),
                ),
                SizedBox(
                  height: 10,
                ),
                Text(
                  'Enter your number here to receive your OTP',
                  style: TextStyle(fontSize: 16),
                ),
                SizedBox(
                  height: 12,
                ),
                Container(
                  decoration: BoxDecoration(
                      border: Border.all(
                          width: 1, color: Color.fromARGB(255, 103, 102, 102)),
                      borderRadius: BorderRadius.circular(8)),
                  child: Row(
                    children: [
                      Padding(
                        padding: const EdgeInsets.symmetric(horizontal: 8.0),
                        child: SizedBox(
                          width: 40,
                          child: TextField(
                            controller: country,
                            decoration:
                                InputDecoration(border: InputBorder.none),
                            keyboardType: TextInputType.number,
                          ),
                        ),
                      ),
                      Text(
                        "|",
                        style: TextStyle(
                            fontSize: 30, fontWeight: FontWeight.w100),
                      ),
                      SizedBox(
                        width: 10,
                      ),
                      Expanded(
                        child: TextField(
                          controller: phone,
                          decoration: InputDecoration(
                              border: InputBorder.none, hintText: 'Mobile no.'),
                          keyboardType: TextInputType.number,
                        ),
                      ),
                    ],
                  ),
                ),
                SizedBox(
                  height: 10,
                ),
                ElevatedButton(
                  onPressed: () async {
                    await FirebaseAuth.instance.verifyPhoneNumber(
                      phoneNumber: '${country.text + phone.text}',
                      verificationCompleted:
                          (PhoneAuthCredential credential) {},
                      verificationFailed: (FirebaseAuthException e) {
                        Fluttertoast.showToast(
                            msg: '${e}',
                            toastLength: Toast.LENGTH_SHORT,
                            gravity: ToastGravity.BOTTOM,
                            timeInSecForIosWeb: 1,
                            backgroundColor: Colors.red,
                            textColor: Colors.white,
                            fontSize: 16.0);
                      },
                      codeSent: (String verificationId, int? resendToken) {
                        Navigator.push(
                            context,
                            MaterialPageRoute(
                                builder: ((context) => OtpScreen(
                                      verificationID: verificationId,
                                    ))));
                        //print('${phone.text}${country.text}');
                      },
                      codeAutoRetrievalTimeout: (String verificationId) {},
                    );
                  },
                  child: Text('Send OTP'),
                  style: ElevatedButton.styleFrom(
                      primary: Color.fromARGB(255, 90, 71, 213)),
                )
              ],
            ),
          ),
        ),
      ),
    );
  }
}
