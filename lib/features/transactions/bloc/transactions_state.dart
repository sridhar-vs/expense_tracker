import 'package:equatable/equatable.dart';
import 'package:expense_tracker/features/transactions/model/transaction_model.dart';

class TransactionsState extends Equatable {
  final List<TransactionModel> transactions;
  final bool isTodayLabelShow;
  final bool isYesterdayLabelShow;
  final bool isOlderLabelShow;
  const TransactionsState({
    this.transactions = const [],
    this.isOlderLabelShow = false,
    this.isTodayLabelShow = false,
    this.isYesterdayLabelShow = false,
  });

  TransactionsState copyWith({
    List<TransactionModel>? transactions,
    bool? isOlderLabelShow,
    bool? isTodayLabelShow,
    bool? isYesterdayLabelShow,
  }) {
    return TransactionsState(
      transactions: transactions ?? this.transactions,
      isOlderLabelShow: isOlderLabelShow ?? this.isOlderLabelShow,
      isTodayLabelShow: isTodayLabelShow ?? this.isTodayLabelShow,
      isYesterdayLabelShow: isYesterdayLabelShow ?? this.isYesterdayLabelShow,
    );
  }

  @override
  List<Object?> get props => [
    transactions,
    isOlderLabelShow,
    isTodayLabelShow,
    isYesterdayLabelShow,
  ];
}
