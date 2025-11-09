class AddTransactionModel {
  final int transactionType;
  final double amount;
  final String date;
  final String description;
  final int? categoryId;
  final int paymentType;

  AddTransactionModel({
    required this.transactionType,
    required this.amount,
    required this.date,
    required this.description,
    required this.categoryId,
    required this.paymentType,
  });

  AddTransactionModel copyWith({
    int? transactionType,
    double? amount,
    String? date,
    String? description,
    int? categoryId,
    int? paymentType,
  }) {
    return AddTransactionModel(
      transactionType: transactionType ?? this.transactionType,
      amount: amount ?? this.amount,
      date: date ?? this.date,
      description: description ?? this.description,
      categoryId: categoryId == 0 ? null : categoryId ?? this.categoryId,
      paymentType: paymentType ?? this.paymentType,
    );
  }

  factory AddTransactionModel.fromJson(Map<String, Object?> json) {
    return AddTransactionModel(
      transactionType: json['transactionType'] as int,
      amount: json['amount'] as double,
      date: json['date'] as String,
      description: json['description'] as String,
      categoryId: json['categoryId'] as int,
      paymentType: json['paymentType'] as int,
    );
  }
}
