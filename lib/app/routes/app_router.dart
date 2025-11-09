import 'package:expense_tracker/features/add_categories/bloc/add_categories_bloc.dart';
import 'package:expense_tracker/features/add_categories/view/add_categories.dart';
import 'package:expense_tracker/features/add_transaction/view/add_transaction_page.dart';
import 'package:expense_tracker/features/categories/bloc/categories_bloc.dart';
import 'package:expense_tracker/features/categories/bloc/categories_event.dart';
import 'package:expense_tracker/features/categories/view/categories_page.dart';
import 'package:expense_tracker/features/dashboard/view/dashboard_page.dart';
import 'package:expense_tracker/features/home/bloc/home_bloc.dart';
import 'package:expense_tracker/features/home/view/home_page.dart';
import 'package:expense_tracker/features/login/view/login_page.dart';
import 'package:expense_tracker/features/transactions/view/transaction_page.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:go_router/go_router.dart';

class AppRouter {
  static final String loginPage = '/login';
  static final String dashboardPage = '/dashboard';
  static final String transactionPage = '/transaction';
  static final String addTransactionPage = '/addTransaction';
  static final String categoriesPage = "/categoriesPage";
  static const String addCategoriesPage = "/addCategoriesPage";
  static const String homePage = "/homePage";

  static final GoRouter router = GoRouter(
    initialLocation: loginPage,
    routes: [
      GoRoute(
        path: loginPage,
        name: loginPage,
        builder: (context, state) => const LoginPage(),
      ),
      GoRoute(
        path: homePage,
        name: homePage,
        builder: (context, state) => BlocProvider(
          create: (context) => HomeBloc(),
          child: const HomePage(),
        ),
      ),
      GoRoute(
        path: dashboardPage,
        name: dashboardPage,
        builder: (context, state) => const DashboardPage(),
      ),
      GoRoute(
        path: categoriesPage,
        name: categoriesPage,
        builder: (context, state) => BlocProvider(
          create: (context) => CategoriesBloc()..add(CategoriesInitial()),
          child: const CategoriesPage(),
        ),
      ),
      GoRoute(
        path: addCategoriesPage,
        name: addCategoriesPage,
        builder: (context, state) => BlocProvider(
          create: (context) => AddCategoriesBloc(),
          child: const AddCategories(),
        ),
      ),
      GoRoute(
        path: transactionPage,
        name: transactionPage,
        builder: (context, state) => const TransactionPage(),
      ),
      GoRoute(
        path: addTransactionPage,
        name: addTransactionPage,
        builder: (context, state) => const AddTransactionPage(),
      ),
    ],
  );
}
