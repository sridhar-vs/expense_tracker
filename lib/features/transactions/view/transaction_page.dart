import 'package:expense_tracker/core/constraints/app_colors.dart';
import 'package:expense_tracker/features/dashboard/widget/dashboard_list.dart';
import 'package:expense_tracker/features/transactions/bloc/transactions_bloc.dart';
import 'package:expense_tracker/features/transactions/bloc/transactions_event.dart';
import 'package:expense_tracker/features/transactions/bloc/transactions_state.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:intl/intl.dart';

class TransactionPage extends StatelessWidget {
  const TransactionPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.primaryColor,
      body: SafeArea(
        child: BlocConsumer<TransactionsBloc, TransactionsState>(
          listener: (context, state) {},
          builder: (context, state) {
            return Column(
              children: [
                Center(
                  child: Padding(
                    padding: const EdgeInsets.fromLTRB(16, 16, 16, 8.0),
                    child: Text(
                      "Transaction Page",
                      style: TextStyle(
                        fontSize: 18,
                        fontWeight: FontWeight.w700,
                        color: AppColors.white,
                      ),
                    ),
                  ),
                ),
                if (state.isTodayLabelShow)
                  Align(
                    alignment: Alignment.centerLeft,
                    child: Padding(
                      padding: const EdgeInsets.fromLTRB(16.0, 16, 16, 8),
                      child: Text(
                        'Today',
                        style: TextStyle(
                          fontSize: 18,
                          fontWeight: FontWeight.w700,
                          color: AppColors.white,
                        ),
                      ),
                    ),
                  ),
                ListView(
                  shrinkWrap: true,
                  children: List.generate(state.transactions.length, (index) {
                    if (DateFormat("dd/MM/yyyy").format(DateTime.now()) ==
                        state.transactions[index].date) {
                      context.read<TransactionsBloc>().add(
                        LabelChangeEvent(
                          labelType: LabelType.today,
                          isShow: true,
                        ),
                      );
                      return DashboardList(
                        iconData: state.transactions[index].iconData,
                        categoriesName:
                            state.transactions[index].categoriesName,
                        paymentType: state.transactions[index].paymentType,
                        amount: state.transactions[index].amount,
                        transactionType:
                            state.transactions[index].transactionType,
                        description: state.transactions[index].description,
                      );
                    }
                    return const SizedBox.shrink();
                  }),
                ),
                if (state.isYesterdayLabelShow)
                  Align(
                    alignment: Alignment.centerLeft,
                    child: Padding(
                      padding: const EdgeInsets.fromLTRB(16.0, 16, 16, 8),
                      child: Text(
                        'Yesterday',
                        style: TextStyle(
                          fontSize: 18,
                          fontWeight: FontWeight.w700,
                          color: AppColors.white,
                        ),
                      ),
                    ),
                  ),
                ListView(
                  shrinkWrap: true,
                  children: List.generate(state.transactions.length, (index) {
                    if (DateFormat("dd/MM/yyyy").format(
                          DateTime.now().subtract(const Duration(days: 1)),
                        ) ==
                        state.transactions[index].date) {
                      context.read<TransactionsBloc>().add(
                        LabelChangeEvent(
                          labelType: LabelType.yesterday,
                          isShow: true,
                        ),
                      );
                      return DashboardList(
                        iconData: state.transactions[index].iconData,
                        categoriesName:
                            state.transactions[index].categoriesName,
                        paymentType: state.transactions[index].paymentType,
                        amount: state.transactions[index].amount,
                        transactionType:
                            state.transactions[index].transactionType,
                        description: state.transactions[index].description,
                      );
                    }
                    return const SizedBox.shrink();
                  }),
                ),
                if (state.isOlderLabelShow)
                  Align(
                    alignment: Alignment.centerLeft,
                    child: Padding(
                      padding: const EdgeInsets.fromLTRB(16.0, 16, 16, 8),
                      child: Text(
                        'Older',
                        style: TextStyle(
                          fontSize: 18,
                          fontWeight: FontWeight.w700,
                          color: AppColors.white,
                        ),
                      ),
                    ),
                  ),
                ListView(
                  shrinkWrap: true,
                  children: List.generate(state.transactions.length, (index) {
                    if ((DateFormat("dd/MM/yyyy").format(
                              DateTime.now().subtract(const Duration(days: 1)),
                            ) !=
                            state.transactions[index].date &&
                        (DateFormat("dd/MM/yyyy").format(DateTime.now()) !=
                            state.transactions[index].date))) {
                      context.read<TransactionsBloc>().add(
                        LabelChangeEvent(
                          labelType: LabelType.older,
                          isShow: true,
                        ),
                      );
                      return DashboardList(
                        iconData: state.transactions[index].iconData,
                        categoriesName:
                            state.transactions[index].categoriesName,
                        paymentType: state.transactions[index].paymentType,
                        amount: state.transactions[index].amount,
                        transactionType:
                            state.transactions[index].transactionType,
                        description: state.transactions[index].description,
                      );
                    }
                    return const SizedBox.shrink();
                  }),
                ),
              ],
            );
          },
        ),
      ),
    );
  }
}
