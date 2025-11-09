import 'package:expense_tracker/app/routes/app_router.dart';
import 'package:expense_tracker/core/constraints/app_colors.dart';
import 'package:expense_tracker/features/categories/bloc/categories_bloc.dart';
import 'package:expense_tracker/features/categories/bloc/categories_event.dart';
import 'package:expense_tracker/features/categories/bloc/categories_state.dart';
import 'package:expense_tracker/features/categories/widget/categories_list.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:go_router/go_router.dart';

class CategoriesPage extends StatelessWidget {
  const CategoriesPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.primaryColor,
      body: BlocConsumer<CategoriesBloc, CategoriesState>(
        listener: (context, state) {},
        builder: (context, state) {
          return SafeArea(
            child: Column(
              children: [
                Center(
                  child: Container(
                    padding: const EdgeInsets.symmetric(
                      vertical: 8,
                      horizontal: 16,
                    ),
                    child: Text(
                      "Categories",
                      style: TextStyle(
                        fontSize: 18,
                        fontWeight: FontWeight.w700,
                        color: AppColors.white,
                      ),
                    ),
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.fromLTRB(16, 16, 16, 8),
                  child: Align(
                    alignment: Alignment.centerLeft,
                    child: Text(
                      'Income',
                      style: TextStyle(
                        fontSize: 18,
                        fontWeight: FontWeight.w700,
                        color: AppColors.white,
                      ),
                    ),
                  ),
                ),
                for (var category in state.categories.where(
                  (element) => element.type == 1,
                ))
                  CategoriesList(
                    icon: category.iconData,
                    labelName: category.name,
                  ),
                Padding(
                  padding: const EdgeInsets.fromLTRB(16, 16, 16, 8),
                  child: Align(
                    alignment: Alignment.centerLeft,
                    child: Text(
                      'Expense',
                      style: TextStyle(
                        fontSize: 18,
                        fontWeight: FontWeight.w700,
                        color: AppColors.white,
                      ),
                    ),
                  ),
                ),
                for (var category in state.categories.where(
                  (element) => element.type == 2,
                ))
                  CategoriesList(
                    icon: category.iconData,
                    labelName: category.name,
                  ),
              ],
            ),
          );
        },
      ),
      floatingActionButton: IconButton.filled(
        onPressed: () async {
          final result = await context.pushNamed(AppRouter.addCategoriesPage);
          if (result == true && context.mounted) {
            context.read<CategoriesBloc>().add(CategoriesInitial());
          }
        },
        icon: const Icon(Icons.add),
      ),
    );
  }
}
