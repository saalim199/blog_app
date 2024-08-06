part of 'blog_bloc.dart';

@immutable
sealed class BlogState {}

final class BlogInitial extends BlogState {}

final class BlogLoading extends BlogState {}

final class BlogLoaded extends BlogState {
  final List<Blog> blogList;

  BlogLoaded({required this.blogList});
}

final class BlogError extends BlogState {
  final String message;

  BlogError({required this.message});
}
