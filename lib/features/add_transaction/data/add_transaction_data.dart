import 'package:expense_tracker/core/database/database_helper.dart';
import 'package:expense_tracker/features/add_transaction/model/add_transaction_model.dart';
import 'package:expense_tracker/features/categories/model/categories_model.dart';

class AddTransactionData {
  Future<List<CategoriesModel>> getTransactions() async {
    final dataBase = DatabaseHelper.instance;
    final db = await dataBase.database;

    final result = await db.rawQuery(
      'SELECT id, name, icon, type FROM categories',
    );

    List<CategoriesModel> categories = [];
    for (var element in result) {
      categories.add(CategoriesModel.fromJson(element));
    }

    return categories;
  }

  Future<void> insertTransaction({required AddTransactionModel data}) async {
    final dataBase = DatabaseHelper.instance;
    final db = await dataBase.database;

    await db.insert('transactions', {
      'amount': data.amount,
      'date': data.date,
      'description': data.description,
      'category_id': data.categoryId,
      'type': data.transactionType,
      'payment_type': data.paymentType,
    });
  }
}
