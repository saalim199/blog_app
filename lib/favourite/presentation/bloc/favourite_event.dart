part of 'favourite_bloc.dart';

@immutable
sealed class FavouriteEvent {}

final class GetFavouriteBlog extends FavouriteEvent {}
