import 'package:flutter/foundation.dart';

class Post {
  final String fname;
  final String lname;
  final String email;
  final String phone;

  Post({
    @required this.fname,
    @required this.lname,
    @required this.email,
    @required this.phone,
  });

// The factory is to create a post or customer object which takes a string and a dynamic parameter
  factory Post.fromJson(Map<String, dynamic> json) {
    return Post(
      fname: json['fname'] as String,
      lname: json['lname'] as String,
      email: json['email'] as String,
      phone: json['phone'] as String,
    );
  }

  // todo: Map
}