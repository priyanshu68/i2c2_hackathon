import 'dart:io';

import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:i2c2_hackathon/LoginScreen.dart';
import 'package:i2c2_hackathon/uitls.dart';
import 'package:shared_preferences/shared_preferences.dart';

class UserDetails extends StatefulWidget {
  const UserDetails({super.key});

  @override
  State<UserDetails> createState() => _UserDetailsState();
}

class _UserDetailsState extends State<UserDetails> {
  File? image;
  FirebaseAuth auth = FirebaseAuth.instance;
  final TextEditingController name = TextEditingController();
  final TextEditingController email = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color.fromARGB(255, 249, 249, 249),
      appBar: AppBar(
        backgroundColor: Color.fromARGB(255, 249, 249, 249),
        shadowColor: Color.fromARGB(255, 249, 249, 249),
        foregroundColor: Colors.black,
        elevation: 0.0,
        automaticallyImplyLeading: false,
        actions: [
          IconButton(
              onPressed: () async {
                await auth.signOut();
                final prefs = await SharedPreferences.getInstance();
                Navigator.push(context,
                    MaterialPageRoute(builder: (context) => LoginPage()));
                prefs.setBool('isLoggedIn', false);
              },
              icon: Icon(Icons.logout))
        ],
      ),
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.all(16.0),
          child: Column(children: [
            SizedBox(
              height: 50,
            ),
            InkWell(
                onTap: () => selectImage(),
                child: image == null
                    ? CircleAvatar(
                        child: Icon(
                          Icons.account_circle_rounded,
                          size: 70,
                          color: Color.fromARGB(255, 239, 239, 239),
                        ),
                        radius: 60,
                        backgroundColor: Color.fromARGB(255, 243, 159, 58),
                      )
                    : CircleAvatar(
                        radius: 60,
                        child: ClipOval(
                          child: Image.file(
                            image!,
                          ),
                        ),
                      )),
            SizedBox(
              height: 20,
            ),

            // decoration: BoxDecoration(
            //     border: Border.all(
            //         width: 1, color: Color.fromARGB(255, 103, 102, 102)),
            //     borderRadius: BorderRadius.circular(8)),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 8.0),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: Text("Enter your name",
                        style: TextStyle(
                            fontSize: 18,
                            fontWeight: FontWeight.w500,
                            color: Colors.grey[800])),
                  ),
                  TextField(
                    controller: name,
                    decoration: InputDecoration(
                      enabledBorder: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(12),
                        borderSide: BorderSide(color: Colors.grey, width: 1.5),
                      ),
                      focusedBorder: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(12),
                        borderSide: BorderSide(
                            color: Color.fromARGB(255, 114, 113, 112),
                            width: 2.0),
                      ),
                      prefixIcon: Icon(Icons.account_circle_rounded,
                          color: Color.fromARGB(255, 225, 142, 40)),
                    ),
                    style: TextStyle(),
                  ),
                ],
              ),
            ),

            SizedBox(
              height: 10,
            ),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 8.0),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: Text(
                      "Enter your email address",
                      style: GoogleFonts.roboto(
                          textStyle: TextStyle(
                              fontSize: 18,
                              fontWeight: FontWeight.w500,
                              color: Colors.grey[800])),
                    ),
                  ),
                  TextField(
                    controller: email,
                    decoration: InputDecoration(
                      prefixIcon: Icon(Icons.email,
                          color: Color.fromARGB(255, 234, 163, 76)),
                      enabledBorder: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(12),
                        borderSide: BorderSide(color: Colors.grey, width: 1.5),
                      ),
                      focusedBorder: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(12),
                        borderSide: BorderSide(
                            color: Color.fromARGB(255, 114, 113, 112),
                            width: 2.0),
                      ),
                    ),
                    style: TextStyle(),
                  ),
                ],
              ),
            ),
            SizedBox(
              height: 20,
            ),
            ElevatedButton(
              onPressed: () {},
              child: Text('Continue'),
              style: ElevatedButton.styleFrom(
                backgroundColor: Color.fromARGB(255, 234, 163, 76),
              ),
            )
          ]),
        ),
      ),
    );
  }

  selectImage() async {
    image = await getImage(BuildContext);
    setState(() {});
  }
}
