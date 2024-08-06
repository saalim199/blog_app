part of 'pagenav_bloc.dart';

@immutable
sealed class PagenavEvent {}

final class PageChanged extends PagenavEvent {
  final int page;
  PageChanged({required this.page});
}
