// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:flutter/material.dart';

class CatagoryTile extends StatelessWidget {
  final String catagory;
  final Color color;
  final String ImagePath;

  const CatagoryTile({
    Key? key,
    required this.catagory,
    required this.color,
    required this.ImagePath,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Container(
          height: 90,
          width: 90,
          decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(16), color: color),
          child: Center(
              child: Image.asset(
            ImagePath,
          )),
        ),
        SizedBox(
          height: 10,
        ),
        Text(catagory)
      ],
    );
  }
}
