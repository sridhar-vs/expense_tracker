import 'package:expense_tracker/features/dashboard/bloc/dashboard_event.dart';
import 'package:expense_tracker/features/dashboard/bloc/dashboard_state.dart';
import 'package:expense_tracker/features/dashboard/data/dashboard_data.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class DashboardBloc extends Bloc<DashboardEvent, DashboardState> {
  DashboardBloc() : super(DashboardState()) {
    DashboardData dashboardData = DashboardData();
    on<DashboardEvent>((event, emit) {});
    on<DashboardInitialEvent>((event, emit) async {
      final Map<String, dynamic> result = await dashboardData.getInitial();
      emit(
        state.copyWith(
          transactionList: result['transaction'],
          expense: result['expense'],
          income: result['income'],
        ),
      );
    });
  }
}
