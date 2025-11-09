sealed class TransactionsEvent {}

final class TransactionInitalEvent extends TransactionsEvent {}

final class LabelChangeEvent extends TransactionsEvent {
  final LabelType labelType;
  final bool isShow;
  LabelChangeEvent({required this.labelType, required this.isShow});
}

enum LabelType { today, yesterday, older }
