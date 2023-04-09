// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:flutter/foundation.dart';

class UserModel {
  final String name;
  final String email;
  final String doc;
  final String uid;
  final String profiePic;

  UserModel({
    required this.name,
    required this.email,
    required this.doc,
    required this.uid,
    required this.profiePic,
  });

  factory UserModel.fromMap(Map<String, dynamic> map) {
    return UserModel(
        name: map['name'] ?? '',
        email: map['email'] ?? '',
        doc: map['doc'] ?? '',
        uid: map['uid'] ?? '',
        profiePic: map['profilePic'] ?? '');
  }

  Map<String, dynamic> toMap() {
    return {
      'name':name,
      'email':email,
      'doc':doc,
      'uid':uid,
      'profilePic':profiePic
    };
  }
}
