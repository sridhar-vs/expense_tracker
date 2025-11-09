import 'package:expense_tracker/core/constraints/app_colors.dart';
import 'package:expense_tracker/features/add_transaction/bloc/add_transaction_bloc.dart';
import 'package:expense_tracker/features/add_transaction/bloc/add_transaction_event.dart';
import 'package:expense_tracker/features/add_transaction/bloc/add_transaction_state.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:intl/intl.dart';

class ExpenseForm extends StatefulWidget {
  final int type;
  const ExpenseForm({super.key, required this.type});

  @override
  State<ExpenseForm> createState() => _ExpenseFormState();
}

class _ExpenseFormState extends State<ExpenseForm> {
  late TextEditingController _amountController;
  late FocusNode _amountFocusNode;
  late TextEditingController _dateController;
  late FocusNode _dateFocusNode;
  late TextEditingController _descriptionController;
  late FocusNode _descriptionFocusNode;

  @override
  void initState() {
    _amountController = TextEditingController();
    _amountFocusNode = FocusNode();
    _dateController = TextEditingController();
    _dateFocusNode = FocusNode();
    _descriptionController = TextEditingController();
    _descriptionFocusNode = FocusNode();

    _amountFocusNode.addListener(() {
      if (!_amountFocusNode.hasFocus) {
        context.read<AddTransactionBloc>().add(
          UpdateAmount(amount: double.tryParse(_amountController.text) ?? 0.0),
        );
      }
    });
    _dateFocusNode.addListener(() {
      if (!_dateFocusNode.hasFocus) {
        context.read<AddTransactionBloc>().add(
          UpdateDate(date: _dateController.text),
        );
      }
    });
    _descriptionFocusNode.addListener(() {
      if (!_descriptionFocusNode.hasFocus) {
        context.read<AddTransactionBloc>().add(
          UpdateDescription(description: _descriptionController.text),
        );
      }
    });

    super.initState();
  }

  @override
  void dispose() {
    _amountController.dispose();
    _amountFocusNode.dispose();
    _dateController.dispose();
    _dateFocusNode.dispose();
    _descriptionController.dispose();
    _descriptionFocusNode.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<AddTransactionBloc, AddTransactionState>(
      builder: (context, state) {
        return Column(
          spacing: 24,
          children: [
            TextFormField(
              validator: (value) {
                if (value == null || value.isEmpty) {
                  return "Enter Amount";
                } else if ((double.tryParse(value) ?? 0) <= 0) {
                  return "Enter Valid Amount";
                } else {
                  return null;
                }
              },
              focusNode: _amountFocusNode,
              controller: _amountController,
              keyboardType: TextInputType.number,
              decoration: const InputDecoration(hintText: "Amount"),
              style: TextStyle(
                fontSize: 16,
                fontWeight: FontWeight.w400,
                color: AppColors.white,
              ),
            ),
            TextFormField(
              validator: (value) {
                if (value == null || value.isEmpty) {
                  return "Select Date";
                } else {
                  return null;
                }
              },
              onTap: () async {
                final DateTime? date = await showDatePicker(
                  context: context,
                  firstDate: DateTime(2025),
                  lastDate: DateTime.now(),
                );
                if (date != null) {
                  setState(() {
                    _dateController.text = DateFormat(
                      'dd/MM/yyyy',
                    ).format(date);
                  });
                }
              },
              focusNode: _dateFocusNode,
              controller: _dateController,
              readOnly: true,
              decoration: const InputDecoration(hintText: "Date"),
              style: TextStyle(
                fontSize: 16,
                fontWeight: FontWeight.w400,
                color: AppColors.white,
              ),
            ),
            SizedBox(
              width: double.maxFinite,
              child: DropdownButtonFormField(
                validator: (value) {
                  if (value == null || value == 0) {
                    return "Select Category";
                  } else {
                    return null;
                  }
                },
                style: TextStyle(
                  fontSize: 16,
                  fontWeight: FontWeight.w500,
                  color: AppColors.white,
                ),
                hint: Text(
                  "Category",
                  style: TextStyle(
                    fontSize: 16,
                    fontWeight: FontWeight.w500,
                    color: AppColors.white,
                  ),
                ),
                initialValue: state.addTransactionModel.categoryId,
                items: [
                  for (var categories in state.categories)
                    if (categories.type == widget.type)
                      DropdownMenuItem(
                        value: categories.id,
                        child: Text(categories.name),
                      ),
                ],
                dropdownColor: AppColors.secondary,
                onChanged: (value) {
                  context.read<AddTransactionBloc>().add(
                    ChangeCategory(categoryId: value),
                  );
                },
              ),
            ),
            TextFormField(
              validator: (value) {
                if (value == null || value.isEmpty) {
                  return "Enter Description";
                } else {
                  return null;
                }
              },
              controller: _descriptionController,
              focusNode: _descriptionFocusNode,
              decoration: const InputDecoration(hintText: "Description"),
              style: TextStyle(
                fontSize: 16,
                fontWeight: FontWeight.w400,
                color: AppColors.white,
              ),
            ),
            Padding(
              padding: const EdgeInsets.only(top: 4),
              child: Align(
                alignment: Alignment.centerLeft,
                child: Text(
                  "Payment Method",
                  style: TextStyle(
                    fontSize: 18,
                    fontWeight: FontWeight.w700,
                    color: AppColors.white,
                  ),
                ),
              ),
            ),
            Align(
              alignment: Alignment.centerLeft,
              child: ToggleButtons(
                onPressed: (index) {
                  context.read<AddTransactionBloc>().add(
                    ChangePaymentType(paymentType: index + 1),
                  );
                },
                selectedColor: AppColors.buttonColor,
                fillColor: AppColors.secondary,
                borderRadius: BorderRadius.circular(8),
                borderColor: AppColors.secondary,
                selectedBorderColor: AppColors.secondary,
                color: AppColors.white,
                isSelected: [
                  state.addTransactionModel.paymentType == 1,
                  state.addTransactionModel.paymentType == 2,
                ],
                children: [
                  Padding(
                    padding: const EdgeInsets.symmetric(
                      horizontal: 16.0,
                      vertical: 10,
                    ),
                    child: Text(
                      "Cash",
                      style: TextStyle(
                        fontSize: 14,
                        fontWeight: FontWeight.w500,
                        color: AppColors.white,
                      ),
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.symmetric(
                      horizontal: 16.0,
                      vertical: 10,
                    ),
                    child: Text(
                      "Upi",
                      style: TextStyle(
                        fontSize: 14,
                        fontWeight: FontWeight.w500,
                        color: AppColors.white,
                      ),
                    ),
                  ),
                ],
              ),
            ),
          ],
        );
      },
    );
  }
}
