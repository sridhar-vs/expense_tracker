import 'package:equatable/equatable.dart';
import 'package:expense_tracker/features/add_categories/model/add_categories_model.dart';

class AddCategoriesState extends Equatable {
  final AddCategoriesModel addCategoriesModel;
  const AddCategoriesState({
    this.addCategoriesModel = const AddCategoriesModel(
      id: 0,
      name: '',
      type: 0,
      icon: '',
    ),
  });

  AddCategoriesState copyWith({AddCategoriesModel? addCategoriesModel}) {
    return AddCategoriesState(
      addCategoriesModel: addCategoriesModel ?? this.addCategoriesModel,
    );
  }

  @override
  List<Object?> get props => [addCategoriesModel];
}
