part of 'pagenav_bloc.dart';

@immutable
sealed class PagenavState {}

final class PagenavInitial extends PagenavState {
  final int page = 0;
}

final class PagenavLoaded extends PagenavState {
  final int page;

  PagenavLoaded({required this.page});
}
