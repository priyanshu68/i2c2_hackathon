// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class VideoBox extends StatelessWidget {
  final String Videotitle;
  final String Creation;
  const VideoBox({
    Key? key,
    required this.Videotitle,
    required this.Creation,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: Container(
        height: 60,
        child: Row(
          // mainAxisAlignment: MainAxisAlignment.spaceAround,
          children: [
            Image.asset("assets/imgs/maths1.jpg"),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 12.0),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.center,
                mainAxisAlignment: MainAxisAlignment.spaceAround,
                children: [
                  Text(
                    Videotitle,
                    style: GoogleFonts.roboto(
                      fontSize: 16, //fontWeight: FontWeight.w400
                    ),
                  ),
                  Text(Creation)
                ],
              ),
            )
          ],
        ),
      ),
    );
  }
}
