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
import 'package:i2c2_hackathon/teachers/CatagoryDetailpage.dart';
import 'package:i2c2_hackathon/teachers/demo.dart';
import 'package:i2c2_hackathon/teachers/teachercategorytile.dart';

import 'package:shared_preferences/shared_preferences.dart';
import 'package:http/http.dart' as http;

class TeacherScreen extends StatefulWidget {
  const TeacherScreen({super.key});

  @override
  State<TeacherScreen> createState() => _TeacherScreenState();
}

class _TeacherScreenState extends State<TeacherScreen> {
  bool isdark = false;
  FirebaseAuth auth = FirebaseAuth.instance;
  final user = FirebaseAuth.instance.currentUser!;
  int currentIndex = 0;
  List Images = [
    "assets/imgs/Math.png",
    "assets/imgs/coding.png",
    "assets/imgs/networking.png",
    "assets/imgs/Atom.png",
    "assets/imgs/eng.png",
    "assets/imgs/data-science.png"
  ];

  List catagory = [
    "Maths",
    "Development",
    "Networking",
    "Physics",
    "English",
    "Data Science",
  ];
  // List Courses = [
  //   "Maths",
  //   "Development",
  //   "Data science",
  //   "Cryptography",
  //   "Cryptography",
  //   "Development",
  // ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
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
                              Container(
                                width: 140,
                                child: Text(user.email.toString(),
                                    style: TextStyle(fontSize: 20)),
                              )
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
                      "Categories",
                      style: GoogleFonts.roboto(
                          fontSize: 24, fontWeight: FontWeight.w500),
                    ),
                  ),
                  Container(
                    //height: 120,
                    height: 270,
                    child: GridView.builder(
                        gridDelegate:
                            const SliverGridDelegateWithFixedCrossAxisCount(
                                crossAxisCount: 2),
                        scrollDirection: Axis.horizontal,
                        itemCount: catagory.length,
                        itemBuilder: ((context, index) {
                          List<Color> colors = [
                            Color(0xffDAD3C8),
                            Color(0xffFFE5DE),
                            Color(0xffDCF6E6),
                            Color.fromARGB(255, 53, 123, 163),
                            Color.fromARGB(255, 74, 135, 193),
                            Color.fromARGB(255, 162, 66, 245),
                          ];
                          return InkWell(
                            onTap: () {
                              Navigator.push(
                                  context,
                                  MaterialPageRoute(
                                      builder: (context) => CategoryDetails(
                                            subject: catagory[index],
                                          )));
                            },
                            child: TeacherCategoryTile(
                              ImagePath: Images[index],
                              color: colors[index],
                              catagory: catagory[index],
                            ),
                          );
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
                  Center(
                      child:
                          IconButton(onPressed: () {}, icon: Icon(Icons.add)))
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}
