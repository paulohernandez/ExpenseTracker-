part of 'get_categories_bloc.dart';

sealed class GetCategoriesEvent extends Equatable {
  const GetCategoriesEvent();
  @override
  // TODO: implement props
  List<Object?> get props => [];
}

class GetCategories extends GetCategoriesEvent {}

class GetSingleCategory extends GetCategoriesEvent {
  const GetSingleCategory(this.category);
  
  final Category category;

  @override
  List<Object?> get props => [];
}

