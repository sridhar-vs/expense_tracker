import 'dart:convert';

import 'package:flutter/material.dart';

class TransactionModel {
  final String categoriesName;
  final int paymentType;
  final double amount;
  final IconData iconData;
  final int transactionType;
  final String description;
  final String date;

  TransactionModel({
    required this.categoriesName,
    required this.amount,
    required this.iconData,
    required this.paymentType,
    required this.transactionType,
    required this.description,
    required this.date,
  });

  factory TransactionModel.fromJson(Map<String, dynamic> json) {
    Map iconData = jsonDecode(json['icon']);
    return TransactionModel(
      categoriesName: json['categoriesName'],
      amount: json['amount'],
      iconData: IconData(
        iconData['codePoint'],
        fontFamily: iconData['fontFamily'],
        fontPackage: iconData['fontPackage'],
        matchTextDirection: iconData['matchTextDirection'] ?? false,
      ),
      paymentType: json['payment_type'],
      transactionType: json['type'],
      description: json['description'],
      date: json['date'],
    );
  }
}
