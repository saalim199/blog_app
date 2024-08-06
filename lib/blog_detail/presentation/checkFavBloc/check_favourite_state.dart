part of 'check_favourite_bloc.dart';

@immutable
sealed class CheckFavouriteState {}

final class CheckFavouriteInitial extends CheckFavouriteState {}

final class CheckedFavourite extends CheckFavouriteState {
  final bool isFavourite;

  CheckedFavourite(this.isFavourite);
}
