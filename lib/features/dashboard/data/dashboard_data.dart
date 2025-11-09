import 'package:expense_tracker/core/database/database_helper.dart';
import 'package:expense_tracker/features/transactions/model/transaction_model.dart';

class DashboardData {
  Future<Map<String, dynamic>> getInitial() async {
    final database = DatabaseHelper.instance;
    final db = await database.database;

    final result = await db.rawQuery(
      "select cat.name as categoriesName, cat.icon as icon, tns.* from Transactions as tns left join categories as cat on cat.id=tns.category_id order by date desc",
    );

    final expense = await db.rawQuery(
      "select sum(amount) as amount from Transactions where type = 2",
    );
    final income = await db.rawQuery(
      "select sum(amount) as amount from Transactions where type = 1",
    );
    List<TransactionModel> transactions = [];
    for (var value in result) {
      final transaction = TransactionModel.fromJson(value);
      transactions.add(transaction);
    }

    return {
      "transaction": transactions,
      "expense": expense.isNotEmpty
          ? double.tryParse(expense[0]['amount'].toString()) ?? 0.0
          : 0.0,
      "income": income.isNotEmpty
          ? double.tryParse(income[0]['amount'].toString()) ?? 0.0
          : 0.0,
    };
  }
}
