import 'dart:io';

import 'package:file_picker/file_picker.dart';
import 'package:flutter/material.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_storage/firebase_storage.dart';
import 'package:image_picker/image_picker.dart';
import 'package:path/path.dart';

class AddVideoForm extends StatefulWidget {
  final String category;

  const AddVideoForm({Key? key, required this.category}) : super(key: key);

  @override
  _AddVideoFormState createState() => _AddVideoFormState();
}

class _AddVideoFormState extends State<AddVideoForm> {
  final FirebaseFirestore _firestore = FirebaseFirestore.instance;
  final FirebaseStorage _storage = FirebaseStorage.instance;
//final picker = ImagePicker();
  PlatformFile? pickedfile;
  final _formKey = GlobalKey<FormState>();
  late String _videoTitle;
  late String _videoDescription;
  late String _videoUrl;
  bool _isLoading = false;
  String? _uploadedFileURL;
  String? videoUrl;

  @override
  void initState() {
    super.initState();
    setState(() {
      _isLoading = false;
      _uploadedFileURL = "";
    });
  }

  Future<void> _uploadFile() async {
    setState(() {
      _isLoading = true;
    });

    String fileName = basename(pickedfile!.path!);
    Reference firebaseStorageRef =
        _storage.ref().child('${widget.category}/$fileName');
    UploadTask uploadTask = firebaseStorageRef.putFile(File(pickedfile!.path!));
    TaskSnapshot taskSnapshot = await uploadTask;
    String downloadUrl = await taskSnapshot.ref.getDownloadURL();
    videoUrl = downloadUrl;
    setState(() {
      _isLoading = false;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        foregroundColor: Colors.black,
        backgroundColor: Color.fromARGB(255, 249, 249, 249),
        elevation: 0,
        title: Text(
          'Add Video',
          style: TextStyle(color: Colors.black),
        ),
      ),
      body: _isLoading
          ? Center(child: CircularProgressIndicator())
          : Padding(
              padding: const EdgeInsets.all(16.0),
              child: Form(
                key: _formKey,
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    TextFormField(
                      decoration: InputDecoration(labelText: 'Title'),
                      validator: (value) {
                        if (value!.isEmpty) {
                          return 'Please enter a title';
                        }
                        return null;
                      },
                      onSaved: (value) {
                        _videoTitle = value!;
                      },
                    ),
                    TextFormField(
                      decoration: InputDecoration(labelText: 'Description'),
                      validator: (value) {
                        if (value!.isEmpty) {
                          return 'Please enter a description';
                        }
                        return null;
                      },
                      onSaved: (value) {
                        _videoDescription = value!;
                      },
                    ),
                    SizedBox(height: 16.0),
                    ElevatedButton(
                      onPressed: () async {
                        final result = await FilePicker.platform.pickFiles();
                        if (result == null) {
                          return;
                        }
                        setState(() {
                          pickedfile = result.files.first;
                        });
                      },
                      child: Text('Add video'),
                    ),
                    pickedfile != null
                        ? Container(
                            child: Text(pickedfile!.name),
                          )
                        : SizedBox(
                            height: 32,
                          ),
                    ElevatedButton(
                        onPressed: () async {
                          if (!_formKey.currentState!.validate()) {
                            return;
                          }
                          _formKey.currentState!.save();
                          await _uploadFile();
                          print(videoUrl);
                          await _firestore.collection(widget.category).add({
                            'title': _videoTitle,
                            'description': _videoDescription,
                            'url': videoUrl,
                          });
                          Navigator.pop(context);
                        },
                        child: Text("Upload"))
                  ],
                ),
              ),
            ),
    );
  }

  // void _submitForm() async {

  //   if (_formKey.currentState!.validate()) {
  //     _formKey.currentState!.save();
  //     setState(() {
  //       _isLoading = true;
  //     });
  //     try {
  //       final Reference storageReference = FirebaseStorage.instance
  //           .ref()
  //           .child('${widget.category}/${_videoTitle}');
  //       final UploadTask uploadTask = storageReference.putData(pickedfile!.bytes!);
  //       await uploadTask.whenComplete(() async {
  //         String downloadUrl = await storageReference.getDownloadURL();
  //         _videoUrl = downloadUrl;
  //       });
  //       await FirebaseFirestore.instance.collection(widget.category).add({
  //         'title': _videoTitle,
  //         'description': _videoDescription,
  //         'url': _videoUrl
  //       });
  //       setState(() {
  //         _isLoading = false;
  //       });
  //       Navigator.of(context).pop();
  //     } catch (error) {
  //       print(error);
  //       setState(() {
  //         _isLoading = false;
  //       });
  //       showDialog(
  //           context: context,
  //           builder: (ctx) => AlertDialog(
  //                 title: Text('An error occurred!'),
  //                 content: Text('Something went wrong.'),
  //                 actions: <Widget>[
  //                   TextButton(
  //                     onPressed: () {
  //                       Navigator.of(ctx).pop();
  //                     },
  //                     child: Text('Okay'),
  //                   )
  //                 ],
  //               ));
  //     }
  //   }
  // }
}
