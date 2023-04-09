import 'dart:io';

import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:image_picker/image_picker.dart';

Future<File?> getImage(BuildContext) async {
  File? img;
  try {
    final imageTemp =
        await ImagePicker().pickImage(source: ImageSource.gallery);
    if (imageTemp != null) {
      img = File(imageTemp.path);
    }
  } catch (e) {
    Fluttertoast.showToast(
        msg: '${e}',
        toastLength: Toast.LENGTH_SHORT,
        gravity: ToastGravity.BOTTOM,
        timeInSecForIosWeb: 1,
        backgroundColor: Color.fromARGB(255, 198, 80, 17),
        textColor: Colors.white,
        fontSize: 16.0);
  }
  return img;
}
