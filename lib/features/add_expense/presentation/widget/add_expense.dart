import 'dart:developer';

import 'package:expense_repository/expense_repository.dart';
import 'package:expense_tracker/features/add_expense/presentation/bloc/create_category_bloc/create_category_bloc.dart';
import 'package:expense_tracker/features/add_expense/presentation/bloc/get_categories_bloc/get_categories_bloc.dart';
import 'package:expense_tracker/features/add_expense/presentation/widget/components/category_dialog.dart';
import 'package:expense_tracker/features/add_expense/presentation/widget/components/custom_text_form_field.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:intl/intl.dart';
import 'package:uuid/uuid.dart';

class AddExpense extends StatelessWidget {
  const AddExpense({super.key});

  @override
  Widget build(BuildContext context) {
    final dateController = TextEditingController();
    return GestureDetector(
      onTap: FocusScope.of(context).unfocus,
      child: Scaffold(
        backgroundColor: Theme.of(context).colorScheme.surface,
        appBar: AppBar(
          automaticallyImplyLeading: false,
          backgroundColor: Theme.of(context).colorScheme.surface,
          actions: <Widget>[
            IconButton(
              onPressed: () {
                Navigator.pop(context);
              },
              icon: FaIcon(
                FontAwesomeIcons.x,
                color: Theme.of(context).colorScheme.outline,
                size: 16,
              ),
            ),
          ],
        ),
        body: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 20),
          child: Column(
            children: [
              Text(
                'Add Expenses',
                style: TextStyle(
                  color: Theme.of(context).colorScheme.onSurface,
                  fontSize: 30,
                ),
              ),
              const SizedBox(
                height: 20,
              ),
              SizedBox(
                width: MediaQuery.of(context).size.width * .7,
                child: TextFormField(
                  decoration: InputDecoration(
                    filled: true,
                    fillColor: Colors.white,
                    prefixIcon: const Icon(
                      FontAwesomeIcons.dollarSign,
                      size: 15,
                      color: Colors.grey,
                    ),
                    border: OutlineInputBorder(
                      borderSide: BorderSide.none,
                      borderRadius: BorderRadius.circular(30),
                    ),
                  ),
                ),
              ),
              const SizedBox(
                height: 30,
              ),
              BlocBuilder<GetCategoriesBloc, GetCategoriesState>(
                builder: (context, state) {
                  String name = 'Category';
                  Color color = Colors.white;
                  IconData icon = FontAwesomeIcons.solidRectangleList;

                  if (state is GetCategoriesInitial) {
                    context.read<GetCategoriesBloc>().add(GetCategories());
                  }
                  if (state is ChangeCategoryState) {
                    name = state.category.name;
                  }
                  return Column(
                    children: [
                      CustomTextFormField(
                        onTap: () async {
                          context
                              .read<CreateCategoryBloc>()
                              .add(ChangeCategoryDefaultValue());

                          final result = await categoryDialog(context);

                          if (result == true) {
                            await Future.delayed(
                                const Duration(milliseconds: 1), () {
                              context
                                  .read<GetCategoriesBloc>()
                                  .add(GetCategories());
                            });
                          }
                        },
                        selectedColor: color,
                        bottomMargin: 0,
                        borderRadius: 0,
                        readOnly: true,
                        prefixIcon: icon,
                        hintText: name,
                        suffixIcon: const IconButton(
                          onPressed: null,
                          icon: Icon(
                            FontAwesomeIcons.plus,
                            size: 15,
                            color: Colors.grey,
                          ),
                        ),
                      ),
                      if (state is GetCategoriesLoading)
                        const CircularProgressIndicator(),
                      ...[
                        if (state is GetCategoriesSuccess &&
                            state.categories.isNotEmpty)
                          Container(
                            margin: const EdgeInsets.only(bottom: 20),
                            padding: const EdgeInsets.all(8),
                            width: MediaQuery.of(context).size.width - 15,
                            height: MediaQuery.of(context).size.width / 2,
                            decoration: const BoxDecoration(
                              color: Colors.white,
                              borderRadius: BorderRadius.vertical(
                                bottom: Radius.circular(12),
                              ),
                            ),
                            child: ListView.builder(
                              itemCount: state.categories.length,
                              itemBuilder: (context, index) {
                                return GestureDetector(
                                  onTap: () {
                                    context.read<GetCategoriesBloc>().add(
                                          GetSingleCategory(
                                            state.categories[index],
                                          ),
                                        );
                                  },
                                  child: Card(
                                    child: ListTile(
                                      leading: FaIcon(
                                        IconData(
                                          state.categories[index].icon,
                                          fontFamily: 'MaterialIcons',
                                        ),
                                        color: Colors.white,
                                      ),
                                      title: Text(
                                        state.categories[index].name,
                                        style: const TextStyle(
                                            color: Colors.white),
                                      ),
                                      tileColor:
                                          Color(state.categories[index].color),
                                      shape: RoundedRectangleBorder(
                                        borderRadius: BorderRadius.circular(8),
                                      ),
                                    ),
                                  ),
                                );
                              },
                            ),
                          )
                        else
                          const SizedBox(),
                      ],
                    ],
                  );
                },
              ),
              CustomTextFormField(
                onTap: () async {
                  final newDate = await showDatePicker(
                    context: context,
                    initialDate: DateTime.now(),
                    firstDate: DateTime.now(),
                    lastDate: DateTime.now().add(const Duration(days: 365)),
                  );

                  if (newDate != null) {
                    dateController.text =
                        DateFormat('dd/MM/yyyy').format(newDate);
                  }
                },
                readOnly: true,
                prefixIcon: FontAwesomeIcons.calendar,
                hintText: 'Date',
                textController: dateController,
              ),
              const Spacer(),
              BlocBuilder<CreateCategoryBloc, CreateCategoryState>(
                builder: (context, state) {
                  return Column(
                    children: [
                      Container(
                        width: double.infinity,
                        height: kToolbarHeight,
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(12),
                          color: Colors.black,
                        ),
                        child: TextButton(
                          style: TextButton.styleFrom(
                            splashFactory: NoSplash.splashFactory,
                          ),
                          onPressed: () {
                            context.read<CreateCategoryBloc>().add(
                                tappedButtonGastosPaMore(Expense.expenseEmpty));

                            // Expense expense = Expense.expenseEmpty;
                            // expense.id = const Uuid().v1();
                            // expense.total = 123;
                            // expense.date =
                            //     DateFormat('dd/MM/yyyy').format(DateTime.now());
                            // print(expense.category);
                            // context
                            //     .read<CreateCategoryBloc>()
                            //     .add(tappedButtonGastosPaMore(expense));
                          },
                          child: const Text(
                            'Gastos pa more!',
                            style: TextStyle(
                              color: Colors.white,
                              fontSize: 22,
                            ),
                          ),
                        ),
                      ),
                      const SizedBox(
                        height: 20,
                      ),
                    ],
                  );
                },
              ),
            ],
          ),
        ),
      ),
    );
  }
}
