import 'package:expense_tracker/features/transactions/model/transaction_model.dart';

class DashboardState {
  final List<TransactionModel> transactionList;
  final double expense;
  final double income;

  DashboardState({
    this.transactionList = const [],
    this.expense = 0.0,
    this.income = 0.0,
  });

  DashboardState copyWith({
    List<TransactionModel>? transactionList,
    double? expense,
    double? income,
  }) {
    return DashboardState(
      transactionList: transactionList ?? this.transactionList,
      expense: expense ?? this.expense,
      income: income ?? this.income,
    );
  }
}
