import 'package:blog_app/blog_detail/presentation/screens/detail_page.dart';
import 'package:blog_app/core/widgets/my_tile.dart';
import 'package:blog_app/blog_page/presentation/bloc/blog_bloc.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class Blogpage extends StatefulWidget {
  const Blogpage({super.key});

  @override
  State<Blogpage> createState() => _BlogpageState();
}

class _BlogpageState extends State<Blogpage> {
  @override
  void initState() {
    context.read<BlogBloc>().add(FetchBlog());
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<BlogBloc, BlogState>(
      builder: (context, state) {
        if (state is BlogLoading) {
          return const Center(
            child: CircularProgressIndicator(),
          );
        } else if (state is BlogLoaded) {
          if (state.blogList.isEmpty) {
            return const Center(
              child: Text('NO BLOGS'),
            );
          }
          return Padding(
            padding: const EdgeInsets.all(8.0),
            child: ListView.builder(
              itemCount: state.blogList.length,
              itemBuilder: (context, index) {
                return MyTile(
                  title: state.blogList[index].title,
                  onTap: () => Navigator.of(context).push(
                    MaterialPageRoute(
                      builder: (context) => Detailpage(blog: state.blogList[index]),
                    ),
                  ),
                  imageUrl: state.blogList[index].image,
                );
              },
            ),
          );
        } else if (state is BlogError) {
          return const Center(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Text('Unable to fetch blogs.'),
                Text('You can view your favourite saved blogs.'),
              ],
            ),
          );
        } else {
          return Center(
            child: Container(),
          );
        }
      },
    );
  }
}
