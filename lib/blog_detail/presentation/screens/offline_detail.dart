import 'package:blog_app/blog_detail/presentation/checkFavBloc/check_favourite_bloc.dart';
import 'package:blog_app/core/offline_hive_data/hive_data.dart';
import 'package:blog_app/core/offline_hive_model/blog_hive.dart';
import 'package:blog_app/favourite/presentation/bloc/favourite_bloc.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class OfflineDetail extends StatefulWidget {
  final BlogHive blog;
  const OfflineDetail({super.key, required this.blog});

  @override
  State<OfflineDetail> createState() => _OfflineDetailState();
}

class _OfflineDetailState extends State<OfflineDetail> {
  @override
  void initState() {
    context.read<CheckFavouriteBloc>().add(CheckFavourite(widget.blog.id));
    super.initState();
  }

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
    return Scaffold(
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
                onPressed: () {
                  if (state is CheckFavouriteInitial) {
                    addBlogtoHive(widget.blog, context);
                    context.read<CheckFavouriteBloc>().add(CheckFavourite(widget.blog.id));
                    context.read<FavouriteBloc>().add(GetFavouriteBlog());
                  } else if (state is CheckedFavourite && state.isFavourite) {
                    removeBlogfromHive(widget.blog, context);
                    context.read<CheckFavouriteBloc>().add(CheckFavourite(widget.blog.id));
                    context.read<FavouriteBloc>().add(GetFavouriteBlog());
                  } else {
                    addBlogtoHive(widget.blog, context);
                    context.read<CheckFavouriteBloc>().add(CheckFavourite(widget.blog.id));
                    context.read<FavouriteBloc>().add(GetFavouriteBlog());
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
              widget.blog.title,
              style: const TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
            ),
            const SizedBox(height: 10),
            Image.memory(widget.blog.image),
            const SizedBox(height: 10),
            const Text(
              'DESCRIPTION OF THE BLOG GOES HERE',
              style: TextStyle(fontSize: 16),
            ),
          ],
        ),
      ),
    );
  }
}
