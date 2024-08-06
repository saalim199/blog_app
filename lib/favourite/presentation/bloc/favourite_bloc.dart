import 'package:blog_app/core/offline_hive_model/blog_hive.dart';
import 'package:blog_app/favourite/data/repository/data_repo.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter/foundation.dart';
part 'favourite_event.dart';
part 'favourite_state.dart';

class FavouriteBloc extends Bloc<FavouriteEvent, FavouriteState> {
  FavouriteBloc() : super(FavouriteInitial()) {
    on<GetFavouriteBlog>((event, emit) {
      emit(FavouriteLoading());
      try {
        List<BlogHive> data = DataRepo().getFavouriteData();
        emit(FavouriteLoaded(data));
      } catch (e) {
        emit(FavouriteError(e.toString()));
      }
    });
  }
}
