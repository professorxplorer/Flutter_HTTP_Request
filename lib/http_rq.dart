import 'dart:convert';
import 'package:http/http.dart';
import 'package:http_flutter/post_model.dart';

class HttpService {
  final String postsURL = "https://jsonplaceholder.typicode.com/posts";

  Future<void> deletePost(int id, {post}) async {
    Response res = await delete("$postsURL/$id");
    if (res.statusCode == 200) {
      print("object done ");
    } else {
      throw "Can't get posts.";
    }
  }

  Future<List<Post>> getPosts() async {
    Response res = await get(postsURL);

    if (res.statusCode == 200) {
      List<dynamic> body = jsonDecode(res.body);

      List<Post> posts = body
          .map(
            (dynamic item) => Post.fromJson(item),
          )
          .toList();

      return posts;
    } else {
      throw "Can't get posts.";
    }
  }
}
