import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:i2c2_hackathon/LoginScreen.dart';
import 'package:shared_preferences/shared_preferences.dart';

class TeacherAccount extends StatefulWidget {
  const TeacherAccount({super.key});

  @override
  State<TeacherAccount> createState() => _TeacherAccountState();
}

class _TeacherAccountState extends State<TeacherAccount> {
  FirebaseAuth auth = FirebaseAuth.instance;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.grey[50],
      appBar: AppBar(
        backgroundColor: Colors.white,
        shadowColor: Colors.white,
        elevation: 0,
        title: Center(
          child: Text(
            "Profile",
            style: TextStyle(color: Colors.black),
          ),
        ),
        leading: IconButton(
            onPressed: () {},
            icon: Icon(
              Icons.arrow_back_ios,
              color: Colors.black,
            )),
        actions: [
          IconButton(
            onPressed: () async {
              await auth.signOut();
              final prefs = await SharedPreferences.getInstance();
              Navigator.push(context,
                  MaterialPageRoute(builder: (context) => LoginPage()));
              prefs.setBool('isLoggedIn', false);
            },
            icon: Icon(Icons.logout_outlined),
            color: Colors.black,
          )
        ],
      ),
      body: Container(
        child: Column(
          //crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            SizedBox(
              height: 60,
            ),
            Center(
                child: CircleAvatar(
              radius: 60,
              child: Image.asset("assets/imgs/Sample.png"),
            )),
            SizedBox(
              height: 20,
            ),
            Text(
              "Neha Mahapatra",
              style:
                  GoogleFonts.roboto(fontSize: 24, fontWeight: FontWeight.w400),
            ),
            Text(
              "Instructor",
              style:
                  GoogleFonts.roboto(fontSize: 16, fontWeight: FontWeight.w300),
            ),
            SizedBox(
              height: 40,
            ),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 24.0),
              child: Container(
                height: 300,
                decoration: BoxDecoration(
                    borderRadius: BorderRadius.only(
                      topLeft: Radius.circular(16),
                      topRight: Radius.circular(16),
                    ),
                    boxShadow: [
                      BoxShadow(
                        color: Colors.black.withOpacity(0.2),
                        blurRadius: 10,
                        spreadRadius: -5,
                        offset: Offset(-5, 0),
                      ),
                      BoxShadow(
                        color: Colors.black.withOpacity(0.2),
                        blurRadius: 10,
                        spreadRadius: -5,
                        offset: Offset(5, 0),
                      ),
                    ],
                    color: Colors.white),
                //color: Colors.amberAccent,
                child: Padding(
                  padding: const EdgeInsets.symmetric(
                      horizontal: 24.0, vertical: 16),
                  child: Column(
                    children: [
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Icon(Icons.settings_outlined),
                          Text(
                            "Settings",
                            style: GoogleFonts.roboto(
                                fontSize: 18, fontWeight: FontWeight.w400),
                          ),
                          IconButton(
                              onPressed: () {},
                              icon: Icon(Icons.arrow_forward_ios))
                        ],
                      ),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Icon(Icons.info_outline),
                          Text(
                            "Information",
                            style: GoogleFonts.roboto(
                                fontSize: 18, fontWeight: FontWeight.w400),
                          ),
                          IconButton(
                              onPressed: () {},
                              icon: Icon(Icons.arrow_forward_ios))
                        ],
                      )
                    ],
                  ),
                ),
              ),
            )
          ],
        ),
      ),
    );
  }
}
