import 'package:expense_tracker/core/constraints/app_colors.dart';
import 'package:flutter/material.dart';

class CategoriesList extends StatelessWidget {
  final String labelName;
  final IconData icon;
  const CategoriesList({super.key, required this.labelName, required this.icon});

  @override
  Widget build(BuildContext context) {
    return Padding(
              padding: const EdgeInsets.fromLTRB(16,8,16,8.0),
              child: Row(
                spacing: 16,
                children: [
                Container(
                  height: 40,
                  width: 40,
                  padding: const EdgeInsets.all(8),
                  decoration: BoxDecoration(
                    color: AppColors.secondary,
                    borderRadius: BorderRadius.circular(8)
                  ),
                  child: Icon(icon, color: AppColors.white, size: 24,)),
                  Text(labelName, style: TextStyle(
                    fontSize: 16,
                    fontWeight: FontWeight.w500,
                    color: AppColors.white
                  ),)
              ],),
            );
  }
}