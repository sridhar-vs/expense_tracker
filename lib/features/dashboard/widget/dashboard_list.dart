import 'package:expense_tracker/core/constraints/app_colors.dart';
import 'package:flutter/material.dart';

class DashboardList extends StatelessWidget {
  final IconData iconData;
  final String categoriesName;
  final int paymentType;
  final int transactionType;
  final double amount;
  final String description;
  const DashboardList({
    super.key,
    required this.iconData,
    required this.categoriesName,
    required this.paymentType,
    required this.amount,
    required this.transactionType,
    required this.description,
  });

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 8, horizontal: 16),
      child: SizedBox(
        width: double.maxFinite,
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Expanded(
              child: Row(
                spacing: 16,
                children: [
                  Container(
                    padding: const EdgeInsets.all(12),
                    decoration: BoxDecoration(
                      color: AppColors.secondary,
                      borderRadius: BorderRadius.circular(8),
                    ),
                    child: Icon(
                      iconData,
                      size: 24,
                      color: const Color(0xFFFFFFFF),
                    ),
                  ),
                  Expanded(
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          description,
                          maxLines: 1,
                          overflow: TextOverflow.ellipsis,
                          style: TextStyle(
                            fontSize: 16,
                            fontWeight: FontWeight.w500,
                            color: AppColors.white,
                          ),
                        ),
                        Text(
                          "$categoriesName - ${paymentType == 1 ? 'Cash' : 'Upi'}",
                          style: TextStyle(
                            fontSize: 14,
                            fontWeight: FontWeight.w400,
                            color: AppColors.inputHintTextColor,
                          ),
                        ),
                      ],
                    ),
                  ),
                ],
              ),
            ),
            Text(
              "${transactionType == 1 ? "+" : "-"} $amount",
              style: TextStyle(
                fontSize: 16,
                fontWeight: FontWeight.w400,
                color: AppColors.white,
              ),
            ),
          ],
        ),
      ),
    );
  }
}
