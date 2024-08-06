import 'package:blog_app/blog_page/data/repository/data_repo.dart';
import 'package:blog_app/blog_page/models/blog.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter/foundation.dart';

part 'blog_event.dart';
part 'blog_state.dart';

class BlogBloc extends Bloc<BlogEvent, BlogState> {
  BlogBloc() : super(BlogInitial()) {
    on<FetchBlog>((event, emit) async {
      emit(BlogLoading());
      try {
        List<Blog> blogList = await DataRepo().fetchData();
        emit(BlogLoaded(blogList: blogList));
      } catch (e) {
        emit(BlogError(message: e.toString()));
      }
    });
  }
}
