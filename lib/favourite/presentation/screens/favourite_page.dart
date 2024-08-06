import 'package:blog_app/core/widgets/my_tile.dart';
import 'package:blog_app/favourite/presentation/bloc/favourite_bloc.dart';
import 'package:blog_app/blog_detail/presentation/screens/offline_detail.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class FavouritePage extends StatefulWidget {
  const FavouritePage({super.key});

  @override
  State<FavouritePage> createState() => _FavouritePageState();
}

class _FavouritePageState extends State<FavouritePage> {
  @override
  void initState() {
    context.read<FavouriteBloc>().add(GetFavouriteBlog());
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<FavouriteBloc, FavouriteState>(
      builder: (context, state) {
        if (state is FavouriteLoading) {
          return const Center(
            child: CircularProgressIndicator(),
          );
        } else if (state is FavouriteLoaded) {
          if (state.data.isEmpty) {
            return const Center(
              child: Text('No Favourite Blogs'),
            );
          }
          return Padding(
            padding: const EdgeInsets.all(8.0),
            child: ListView.builder(
              itemCount: state.data.length,
              itemBuilder: (context, index) {
                return MyTile(
                  title: state.data[index].title,
                  onTap: () => Navigator.of(context).push(
                    MaterialPageRoute(
                      builder: (context) => OfflineDetail(blog: state.data[index]),
                    ),
                  ),
                  imageBytes: state.data[index].image,
                );
              },
            ),
          );
        } else if (state is FavouriteError) {
          return Center(
            child: Text(state.message),
          );
        } else {
          return const Center(
            child: CircularProgressIndicator(),
          );
        }
      },
    );
  }
}
