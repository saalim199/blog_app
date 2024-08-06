part of 'favourite_bloc.dart';

@immutable
sealed class FavouriteState {}

final class FavouriteInitial extends FavouriteState {}

final class FavouriteLoading extends FavouriteState {}

final class FavouriteLoaded extends FavouriteState {
  final List<BlogHive> data;

  FavouriteLoaded(this.data);
}

final class FavouriteError extends FavouriteState {
  final String message;

  FavouriteError(this.message);
}
