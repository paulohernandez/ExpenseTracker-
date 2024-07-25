part of 'add_expense_bloc.dart';

abstract class AddExpenseState extends Equatable {
  const AddExpenseState();

  @override
  List<Object> get props => [];
}

class AddExpenseInitial extends AddExpenseState {
  @override
  List<Object> get props => [];
}

class AddCategorySuccess extends AddExpenseState {}

class AddCategoryLoading extends AddExpenseState {}

class AddCategoryFailed extends AddExpenseState {}

class CategoryValueState extends AddExpenseState {
  const CategoryValueState({
    required this.name,
    required this.icon,
    required this.color,
    required this.isIconListVisible,
  });
  final String name;
  final IconData icon;
  final Color color;
  final bool isIconListVisible;

  @override
  List<Object> get props => [name, icon, color,isIconListVisible];
}
