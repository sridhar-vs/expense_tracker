import 'dart:convert';

import 'package:expense_tracker/features/add_categories/bloc/add_categories_event.dart';
import 'package:expense_tracker/features/add_categories/bloc/add_categories_state.dart';
import 'package:expense_tracker/features/add_categories/data/add_categories_data.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:go_router/go_router.dart';

class AddCategoriesBloc extends Bloc<AddCategoriesEvent, AddCategoriesState> {
  AddCategoriesBloc() : super(const AddCategoriesState()) {
    AddCategoriesData addCategoriesData = AddCategoriesData();
    on<AddCategoriesEvent>((event, emit) {});

    on<ChangeCategoriesType>((event, emit) {
      final updatedModel = state.addCategoriesModel.copyWith(type: event.type);
      emit(state.copyWith(addCategoriesModel: updatedModel));
    });

    on<ChangeIcon>((event, emit) {
      IconData iconData = event.icon;
      final Map iconMap = iconDataToMap(iconData: iconData);
      final updatedModel = state.addCategoriesModel.copyWith(
        icon: jsonEncode(iconMap),
      );
      emit(state.copyWith(addCategoriesModel: updatedModel));
    });

    on<ChangeCategoriesName>((event, emit) {
      final updateModel = state.addCategoriesModel.copyWith(
        name: event.categoriesName,
      );
      emit(state.copyWith(addCategoriesModel: updateModel));
    });

    on<SaveCategories>((event, emit) async {
      await addCategoriesData.addCategory(state.addCategoriesModel);
      if (event.context.mounted) {
        GoRouter.of(event.context).pop(true);
      }
    });
  }

  Map<String, dynamic> iconDataToMap({required IconData iconData}) {
    return {
      'codePoint': iconData.codePoint,
      'fontFamily': iconData.fontFamily,
      'fontPackage': iconData.fontPackage,
      'matchTextDirection': iconData.matchTextDirection,
    };
  }
}
