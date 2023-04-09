// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:flutter_speed_dial/flutter_speed_dial.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:i2c2_hackathon/teachers/NavigationbarTeacher.dart';
import 'package:i2c2_hackathon/teachers/SeeAllVideos.dart';
import 'package:i2c2_hackathon/teachers/VIdeoTile.dart';
import 'package:i2c2_hackathon/teachers/addVideoForm.dart';

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
  // List<QueryDocumentSnapshot<Map<String, dynamic>>> videos = [];
  //bool isLoading = true;

  @override
  // void initState() {
  //   super.initState();
  //   getVideos();
  // }

  // Future<void> getVideos() async {
  //   final videoRef = FirebaseFirestore.instance
  //       .collection('videos')
  //       .where('category', isEqualTo: widget.subject);
  //   final snapshot = await videoRef.get();
  //   //print(snapshot.docs.toString());
  //   if (snapshot.size == 0) {
  //     print('No documents found.');
  //   } else {
  //     setState(() {
  //       isLoading = false;
  //       videos = snapshot.docs;
  //     });
  //   }
  // }

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
        floatingActionButton: SpeedDial(
          backgroundColor: Colors.amber[700],
          animatedIcon: AnimatedIcons.add_event,
          children: [
            SpeedDialChild(
                onTap: () {
                  Navigator.push(
                      context,
                      MaterialPageRoute(
                          builder: (context) =>
                              AddVideoForm(category: widget.subject)));
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
                                        fontSize: 20,
                                        fontWeight: FontWeight.w400)),
                                TextButton(
                                    onPressed: () {
                                      Navigator.push(
                                          context,
                                          MaterialPageRoute(
                                              builder: (context) =>
                                                  SeeAllVideos(
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
                                    .collection(widget.subject)
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
                                      Map<String, dynamic> data = document
                                          .data() as Map<String, dynamic>;

                                      return ListTile(
                                        title: Text(data['title']),
                                        subtitle: Text(data['description']),
                                        trailing: IconButton(
                                          icon: Icon(Icons.play_arrow),
                                          onPressed: () {
                                            // navigate to video player widget and play the video
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
                                        fontSize: 20,
                                        fontWeight: FontWeight.w400)),
                                TextButton(
                                    onPressed: () {
                                      Navigator.push(
                                          context,
                                          MaterialPageRoute(
                                              builder: (context) =>
                                                  SeeAllVideos(
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
