import 'dart:convert';

import 'package:blog_app/blog_page/data/provider/data_provider.dart';
import 'package:blog_app/blog_page/models/blog.dart';
import 'package:either_dart/either.dart';
import 'package:http/http.dart' as http;

class DataRepo {
  Future<List<Blog>> fetchData() async {
    Either<Exception, http.Response> response = await DataProvider().fetchData();
    try {
      if (response.isRight) {
        Map<String, dynamic> data = jsonDecode(response.right.body);
        List<dynamic> blogs = data['blogs'].map((blog) => Blog.fromJson(blog)).toList();
        List<Blog> blogList = List<Blog>.from(blogs);
        return blogList;
      } else {
        throw Exception('Failed to fetch data');
      }
    } catch (e) {
      throw Exception(e);
    }
  }
}
