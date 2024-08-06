part of 'check_favourite_bloc.dart';

@immutable
sealed class CheckFavouriteEvent {}

final class CheckFavourite extends CheckFavouriteEvent {
  final String blogId;

  CheckFavourite(this.blogId);
}
