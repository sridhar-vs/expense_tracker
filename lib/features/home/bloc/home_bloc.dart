import 'package:expense_tracker/features/home/bloc/home_state.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

part 'home_event.dart';

class HomeBloc extends Bloc<HomeEvent, HomeState> {
  HomeBloc() : super(HomeState()) {
    on<HomeEvent>((event, emit) {});

    on<ChangePageIndex>((event, emit) {
      emit(state.copyWith(currentIndex: event.pageIndex));
    });
  }
}
