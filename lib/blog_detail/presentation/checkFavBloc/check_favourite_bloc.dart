import 'package:blog_app/core/offline_hive_data/hive_data.dart';
import 'package:blog_app/core/offline_hive_model/blog_hive.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

part 'check_favourite_event.dart';
part 'check_favourite_state.dart';

class CheckFavouriteBloc extends Bloc<CheckFavouriteEvent, CheckFavouriteState> {
  CheckFavouriteBloc() : super(CheckFavouriteInitial()) {
    on<CheckFavourite>((event, emit) {
      BlogHive? blog = HiveData().getBlog(event.blogId);
      if (blog != null) {
        emit(CheckedFavourite(true));
      } else {
        emit(CheckedFavourite(false));
      }
    });
  }
}
