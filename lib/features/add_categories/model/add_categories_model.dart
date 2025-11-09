class AddCategoriesModel {
  final int id;
  final String name;
  final String icon;
  final int type;

  const AddCategoriesModel({
    required this.id,
    required this.name,
    required this.icon,
    required this.type,
  });

  AddCategoriesModel copyWith({
    int? id,
    String? name,
    String? icon,
    int? type,
  }) {
    return AddCategoriesModel(
      id: id ?? this.id,
      name: name ?? this.name,
      icon: icon ?? this.icon,
      type: type ?? this.type,
    );
  }

  factory AddCategoriesModel.fromMap(Map<String, dynamic> map) {
    return AddCategoriesModel(
      id: map['id'] as int,
      name: map['name'] as String,
      icon: (map['icon']),
      type: map['type'] as int,
    );
  }
}
