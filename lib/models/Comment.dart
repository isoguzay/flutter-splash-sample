import 'package:flutter/material.dart';
import 'package:flutter/foundation.dart'; 

class Comment {
  final int userId;
  final int id;
  final String title;
  final bool completed;

  Comment(
      {@required this.userId,
      @required this.id,
      @required this.title,
      @required this.completed});

  factory Comment.fromJson(Map<String, dynamic> json) {
    return Comment(
        userId: json['userId'] as int,
        id: json['id'] as int,
        title: json['title'] as String,
        completed: json['completed'] as bool);
  }
}
