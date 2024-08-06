import 'package:blog_app/core/offline_hive_model/blog_hive.dart';
import 'package:hive_flutter/hive_flutter.dart';

class HiveData {
  static const String boxName = 'blogBox';

  static Box<BlogHive> blogBox = Hive.box<BlogHive>(boxName);

  void addBlog(BlogHive blog) async {
    await blogBox.put(blog.id, blog);
  }

  void deleteBlog(String id) async {
    await blogBox.delete(id);
  }

  List<BlogHive> getBlogs() {
    return blogBox.values.toList();
  }

  BlogHive? getBlog(String id) {
    return blogBox.get(id);
  }
}
