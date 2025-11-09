import 'package:expense_tracker/core/database/database_helper.dart';
import 'package:expense_tracker/features/transactions/model/transaction_model.dart';

class TransactionData {
  Future<List<TransactionModel>> getTransactions() async {
    final database = DatabaseHelper.instance;
    final db = await database.database;

    final result = await db.rawQuery(
      "select cat.name as categoriesName, cat.icon as icon, tns.* from Transactions as tns left join categories as cat on cat.id=tns.category_id",
    );

    List<TransactionModel> transactions = [];
    for (var value in result) {
      final transaction = TransactionModel.fromJson(value);
      transactions.add(transaction);
    }
    return transactions;
  }
}
