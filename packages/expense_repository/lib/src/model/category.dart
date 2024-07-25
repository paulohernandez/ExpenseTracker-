import '../entities/entities.dart';

class Category {
  const Category({
    required this.categoryId,
    required this.name,
    required this.totalExpense,
    required this.icon,
    required this.color,
  });

  static const emptyCategory = Category(
    categoryId: '',
    name: '',
    totalExpense: 0,
    icon: '',
    color: '',
  );

  CategoryEntity toEntity() {
    return CategoryEntity(
      categoryId: categoryId,
      name: name,
      totalExpense: totalExpense,
      icon: icon,
      color: color,
    );
  }

  static Category fromEntity(CategoryEntity entity) {
    return Category(
      categoryId: entity.categoryId,
      name: entity.name,
      totalExpense: entity.totalExpense,
      icon: entity.icon,
      color: entity.color,
    );
  }

  final String categoryId;
  final String name;
  final int totalExpense;
  final String icon;
  final String color;
}
