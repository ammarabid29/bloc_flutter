import 'dart:convert';
import 'package:bloc_flutter/post_app/model/post_model.dart';
import 'package:http/http.dart' as http;

class PostRepo {
  const PostRepo();

  Future<List<PostModel>> fetchPosts() async {
    try {
      final response = await http.get(
        Uri.parse('https://jsonplaceholder.typicode.com/comments'),
      );

      if (response.statusCode == 200) {
        final List<dynamic> body = json.decode(response.body);
        return body.map((element) => PostModel.fromJson(element)).toList();
      } else {
        throw Exception('Failed to load posts: ${response.statusCode}');
      }
    } catch (e) {
      throw Exception('Failed to load posts: $e');
    }
  }
}
