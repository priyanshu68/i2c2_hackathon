// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:flutter/material.dart';

class StudentSignUp extends StatefulWidget {
  final VoidCallback showSignIn;
  const StudentSignUp({
    Key? key,
    required this.showSignIn,
  }) : super(key: key);

  @override
  State<StudentSignUp> createState() => _StudentSignUpState();
}

class _StudentSignUpState extends State<StudentSignUp> {
  TextEditingController email = TextEditingController();
  TextEditingController password = TextEditingController();
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
                  "assets/imgs/signupstu.png",
                  height: 300,
                ),
                SizedBox(height: 10),
                Text(
                  'Create an  Account',
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
                  onPressed: () {},
                  child: Text('Sign Up'),
                  style: ElevatedButton.styleFrom(
                      primary: Color.fromARGB(255, 247, 152, 43),
                      fixedSize: Size(170, 40)),
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Text(
                      "Have an account?",
                      style: TextStyle(
                          color: Color.fromARGB(255, 84, 84, 84), fontSize: 14),
                    ),
                    TextButton(
                      onPressed: widget.showSignIn,
                      child: Text(
                        "Sign In",
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
