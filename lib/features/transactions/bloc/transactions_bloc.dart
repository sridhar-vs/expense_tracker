import 'package:expense_tracker/features/transactions/bloc/transactions_event.dart';
import 'package:expense_tracker/features/transactions/bloc/transactions_state.dart';
import 'package:expense_tracker/features/transactions/data/transaction_data.dart';
import 'package:expense_tracker/features/transactions/model/transaction_model.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class TransactionsBloc extends Bloc<TransactionsEvent, TransactionsState> {
  TransactionsBloc() : super(const TransactionsState()) {
    TransactionData transactionData = TransactionData();

    on<TransactionInitalEvent>((event, emit) async {
      final List<TransactionModel> transaction = await transactionData
          .getTransactions();
      emit(state.copyWith(transactions: transaction));
    });

    on<LabelChangeEvent>((event, emit) {
      switch (event.labelType) {
        case LabelType.today:
          emit(state.copyWith(isTodayLabelShow: event.isShow));
          break;
        case LabelType.yesterday:
          emit(state.copyWith(isYesterdayLabelShow: event.isShow));
          break;
        case LabelType.older:
          emit(state.copyWith(isOlderLabelShow: event.isShow));
          break;
      }
    });
  }
}
