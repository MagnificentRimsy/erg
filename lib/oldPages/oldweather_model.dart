import 'package:flutter/foundation.dart';

class Post {
  final String date;
  final int temperatureC;
  final int temperatureF;
  final String summary;

  Post({
    @required this.date,
    @required this.temperatureC,
    @required this.temperatureF,
    @required this.summary,
  });

  factory Post.fromJson(Map<String, dynamic> json) {
    return Post(
      date: json['date'] as String,
      temperatureC: json['temperatureC'] as int,
      temperatureF: json['temperatureF'] as int,
      summary: json['summary'] as String,
    );
  }

  // todo: Map
}