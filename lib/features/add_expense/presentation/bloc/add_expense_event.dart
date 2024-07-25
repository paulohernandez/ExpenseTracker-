part of 'add_expense_bloc.dart';

sealed class AddExpenseEvent extends Equatable {
  const AddExpenseEvent();
  @override
  List<Object?> get props => [];
}

class ChangeColorEvent extends AddExpenseEvent {
  const ChangeColorEvent(this.color);

  final Color color;

  @override
  List<Object?> get props => [color];
}

class ChangeIconEvent extends AddExpenseEvent {
  const ChangeIconEvent(this.icon);

  final IconData icon;

  @override
  List<Object?> get props => [icon];
}

class ChangeNameEvent extends AddExpenseEvent {
  const ChangeNameEvent(this.name);

  final String name;

  @override
  List<Object?> get props => [name];
}

class CreateCategoryEvent extends AddExpenseEvent {
  const CreateCategoryEvent(this.category);
  final Category category;

  @override
  List<Object?> get props => [category];
}
