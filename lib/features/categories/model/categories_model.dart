import 'dart:convert';

import 'package:flutter/material.dart';

class CategoriesModel {
  final int id;
  final int type;
  final String name;
  final IconData iconData;

  CategoriesModel({
    required this.id,
    required this.type,
    required this.name,
    required this.iconData,
  });

  factory CategoriesModel.fromJson(Map<String, dynamic> json) {
    Map iconData = jsonDecode(json['icon']);
    return CategoriesModel(
      id: json['id'],
      type: json['type'],
      name: json['name'],
      iconData: IconData(
        iconData['codePoint'],
        fontFamily: iconData['fontFamily'],
        fontPackage: iconData['fontPackage'],
        matchTextDirection: iconData['matchTextDirection'] ?? false,
      ),
    );
  }
}
