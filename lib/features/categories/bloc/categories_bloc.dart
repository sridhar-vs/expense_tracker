import 'package:expense_tracker/features/categories/bloc/categories_event.dart';
import 'package:expense_tracker/features/categories/bloc/categories_state.dart';
import 'package:expense_tracker/features/categories/data/categories_data.dart';
import 'package:expense_tracker/features/categories/model/categories_model.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class CategoriesBloc extends Bloc<CategoriesEvent, CategoriesState> {
  CategoriesBloc() : super(const CategoriesState()) {
    CategoriesData categoriesData = CategoriesData();
    on<CategoriesEvent>((event, emit) {});

    on<CategoriesInitial>((event, emit) async {
      final result = await categoriesData.getCategories();
      final List<CategoriesModel> categoriesList = [];
      for (var element in result) {
        categoriesList.add(CategoriesModel.fromJson(element));
      }
      emit(state.copyWith(categories: categoriesList));
    });
  }
}
