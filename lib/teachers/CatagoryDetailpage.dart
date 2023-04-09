// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:flutter/material.dart';
import 'package:flutter_speed_dial/flutter_speed_dial.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:i2c2_hackathon/teachers/NavigationbarTeacher.dart';
import 'package:i2c2_hackathon/teachers/SeeAllVideos.dart';
import 'package:i2c2_hackathon/teachers/VIdeoTile.dart';

import 'package:i2c2_hackathon/teachers/teacherScreen.dart';

class CategoryDetails extends StatefulWidget {
  final String subject;

  const CategoryDetails({
    Key? key,
    required this.subject,
  }) : super(key: key);

  @override
  State<CategoryDetails> createState() => _CategoryDetailsState();
}

class _CategoryDetailsState extends State<CategoryDetails> {
  List videos = [
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
      floatingActionButton: SpeedDial(
        backgroundColor: Colors.amber[700],
        animatedIcon: AnimatedIcons.add_event,
        children: [
          SpeedDialChild(
              onTap: () {
                showAboutDialog(context: context);
              },
              child: Icon(Icons.play_circle_fill_outlined),
              label: "Add A Video"),
          SpeedDialChild(
              onTap: () {
                showAboutDialog(context: context);
              },
              child: Icon(Icons.picture_as_pdf),
              label: "Add A Note")
        ],
      ),
      body: SafeArea(
        child: Center(
          child: Container(
            child: Padding(
              padding: const EdgeInsets.all(12.0),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Row(
                    children: [
                      IconButton(
                          onPressed: () {
                            Navigator.push(
                                context,
                                MaterialPageRoute(
                                    builder: (Context) => TeacherNav()));
                          },
                          icon: Icon(Icons.arrow_back_ios)),
                    ],
                  ),
                  Text(
                    widget.subject,
                    style: GoogleFonts.roboto(fontSize: 40),
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
                                                videos: videos,
                                              )));
                                },
                                child: Text("See all"))
                          ],
                        ),
                        Container(
                          height: 250,
                          child: ListView.builder(
                              physics: NeverScrollableScrollPhysics(),
                              itemCount: videos.length,
                              itemBuilder: (context, index) {
                                return VideoBox(
                                    Videotitle: "Videotitle",
                                    Creation: "Creation");
                              }),
                        )
                      ],
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
                                          videos: videos,
                                        )));
                          },
                          child: Text("See all"))
                    ],
                  ),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}
