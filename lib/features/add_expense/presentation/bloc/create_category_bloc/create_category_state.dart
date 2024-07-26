part of 'create_category_bloc.dart';

sealed class CreateCategoryState extends Equatable {
  const CreateCategoryState();
  @override
  List<Object> get props => [];
}

final class CreateCategoryInitial extends CreateCategoryState {
  @override
  List<Object> get props => [];
}

class AddCategorySuccess extends CreateCategoryState {}

class AddCategoryLoading extends CreateCategoryState {}

class AddCategoryFailed extends CreateCategoryState {}

class CategoryValueState extends CreateCategoryState {
  const CategoryValueState({
    required this.name,
    required this.color,
    required this.isIconListVisible,
    required this.icon,
  });
  final String name;
  final IconData icon;
  final Color color;
  final bool isIconListVisible;

  @override
  List<Object> get props => [name, color, icon ,isIconListVisible];
}
