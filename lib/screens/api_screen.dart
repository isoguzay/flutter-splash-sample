import 'package:flutter/material.dart';
import 'package:flutter_splash/models/Comment.dart';
import 'package:flutter_splash/services/api/api.dart';

class ApiScreen extends StatelessWidget {
  final ApiService apiService = ApiService();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Comments"),
      ),
      body: FutureBuilder(
          future: apiService.getComments(),
          builder:
              (BuildContext context, AsyncSnapshot<List<Comment>> snapshot) {
            if (snapshot.hasData) {
              List<Comment> comments = snapshot.data;
              return ListView(
                  children: comments
                      .map(
                        (Comment comment) => ListTile(
                            // use for handling exceptions from api server entity
                            title: Text((() {
                              if (comment.email != null) {
                                return comment.email;
                              } else {
                                return "There is no email information";
                              }
                            }())),
                            subtitle: Text(comment.body)),
                      )
                      .toList());
            } else {
              return Center(child: CircularProgressIndicator());
            }
          }),
    );
  }
}
