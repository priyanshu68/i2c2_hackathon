// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:i2c2_hackathon/teachers/CatagoryDetailpage.dart';

import 'package:i2c2_hackathon/teachers/VIdeoTile.dart';

class SeeAllVideos extends StatelessWidget {
  final List videos;
  const SeeAllVideos({
    Key? key,
    required this.videos,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.all(16.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Row(
                children: [
                  IconButton(
                      onPressed: () {
                        Navigator.pop(context);
                      },
                      icon: Icon(Icons.arrow_back_ios)),
                  Text(
                    "Your Videos",
                    style: GoogleFonts.roboto(fontSize: 30),
                  ),
                ],
              ),
              SizedBox(
                height: 20,
              ),
              Expanded(
                  child: ListView.builder(
                      itemCount: videos.length,
                      itemBuilder: (context, index) {
                        return VideoBox(
                            Videotitle: videos[index], Creation: "Creation");
                      }))
            ],
          ),
        ),
      ),
    );
  }
}
