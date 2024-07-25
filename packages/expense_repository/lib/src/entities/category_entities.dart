class CategoryEntity {
  CategoryEntity({
    required this.categoryId,
    required this.name,
    required this.totalExpense,
    required this.icon,
    required this.color,
  });

  String categoryId;
  String name;
  int totalExpense;
  String icon;
  String color;

  Map<String, Object?> toDocument() {
    return {
      'categoryId': categoryId,
      'name': name,
      'totalExpense': totalExpense,
      'icon': icon,
      'color': color,
    };
  }

  static CategoryEntity fromDocument(Map<String, dynamic> doc) {
    return CategoryEntity(
      categoryId: doc['categoryId'] as String,
      name: doc['name'] as String,
      totalExpense: doc['totalExpense'] as int,
      icon: doc['icon'] as String,
      color: doc['color'] as String,
    );
  }
}
