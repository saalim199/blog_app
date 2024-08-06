import 'package:blog_app/core/offline_hive_data/hive_data.dart';
import 'package:blog_app/core/offline_hive_model/blog_hive.dart';
import 'package:blog_app/blog_detail/presentation/checkFavBloc/check_favourite_bloc.dart';
import 'package:blog_app/blog_page/models/blog.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class Detailpage extends StatelessWidget {
  final Blog blog;
  const Detailpage({
    super.key,
    required this.blog,
  });

  void addBlogtoHive(BlogHive blog, BuildContext context) async {
    try {
      HiveData().addBlog(blog);
      ScaffoldMessenger.of(context).showSnackBar(
        const SnackBar(
          content: Text('Blog added to favourites'),
        ),
      );
    } catch (e) {
      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(
          content: Text('Error: $e'),
        ),
      );
    }
  }

  void removeBlogfromHive(BlogHive blog, BuildContext context) async {
    try {
      HiveData().deleteBlog(blog.id);
      ScaffoldMessenger.of(context).showSnackBar(
        const SnackBar(
          content: Text('Blog removed from favourites'),
        ),
      );
    } catch (e) {
      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(
          content: Text('Error: $e'),
        ),
      );
    }
  }

  @override
  Widget build(BuildContext context) {
    context.read<CheckFavouriteBloc>().add(CheckFavourite(blog.id));
    return SafeArea(
      child: Scaffold(
        appBar: AppBar(
          actions: [
            BlocBuilder<CheckFavouriteBloc, CheckFavouriteState>(
              builder: (context, state) {
                return IconButton(
                  icon: (state is CheckFavouriteInitial)
                      ? const Icon(Icons.favorite)
                      : (state is CheckedFavourite && state.isFavourite)
                          ? const Icon(Icons.favorite)
                          : const Icon(Icons.favorite_border),
                  onPressed: () async {
                    Uint8List image =
                        (await NetworkAssetBundle(Uri.parse(blog.image)).load(blog.image)).buffer.asUint8List();
                    BlogHive blogHive = BlogHive(
                      id: blog.id,
                      title: blog.title,
                      image: image,
                    );
                    if (state is CheckFavouriteInitial) {
                      if (!context.mounted) return;
                      addBlogtoHive(blogHive, context);
                      context.read<CheckFavouriteBloc>().add(CheckFavourite(blog.id));
                    } else if (state is CheckedFavourite && state.isFavourite) {
                      if (!context.mounted) return;
                      removeBlogfromHive(blogHive, context);
                      context.read<CheckFavouriteBloc>().add(CheckFavourite(blog.id));
                    } else {
                      if (!context.mounted) return;
                      addBlogtoHive(blogHive, context);
                      context.read<CheckFavouriteBloc>().add(CheckFavourite(blog.id));
                    }
                  },
                );
              },
            ),
          ],
        ),
        body: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 10),
          child: Column(
            children: [
              Text(
                blog.title,
                style: const TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
              ),
              const SizedBox(height: 10),
              Image.network(blog.image),
              const SizedBox(height: 10),
              const Text(
                'DESCRIPTION OF THE BLOG GOES HERE',
                style: TextStyle(fontSize: 16),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
