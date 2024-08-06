import 'package:blog_app/blog_page/presentation/screens/blogpage.dart';
import 'package:blog_app/favourite/presentation/screens/favourite_page.dart';
import 'package:blog_app/homepage/bloc/pagenav_bloc.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class Homepage extends StatelessWidget {
  Homepage({super.key});

  int _page = 0;
  final PageController pageController = PageController();

  void navigationTapped(int value) {
    pageController.jumpToPage(value);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        title: const Text('Blogs'),
      ),
      body: PageView(
        controller: pageController,
        physics: const NeverScrollableScrollPhysics(),
        onPageChanged: (value) {
          context.read<PagenavBloc>().add(PageChanged(page: value));
        },
        children: const [
          Blogpage(),
          FavouritePage(),
        ],
      ),
      bottomNavigationBar: BlocBuilder<PagenavBloc, PagenavState>(
        builder: (context, state) {
          if (state is PagenavLoaded) {
            _page = state.page;
          }
          return CupertinoTabBar(
            height: 70,
            iconSize: 30,
            backgroundColor: Colors.white,
            items: const [
              BottomNavigationBarItem(
                icon: Icon(Icons.home),
                label: 'Home',
              ),
              BottomNavigationBarItem(
                icon: Icon(Icons.favorite),
                label: 'Favourites',
              ),
            ],
            activeColor: Colors.black,
            currentIndex: _page,
            onTap: (value) => navigationTapped(value),
          );
        },
      ),
    );
  }
}
