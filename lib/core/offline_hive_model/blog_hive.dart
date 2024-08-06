import 'dart:typed_data';
import 'package:hive/hive.dart';
part 'blog_hive.g.dart';

@HiveType(typeId: 0)
class BlogHive {
  @HiveField(0)
  final String title;

  @HiveField(1)
  final String id;

  @HiveField(2)
  final Uint8List image;

  BlogHive({required this.title, required this.id, required this.image});
}
