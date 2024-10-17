import 'dart:developer';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:expense_repository/expense_repository.dart';

class FirebaseExpenseRepository implements ExpenseRepository {
  final categoriesCollection =
      FirebaseFirestore.instance.collection('categories');
  final expenseCollection = FirebaseFirestore.instance.collection('expense');
  final feedBackCollection = FirebaseFirestore.instance.collection('feedBack');
  @override
  Future<void> createCategory(Category category) async {
    try {
      await categoriesCollection
          .doc(category.categoryId)
          .set(category.toEntity().toDocument());
    } catch (e) {
      log(e.toString());
      rethrow;
    }
  }

  @override
  Future<List<Category>> getCategory() async {
    try {
      return categoriesCollection.get().then((value) => value.docs
          .map((e) => Category.fromEntity(
                CategoryEntity.fromDocument(e.data()),
              ))
          .toList());
    } catch (e) {
      log(e.toString());
      rethrow;
    }
  }

  @override
  Future<dynamic> createExpense(Expense expense) async {
    try {
      DocumentSnapshot expenseExists =
          await expenseCollection.doc(expense.id).get();
      if (expenseExists.exists) {
        return {'response': 'Expense Exits'};
      }
      await expenseCollection.doc(expense.id).set(expense.toJson());
    } catch (e) {
      log(e.toString());
      rethrow;
    }
  }

  @override
  Future readFeedBack() async {
    print('heree');
    await feedBackCollection.get().then((value) {
      for (var i in value.docs) {
        print('${i.id} => ${i.data()}');
      }
    });
  }
}
