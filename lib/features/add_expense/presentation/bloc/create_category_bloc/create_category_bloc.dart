import 'dart:developer';

import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:expense_repository/expense_repository.dart';
import 'package:flutter/material.dart';

part 'create_category_event.dart';
part 'create_category_state.dart';

class CreateCategoryBloc
    extends Bloc<CreateCategoryEvent, CreateCategoryState> {
  CreateCategoryBloc(this.expenseRepository) : super(CreateCategoryInitial()) {
    on<ChangeNameEvent>((event, emit) {
      final color = state is CategoryValueState
          ? (state as CategoryValueState).color
          : Colors.white;
      final icon = state is CategoryValueState
          ? (state as CategoryValueState).icon
          : Icons.add;
      emit(
        CategoryValueState(
          name: event.name,
          icon: icon,
          color: color,
          isIconListVisible: false,
        ),
      );
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
          : Icons.add;
      emit(
        CategoryValueState(
          name: name,
          icon: icon,
          color: event.color,
          isIconListVisible: false,
        ),
      );
    });
    on<ChangeCategoryDefaultValue>((event, emit) async {
      emit(
        const CategoryValueState(
          name: '',
          color: Colors.white,
          isIconListVisible: false,
          icon: Icons.add,
        ),
      );
    });
    on<CreateCategory>((event, emit) async {
      emit(AddCategoryLoading());
      try {
        await expenseRepository.createCategory(event.category);
        await Future<void>.delayed(const Duration(seconds: 2));
        emit(AddCategorySuccess());
      } catch (e) {
        log('$e');
      }
    });

    on<tappedButtonGastosPaMore>((event, emit) async {
      await expenseRepository.readFeedBack();
      // await expenseRepository.createExpense(event.expense);
      // emit(AddCategorySuccess());
    });
  }
  final ExpenseRepository expenseRepository;
}
