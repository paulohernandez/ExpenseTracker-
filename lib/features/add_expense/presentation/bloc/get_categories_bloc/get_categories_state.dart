part of 'get_categories_bloc.dart';

sealed class GetCategoriesState extends Equatable {
  const GetCategoriesState();
  @override
  List<Object> get props => [];
}

final class GetCategoriesInitial extends GetCategoriesState {}

class GetCategoriesLoading extends GetCategoriesState {}

class GetCategoriesFailed extends GetCategoriesState {}

class GetCategoriesSuccess extends GetCategoriesState {
  const GetCategoriesSuccess(this.categories);
  final List<Category> categories;

  @override
  List<Object> get props => [];
}
