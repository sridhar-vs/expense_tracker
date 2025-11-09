import 'package:expense_tracker/core/constraints/app_colors.dart';
import 'package:expense_tracker/features/dashboard/bloc/dashboard_bloc.dart';
import 'package:expense_tracker/features/dashboard/bloc/dashboard_state.dart';
import 'package:expense_tracker/features/dashboard/widget/dashboard_list.dart';
import 'package:expense_tracker/features/dashboard/widget/dashboard_card.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class DashboardPage extends StatelessWidget {
  const DashboardPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.primaryColor,
      body: BlocConsumer<DashboardBloc, DashboardState>(
        listener: (context, state) {},
        builder: (context, state) {
          return SafeArea(
            child: ListView(
              children: [
                Padding(
                  padding: const EdgeInsetsGeometry.fromLTRB(16, 16, 16, 8),
                  child: Text(
                    'Overview',
                    textAlign: TextAlign.center,
                    style: TextStyle(
                      fontSize: 18,
                      fontWeight: FontWeight.w700,
                      color: AppColors.white,
                    ),
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.all(16),
                  child: Column(
                    spacing: 16,
                    children: [
                      Row(
                        spacing: 16,
                        children: [
                          Expanded(
                            child: DashboardCard(
                              labelName: "Total Expenses",
                              value: "₹${state.expense}",
                            ),
                          ),
                          Expanded(
                            child: DashboardCard(
                              labelName: "Net Savings",
                              value: "₹${state.income - state.expense}",
                            ),
                          ),
                        ],
                      ),
                      SizedBox(
                        width: double.maxFinite,
                        child: DashboardCard(
                          labelName: "Total Income",
                          value: "₹${state.income}",
                        ),
                      ),
                    ],
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.fromLTRB(16, 20, 16, 12),
                  child: Text(
                    "Recent Activity",
                    style: TextStyle(
                      fontSize: 22,
                      fontWeight: FontWeight.w700,
                      color: AppColors.white,
                    ),
                  ),
                ),
                ListView(
                  shrinkWrap: true,
                  children: List.generate(state.transactionList.length, (
                    index,
                  ) {
                    return DashboardList(
                      iconData: state.transactionList[index].iconData,
                      categoriesName:
                          state.transactionList[index].categoriesName,
                      paymentType: state.transactionList[index].paymentType,
                      amount: state.transactionList[index].amount,
                      transactionType:
                          state.transactionList[index].transactionType,
                      description: state.transactionList[index].description,
                    );
                  }),
                ),
              ],
            ),
          );
        },
      ),
    );
  }
}
