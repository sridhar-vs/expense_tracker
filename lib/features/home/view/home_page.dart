import 'package:expense_tracker/core/constraints/app_colors.dart';
import 'package:expense_tracker/features/home/bloc/home_bloc.dart';
import 'package:expense_tracker/features/home/bloc/home_state.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class HomePage extends StatelessWidget {
  const HomePage({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocConsumer<HomeBloc, HomeState>(
      listener: (context, state) {},
      builder: (context, state) {
        return Scaffold(
          backgroundColor: AppColors.primaryColor,
          body: state.pages[state.currentIndex],
          bottomNavigationBar: BottomNavigationBar(
            currentIndex: state.currentIndex,
            onTap: (index) {
              context.read<HomeBloc>().add(ChangePageIndex(index));
            },
            items: [
              BottomNavigationBarItem(
                backgroundColor: AppColors.secondary,
                icon: const Icon(Icons.home),
                label: 'DashBoard',
              ),
              BottomNavigationBarItem(
                backgroundColor: AppColors.secondary,
                icon: const Icon(Icons.add),
                label: 'Add',
              ),
              BottomNavigationBarItem(
                backgroundColor: AppColors.secondary,
                icon: const Icon(Icons.history),
                label: 'History',
              ),
              BottomNavigationBarItem(
                backgroundColor: AppColors.secondary,
                icon: const Icon(Icons.format_line_spacing_rounded),
                label: 'Categories',
              ),
            ],
          ),
        );
      },
    );
  }
}
