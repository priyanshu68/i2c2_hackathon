import 'dart:convert';

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:google_nav_bar/google_nav_bar.dart';
import 'package:i2c2_hackathon/Catagorytile.dart';
import 'package:i2c2_hackathon/Coursetile.dart';
import 'package:i2c2_hackathon/LoginScreen.dart';
import 'package:i2c2_hackathon/searchscreen.dart';

import 'package:shared_preferences/shared_preferences.dart';
import 'package:http/http.dart' as http;

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  bool isdark = false;
  FirebaseAuth auth = FirebaseAuth.instance;
  int currentIndex = 0;
  List<Widget> _widgetoptions = [HomeScreen(), SearchPage()];

  List catagory = [
    "Maths",
    "Development",
    "Data science",
    "Cryptography",
    "Cryptography",
    "Development",
    "Development",
    "Development",
  ];
  List Courses = [
    "Maths",
    "Development",
    "Data science",
    "Cryptography",
    "Cryptography",
    "Development",
  ];
  @override
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: isdark ? Color.fromARGB(255, 17, 6, 40) : Colors.white10,
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.all(12.0),
          child: SingleChildScrollView(
            child: Container(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      ///for profile pic
                      Row(
                        children: [
                          CircleAvatar(
                            child: isdark
                                ? Image.asset("assets/imgs/Sample.png")
                                : Image.asset("assets/imgs/Sample2.png"),
                            radius: 35,
                          ),
                          SizedBox(
                            width: 20,
                          ),
                          Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Text(
                                "Welcome Back,",
                                style: TextStyle(
                                    fontSize: 18,
                                    color:
                                        isdark ? Colors.white : Colors.black),
                              ),
                              Text("Neha", style: TextStyle(fontSize: 30))
                            ],
                          ),
                        ],
                      ),

                      //for heading

                      Row(
                        children: [
                          IconButton(
                              onPressed: () {
                                if (isdark == false) {
                                  setState(() {
                                    isdark = true;
                                  });
                                } else {
                                  setState(() {
                                    isdark = false;
                                  });
                                }
                              },
                              icon: isdark
                                  ? Icon(
                                      Icons.sunny,
                                      color: Colors.white,
                                    )
                                  : Icon(Icons.dark_mode)),
                          IconButton(
                              onPressed: () {},
                              icon: Icon(Icons.notifications_outlined)),
                        ],
                      )
                    ],
                  ),
                  SizedBox(height: 30),
                  Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: Text(
                      "Catagories",
                      style: GoogleFonts.roboto(
                          fontSize: 24, fontWeight: FontWeight.w500),
                    ),
                  ),
                  Container(
                    //height: 120,
                    height: 250,
                    child: GridView.builder(
                        gridDelegate:
                            const SliverGridDelegateWithFixedCrossAxisCount(
                                crossAxisCount: 2),
                        scrollDirection: Axis.horizontal,
                        itemCount: catagory.length,
                        itemBuilder: ((context, index) {
                          return CatagoryTile(catagory: catagory[index]);
                        })),
                  ),
                  Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: Text(
                      'Your Courses',
                      style: TextStyle(
                        fontWeight: FontWeight.bold,
                        fontSize: 20.0,
                      ),
                    ),
                  ),
                  Container(
                      height: 300,
                      child: ListView.builder(
                          itemCount: Courses.length,
                          itemBuilder: ((context, index) {
                            return CourseTile(course: Courses[index]);
                          }))),
                  // Text(
                  //   "The end",
                  //   style: TextStyle(
                  //     fontWeight: FontWeight.bold,
                  //     fontSize: 100.0,
                  //   ),
                  // )
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}
