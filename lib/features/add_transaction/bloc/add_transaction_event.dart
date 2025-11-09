sealed class AddTransactionEvent {}

class AddTransactionInital extends AddTransactionEvent {}

class ChangePaymentType extends AddTransactionEvent {
  final int paymentType;
  ChangePaymentType({required this.paymentType});
}

class ChangeCategory extends AddTransactionEvent {
  final int? categoryId;
  ChangeCategory({required this.categoryId});
}

class ChangeTransactionType extends AddTransactionEvent {
  final int transactionType;
  ChangeTransactionType({required this.transactionType});
}

class UpdateAmount extends AddTransactionEvent {
  final double amount;
  UpdateAmount({required this.amount});
}

class UpdateDate extends AddTransactionEvent {
  final String date;
  UpdateDate({required this.date});
}

class UpdateDescription extends AddTransactionEvent {
  final String description;
  UpdateDescription({required this.description});
}

final class SaveTransaction extends AddTransactionEvent {}
