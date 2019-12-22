import 'dart:convert';
import 'package:flutter_splash/models/Comment.dart';
import 'package:http/http.dart';

class ApiService {
  final String apiServiceUrl = "https://jsonplaceholder.typicode.com/posts";

  Future<List<Comment>> getComments() async {
    Response res = await get(apiServiceUrl);

    if (res.statusCode == 200) {
      List<dynamic> body = jsonDecode(res.body);

      List<Comment> comments = body
          .map(
            (dynamic item) => Comment.fromJson(item),
          )
          .toList();
      return comments;
    } else {
      throw "Opps.. A problem !";
    }
  }
}
