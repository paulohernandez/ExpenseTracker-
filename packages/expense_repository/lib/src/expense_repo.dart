import 'package:expense_repository/expense_repository.dart';

abstract class ExpenseRepository {
  Future<dynamic> createCategory(Category category);
  Future<List<Category>> getCategory();

  Future<dynamic>  createExpense(Expense expense);
  Future<dynamic>  readFeedBack();
}
