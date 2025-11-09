import 'package:expense_tracker/features/add_transaction/bloc/add_transaction_event.dart';
import 'package:expense_tracker/features/add_transaction/bloc/add_transaction_state.dart';
import 'package:expense_tracker/features/add_transaction/data/add_transaction_data.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class AddTransactionBloc
    extends Bloc<AddTransactionEvent, AddTransactionState> {
  AddTransactionBloc() : super(AddTransactionState()) {
    final AddTransactionData addTransactionData = AddTransactionData();
    on<AddTransactionEvent>((event, emit) {});

    on<AddTransactionInital>((event, emit) async {
      final categories = await addTransactionData.getTransactions();
      emit(state.copyWith(categories: categories));
    });

    on<ChangeCategory>((event, emit) async {
      final updatedModel = state.addTransactionModel.copyWith(
        categoryId: event.categoryId,
      );
      emit(state.copyWith(addTransactionModel: updatedModel));
    });

    on<ChangeTransactionType>((event, emit) async {
      final updatedModel = state.addTransactionModel.copyWith(
        transactionType: event.transactionType,
        categoryId: 0,
        paymentType: 1,
      );
      emit(state.copyWith(addTransactionModel: updatedModel));
    });

    on<ChangePaymentType>((event, emit) async {
      final updatedModel = state.addTransactionModel.copyWith(
        paymentType: event.paymentType,
      );
      emit(state.copyWith(addTransactionModel: updatedModel));
    });

    on<UpdateAmount>((event, emit) {
      final updatedModel = state.addTransactionModel.copyWith(
        amount: event.amount,
      );
      emit(state.copyWith(addTransactionModel: updatedModel));
    });
    on<UpdateDate>((event, emit) {
      final updatedModel = state.addTransactionModel.copyWith(date: event.date);
      emit(state.copyWith(addTransactionModel: updatedModel));
    });
    on<UpdateDescription>((event, emit) {
      final updatedModel = state.addTransactionModel.copyWith(
        description: event.description,
      );
      emit(state.copyWith(addTransactionModel: updatedModel));
    });

    on<SaveTransaction>((event, emit) async {
      await addTransactionData.insertTransaction(
        data: state.addTransactionModel,
      );
      emit(state.copyWith(isSave: true));
    });
  }
}
