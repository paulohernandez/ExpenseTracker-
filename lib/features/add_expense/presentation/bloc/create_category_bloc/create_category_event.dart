part of 'create_category_bloc.dart';

sealed class CreateCategoryEvent extends Equatable {
  const CreateCategoryEvent();

  @override
  List<Object?> get props => [];
}

class ChangeColorEvent extends CreateCategoryEvent {
  const ChangeColorEvent(this.color);

  final Color color;

  @override
  List<Object?> get props => [color];
}

class ChangeIconEvent extends CreateCategoryEvent {
  const ChangeIconEvent(this.icon);

  final IconData icon;

  @override
  List<Object?> get props => [icon];
}

class ChangeNameEvent extends CreateCategoryEvent {
  const ChangeNameEvent(this.name);

  final String name;

  @override
  List<Object?> get props => [name];
}

class CreateCategory extends CreateCategoryEvent {
  const CreateCategory(this.category);
  final Category category;

  @override
  List<Object?> get props => [category];
}

class ChangeCategoryDefaultValue extends CreateCategoryEvent{}

