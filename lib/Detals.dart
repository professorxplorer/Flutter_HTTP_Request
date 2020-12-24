import 'package:flutter/material.dart';
import 'package:http_flutter/http_rq.dart';
import 'package:http_flutter/post_model.dart';

class PostDetail extends StatelessWidget {
  final Post post;
  final HttpService httpService = HttpService();
  PostDetail({@required this.post});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: Text(post.title),
        ),
        floatingActionButton: FloatingActionButton(
            child: Icon(Icons.delete),
            onPressed: () async {
              await httpService.deletePost(post.id);
              Navigator.of(context).pop();
            }),
        body: SingleChildScrollView(
          child: Padding(
            padding: const EdgeInsets.all(12.0),
            child: Column(
              children: <Widget>[
                Card(
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: <Widget>[
                      ListTile(
                        title: Text("Title"),
                        subtitle: Text(post.title),
                      ),
                      ListTile(
                        title: Text("ID"),
                        subtitle: Text("${post.id}"),
                      ),
                      ListTile(
                        title: Text("Body"),
                        subtitle: Text(post.body),
                      ),
                      ListTile(
                        title: Text("User ID"),
                        subtitle: Text("${post.userId}"),
                      ),
                    ],
                  ),
                ),
              ],
            ),
          ),
        ));
  }
}
