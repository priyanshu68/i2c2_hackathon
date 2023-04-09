// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:flutter/material.dart';

class CatagoryTile extends StatelessWidget {
  final String catagory;
  const CatagoryTile({
    Key? key,
    required this.catagory,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Container(
          height: 90,
          width: 90,
          decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(16),
              color: Color.fromARGB(255, 242, 113, 53)),
          child: Center(
              child: Image.asset(
            "assets/imgs/Login2.png",
            fit: BoxFit.cover,
          )),
        ),
        SizedBox(
          height: 10,
        ),
        Text("Subjects")
      ],
    );
  }
}
