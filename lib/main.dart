import 'package:blog_app/core/offline_hive_model/blog_hive.dart';
import 'package:blog_app/blog_detail/presentation/checkFavBloc/check_favourite_bloc.dart';
import 'package:blog_app/favourite/presentation/bloc/favourite_bloc.dart';
import 'package:blog_app/blog_page/presentation/bloc/blog_bloc.dart';
import 'package:blog_app/homepage/bloc/pagenav_bloc.dart';
import 'package:blog_app/homepage/screens/homepage.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:hive_flutter/hive_flutter.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Hive.initFlutter();
  Hive.registerAdapter(BlogHiveAdapter());
  Hive.openBox<BlogHive>('blogBox');
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MultiBlocProvider(
      providers: [
        BlocProvider<BlogBloc>(
          create: (context) => BlogBloc(),
        ),
        BlocProvider<CheckFavouriteBloc>(
          create: (context) => CheckFavouriteBloc(),
        ),
        BlocProvider<FavouriteBloc>(
          create: (context) => FavouriteBloc(),
        ),
        BlocProvider<PagenavBloc>(
          create: (context) => PagenavBloc(),
        ),
      ],
      child: MaterialApp(
        debugShowCheckedModeBanner: false,
        title: 'Blog App',
        theme: ThemeData(
          brightness: Brightness.dark,
          useMaterial3: true,
        ),
        themeMode: ThemeMode.dark,
        home: Homepage(),
      ),
    );
  }
}
