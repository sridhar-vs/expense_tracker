import 'package:expense_tracker/core/database/database_helper.dart';
import 'package:expense_tracker/features/add_categories/model/add_categories_model.dart';
import 'package:sqflite/sqflite.dart';

class AddCategoriesData {
  Future<void> addCategory(AddCategoriesModel addCategoriesModel) async {
    try {
      final dataBase = DatabaseHelper.instance;
      final db = await dataBase.database;

      // Ensure table exists

      await db.insert('categories', {
        'name': addCategoriesModel.name,
        'type': addCategoriesModel.type,
        'icon': addCategoriesModel.icon,
      }, conflictAlgorithm: ConflictAlgorithm.replace);
    } catch (e) {
      rethrow;
    }
  }
}
