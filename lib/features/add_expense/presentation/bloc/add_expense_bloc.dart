import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:expense_repository/expense_repository.dart';
import 'package:flutter/material.dart';

part 'add_expense_event.dart';
part 'add_expense_state.dart';

class AddExpenseBloc extends Bloc<AddExpenseEvent, AddExpenseState> {
  AddExpenseBloc(this.expenseRepository) : super(AddExpenseInitial()) {
    on<ChangeNameEvent>((event, emit) {
      final color = state is CategoryValueState
          ? (state as CategoryValueState).color
          : Colors.white;
      final icon = state is CategoryValueState
          ? (state as CategoryValueState).icon
          : Icons.abc;
      emit(CategoryValueState(
        name: event.name,
        icon: icon,
        color: color,
        isIconListVisible: false,
      ));
    });
    on<ChangeIconEvent>((event, emit) {
      final name =
          state is CategoryValueState ? (state as CategoryValueState).name : '';
      final color = state is CategoryValueState
          ? (state as CategoryValueState).color
          : Colors.white;
      emit(
        CategoryValueState(
          name: name,
          icon: event.icon,
          color: color,
          isIconListVisible: true,
        ),
      );
    });
    on<ChangeColorEvent>((event, emit) async {
      final name =
          state is CategoryValueState ? (state as CategoryValueState).name : '';
      final icon = state is CategoryValueState
          ? (state as CategoryValueState).icon
          : Icons.abc;
      emit(
        CategoryValueState(
          name: name,
          icon: icon,
          color: event.color,
          isIconListVisible: false,
        ),
      );
    });
    on<CreateCategoryEvent>((event, emit) async {
      emit(AddCategoryLoading());
      // await expenseRepository.createCategory(event.category);
      await Future<void>.delayed(const Duration(seconds: 2));
      emit(
        const CategoryValueState(
          name: '',
          icon: Icons.add,
          color: Colors.white,
          isIconListVisible: false,
        ),
      );
    });
    on<AddExpenseEvent>((event, emit) {});
  }
  final ExpenseRepository expenseRepository;
}
