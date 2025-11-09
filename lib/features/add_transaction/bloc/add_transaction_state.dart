import 'package:equatable/equatable.dart';
import 'package:expense_tracker/features/add_transaction/model/add_transaction_model.dart';
import 'package:expense_tracker/features/categories/model/categories_model.dart';

class AddTransactionState extends Equatable {
  final List<CategoriesModel> categories;
  final AddTransactionModel addTransactionModel;
  final bool isSave;

  AddTransactionState({
    this.categories = const [],
    AddTransactionModel? addTransactionModel,
    this.isSave = false,
  }) : addTransactionModel =
           addTransactionModel ??
           AddTransactionModel(
             amount: 0,
             date: '',
             description: '',
             categoryId: null,
             transactionType: 2,
             paymentType: 1,
           );

  AddTransactionState copyWith({
    List<CategoriesModel>? categories,
    AddTransactionModel? addTransactionModel,
    bool? isSave,
  }) {
    return AddTransactionState(
      categories: categories ?? this.categories,
      addTransactionModel: addTransactionModel ?? this.addTransactionModel,
      isSave: isSave ?? this.isSave,
    );
  }

  @override
  List<Object?> get props => [categories, addTransactionModel, isSave];
}
