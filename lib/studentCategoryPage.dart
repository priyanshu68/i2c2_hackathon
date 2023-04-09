// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

import 'package:i2c2_hackathon/NavigationBar.dart';
import 'package:i2c2_hackathon/studentvideoplay.dart';
import 'package:i2c2_hackathon/teachers/SeeAllVideos.dart';

class StudentCategoryDetails extends StatefulWidget {
  final String category;
  const StudentCategoryDetails({
    Key? key,
    required this.category,
  }) : super(key: key);

  @override
  State<StudentCategoryDetails> createState() => _StudentCategoryDetailsState();
}

class _StudentCategoryDetailsState extends State<StudentCategoryDetails> {
  List videostemp = [
    "number Theory",
    "Helloworld",
    "number Theory",
    "number Theory",
    "number Theory",
    "Helloworld",
    "number Theory",
    "number Theory",
    "number Theory",
    "Helloworld",
    "number Theory",
    "number Theory",
    "number Theory",
  ];
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: SafeArea(
            child: Center(
      child: Container(
        child: Padding(
            padding: const EdgeInsets.all(12.0),
            child:
                Column(crossAxisAlignment: CrossAxisAlignment.start, children: [
              Row(
                children: [
                  IconButton(
                      onPressed: () {
                        Navigator.push(context,
                            MaterialPageRoute(builder: (Context) => Navbar()));
                      },
                      icon: Icon(Icons.arrow_back_ios)),
                ],
              ),
              Text(
                widget.category,
                style: GoogleFonts.roboto(
                    fontSize: 30, fontWeight: FontWeight.w500),
              ),
              SizedBox(height: 30),
              Container(
                child: Column(
                  children: [
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Text("Recent Videos",
                            style: GoogleFonts.roboto(
                                fontSize: 20, fontWeight: FontWeight.w400)),
                        TextButton(
                            onPressed: () {
                              Navigator.push(
                                  context,
                                  MaterialPageRoute(
                                      builder: (context) => SeeAllVideos(
                                            videos: videostemp,
                                          )));
                            },
                            child: Text("See all"))
                      ],
                    ),
                    Container(
                      height: 250,
                      child: StreamBuilder<QuerySnapshot>(
                        stream: FirebaseFirestore.instance
                            .collection(widget.category)
                            .snapshots(),
                        builder: (BuildContext context,
                            AsyncSnapshot<QuerySnapshot> snapshot) {
                          if (snapshot.hasError) {
                            return Text('Something went wrong');
                          }

                          if (snapshot.connectionState ==
                              ConnectionState.waiting) {
                            return CircularProgressIndicator();
                          }

                          return ListView(
                            children: snapshot.data!.docs
                                .map((DocumentSnapshot document) {
                              Map<String, dynamic> data =
                                  document.data() as Map<String, dynamic>;

                              return ListTile(
                                title: Text(data['title']),
                                subtitle: Text(data['description']),
                                trailing: IconButton(
                                  icon: Icon(Icons.play_arrow),
                                  onPressed: () {
                                    Navigator.push(
                                        context,
                                        MaterialPageRoute(
                                            builder: (context) =>
                                                StudentVideoPlay(
                                                  description: data['title'],
                                                  videoTitle:
                                                      data['description'],
                                                  videoUrl: data['url'],
                                                )));
                                  },
                                ),
                              );
                            }).toList(),
                          );
                        },
                      ),
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Text("Uploaded Notes",
                            style: GoogleFonts.roboto(
                                fontSize: 20, fontWeight: FontWeight.w400)),
                        TextButton(
                            onPressed: () {
                              Navigator.push(
                                  context,
                                  MaterialPageRoute(
                                      builder: (context) => SeeAllVideos(
                                            videos: videostemp,
                                          )));
                            },
                            child: Text("See all"))
                      ],
                    ),
                  ],
                ),
              ),
            ])),
      ),
    )));
  }
}
