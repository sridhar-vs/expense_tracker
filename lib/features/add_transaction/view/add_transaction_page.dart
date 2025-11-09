import 'package:expense_tracker/core/constraints/app_colors.dart';
import 'package:expense_tracker/features/add_transaction/bloc/add_transaction_bloc.dart';
import 'package:expense_tracker/features/add_transaction/bloc/add_transaction_event.dart';
import 'package:expense_tracker/features/add_transaction/bloc/add_transaction_state.dart';
import 'package:expense_tracker/features/add_transaction/widget/expense_form.dart';
import 'package:expense_tracker/features/home/bloc/home_bloc.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class AddTransactionPage extends StatefulWidget {
  const AddTransactionPage({super.key});

  @override
  State<AddTransactionPage> createState() => _AddTransactionPageState();
}

class _AddTransactionPageState extends State<AddTransactionPage>
    with SingleTickerProviderStateMixin {
  late TabController _tabController;
  final GlobalKey<FormState> _globalKey = GlobalKey<FormState>();

  @override
  void initState() {
    super.initState();
    _tabController = TabController(length: 2, vsync: this);
  }

  @override
  void dispose() {
    _tabController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.primaryColor,
      body: BlocConsumer<AddTransactionBloc, AddTransactionState>(
        listener: (context, state) {
          if (state.isSave) {
            context.read<HomeBloc>().add(ChangePageIndex(2));
          }
        },
        builder: (context, state) {
          return SafeArea(
            child: Form(
              key: _globalKey,
              child: Column(
                children: [
                  Container(
                    padding: const EdgeInsets.fromLTRB(16, 16, 16, 8),
                    child: Stack(
                      children: [
                        Align(
                          alignment: Alignment.centerLeft,
                          child: InkWell(
                            onTap: () {},
                            child: Icon(Icons.close, color: AppColors.white),
                          ),
                        ),
                        Align(
                          alignment: Alignment.center,
                          child: Text(
                            'Add Transaction',
                            style: TextStyle(
                              fontSize: 18,
                              fontWeight: FontWeight.w700,
                              color: AppColors.white,
                            ),
                          ),
                        ),
                      ],
                    ),
                  ),
                  Container(
                    margin: const EdgeInsets.symmetric(
                      horizontal: 16,
                      vertical: 12,
                    ),
                    width: double.maxFinite,
                    decoration: BoxDecoration(
                      color: AppColors.secondary,
                      borderRadius: BorderRadius.circular(8),
                    ),
                    padding: const EdgeInsets.all(4),
                    child: TabBar(
                      indicatorSize: TabBarIndicatorSize.tab,
                      dividerColor: Colors.transparent,
                      indicator: BoxDecoration(
                        color: AppColors.primaryColor,
                        borderRadius: BorderRadius.circular(8),
                      ),
                      onTap: (value) {
                        context.read<AddTransactionBloc>().add(
                          ChangeTransactionType(
                            transactionType: value == 0 ? 2 : 1,
                          ),
                        );
                      },
                      controller: _tabController,
                      unselectedLabelStyle: TextStyle(
                        color: AppColors.inputHintTextColor,
                        fontSize: 14,
                        fontWeight: FontWeight.w500,
                      ),
                      labelStyle: TextStyle(
                        color: AppColors.white,
                        fontSize: 14,
                        fontWeight: FontWeight.w500,
                      ),
                      tabs: [
                        const Tab(text: 'Expense'),
                        const Tab(text: 'Income'),
                      ],
                    ),
                  ),
                  Expanded(
                    child: TabBarView(
                      controller: _tabController,
                      children: const [
                        SingleChildScrollView(
                          child: Padding(
                            padding: EdgeInsets.fromLTRB(16, 12, 16, 16),
                            child: ExpenseForm(type: 2),
                          ),
                        ),
                        SingleChildScrollView(
                          child: Padding(
                            padding: EdgeInsets.fromLTRB(16, 12, 16, 16),
                            child: ExpenseForm(type: 1),
                          ),
                        ),
                      ],
                    ),
                  ),
                  Container(
                    margin: const EdgeInsets.fromLTRB(16, 12, 16, 24),
                    width: double.maxFinite,
                    height: 48,
                    child: FilledButton(
                      onPressed: () {
                        if (_globalKey.currentState?.validate() ?? false) {
                          // 1️⃣ Unfocus all text fields first
                          FocusScope.of(context).unfocus();

                          // 2️⃣ Wait a short delay to ensure FocusNode listeners inside ExpenseForm run
                          Future.delayed(const Duration(milliseconds: 300), () {
                            // 3️⃣ Trigger save Bloc event
                            if (context.mounted) {
                              context.read<AddTransactionBloc>().add(
                                SaveTransaction(),
                              );
                            }
                          });
                        }
                      },
                      child: Text(
                        "Add Transaction",
                        style: TextStyle(
                          fontSize: 16,
                          fontWeight: FontWeight.w700,
                          color: AppColors.primaryColor,
                        ),
                      ),
                    ),
                  ),
                ],
              ),
            ),
          );
        },
      ),
    );
  }
}
