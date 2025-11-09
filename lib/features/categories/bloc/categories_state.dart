import 'package:equatable/equatable.dart';
import 'package:expense_tracker/features/categories/model/categories_model.dart';

class CategoriesState extends Equatable {
  final List<CategoriesModel> categories;

  const CategoriesState({this.categories = const []});

  CategoriesState copyWith({List<CategoriesModel>? categories}) {
    return CategoriesState(categories: categories ?? this.categories);
  }

  @override
  List<Object?> get props => [categories];
}
