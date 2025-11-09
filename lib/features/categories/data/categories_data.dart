import 'package:expense_tracker/core/database/database_helper.dart';

class CategoriesData {
  Future<List<Map<String, Object?>>> getCategories() async {
    final db = DatabaseHelper.instance;

    final database = await db.database;

    final res = await database.rawQuery(
      'select id,type,name,icon from categories',
    );

    return res;
  }
}
