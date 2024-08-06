import 'package:flutter/foundation.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

part 'pagenav_event.dart';
part 'pagenav_state.dart';

class PagenavBloc extends Bloc<PagenavEvent, PagenavState> {
  PagenavBloc() : super(PagenavInitial()) {
    on<PageChanged>((event, emit) {
      emit(PagenavLoaded(page: event.page));
    });
  }
}
