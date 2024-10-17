import 'package:expense_repository/expense_repository.dart';

class Expense {
  Expense({
    required this.id,
    required this.total,
    required this.category,
    required this.date,
  });

  static final expenseEmpty = Expense(
    id: '',
    total: 0,
    category: [],
    date: '',
  );

  static Expense fromJson(Map<String, dynamic> json) {
    return Expense(
      id: json['id'],
      total: json['total'] ,
      category: json['category'],
      date: json['date'] ,
    );
  }

  Map<String, dynamic> toJson() => {
        'id': id,
        'total': total,
        'category':category.map((e)=>e.toEntity().toDocument()).toList(),
        'date': date,
      };

  String id;
  double total;
  List<Category> category;
  String date;
}
