import 'package:flutter/material.dart';

sealed class AddCategoriesEvent {}

final class ChangeCategoriesType extends AddCategoriesEvent {
  final int type;
  ChangeCategoriesType({required this.type});
}

final class ChangeCategoriesName extends AddCategoriesEvent {
  final String categoriesName;
  ChangeCategoriesName({required this.categoriesName});
}

final class ChangeIcon extends AddCategoriesEvent {
  final IconData icon;
  ChangeIcon({required this.icon});
}

final class SaveCategories extends AddCategoriesEvent {
  final BuildContext context;
  SaveCategories({required this.context});
}
