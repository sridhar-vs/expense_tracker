import 'package:equatable/equatable.dart';
import 'package:expense_tracker/features/add_transaction/bloc/add_transaction_bloc.dart';
import 'package:expense_tracker/features/add_transaction/bloc/add_transaction_event.dart';
import 'package:expense_tracker/features/add_transaction/view/add_transaction_page.dart';
import 'package:expense_tracker/features/categories/bloc/categories_bloc.dart';
import 'package:expense_tracker/features/categories/bloc/categories_event.dart';
import 'package:expense_tracker/features/categories/view/categories_page.dart';
import 'package:expense_tracker/features/dashboard/bloc/dashboard_bloc.dart';
import 'package:expense_tracker/features/dashboard/bloc/dashboard_event.dart';
import 'package:expense_tracker/features/dashboard/view/dashboard_page.dart';
import 'package:expense_tracker/features/transactions/bloc/transactions_bloc.dart';
import 'package:expense_tracker/features/transactions/bloc/transactions_event.dart';
import 'package:expense_tracker/features/transactions/view/transaction_page.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class HomeState extends Equatable {
  final List<Widget> pages = [
    BlocProvider(
      create: (context) => DashboardBloc()..add(DashboardInitialEvent()),
      child: const DashboardPage(),
    ),
    BlocProvider(
      create: (context) => AddTransactionBloc()..add(AddTransactionInital()),
      child: const AddTransactionPage(),
    ),
    BlocProvider(
      create: (context) => TransactionsBloc()..add(TransactionInitalEvent()),
      child: const TransactionPage(),
    ),
    BlocProvider(
      create: (context) => CategoriesBloc()..add(CategoriesInitial()),
      child: const CategoriesPage(),
    ),
  ];

  final int currentIndex;

  HomeState({this.currentIndex = 0});

  HomeState copyWith({int? currentIndex}) {
    return HomeState(currentIndex: currentIndex ?? this.currentIndex);
  }

  @override
  List<Object?> get props => [pages, currentIndex];
}
