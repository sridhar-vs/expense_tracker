part of 'home_bloc.dart';

sealed class HomeEvent {}

class ChangePageIndex extends HomeEvent {
  final int pageIndex;

  ChangePageIndex(this.pageIndex);
}
