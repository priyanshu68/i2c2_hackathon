// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:flutter/material.dart';

class TeacherCategoryTile extends StatelessWidget {
  final String catagory;
   final Color color;
    final String ImagePath;

  const TeacherCategoryTile({
    Key? key,
    required this.catagory,
    required this.color,
    required this.ImagePath,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Container(
          height: 90,
          width: 90,
          decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(16),
              color:color),
          child: Center(
              child: Image.asset(
            ImagePath,
            fit: BoxFit.cover,
          )),
        ),
        SizedBox(
          height: 10,
        ),
        Center(child: Text(catagory))
      ],
    );
  }
}
