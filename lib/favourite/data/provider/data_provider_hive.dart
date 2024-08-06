import 'package:blog_app/core/offline_hive_data/hive_data.dart';
import 'package:blog_app/core/offline_hive_model/blog_hive.dart';

class DataProviderHive {
  List<BlogHive> getFavouriteData() {
    List<BlogHive> data = HiveData().getBlogs();
    return data;
  }
}
