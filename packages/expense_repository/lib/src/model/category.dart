import '../entities/entities.dart';

class Category {
  Category({
    required this.categoryId,
    required this.name,
    required this.totalExpense,
    required this.icon,
    required this.color,
  });

  static final emptyCategory = Category(
    categoryId: '',
    name: '',
    totalExpense: 0,
    icon: 0,
    color: 0,
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

  String categoryId;
  String name;
  int totalExpense;
  int icon;
  int color;
}
