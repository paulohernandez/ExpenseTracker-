import 'dart:math';

import 'package:expense_repository/expense_repository.dart';
import 'package:expense_tracker/features/add_expense/data/sources/add_expense_data_source.dart';
import 'package:expense_tracker/features/add_expense/presentation/bloc/create_category_bloc/create_category_bloc.dart';
import 'package:expense_tracker/features/add_expense/presentation/widget/components/change_color.dart';
import 'package:expense_tracker/features/add_expense/presentation/widget/components/custom_text_form_field.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:uuid/uuid.dart';

TextEditingController nameController = TextEditingController();
Color color = Colors.white;
bool isCategoryIconListVisible = false;
double radius = 10;
IconData selectedIcon = Icons.add;
Category category = Category.emptyCategory;
Future<dynamic> categoryDialog(BuildContext context) async {
  return showDialog(
    context: context,
    builder: (ctx) {
      final icons = AddExpenseDataSource().icons;
      return BlocProvider.value(
        value: context.read<CreateCategoryBloc>(),
        child: BlocBuilder<CreateCategoryBloc, CreateCategoryState>(
          builder: (context, state) {
            if (state is AddCategorySuccess) {
              Navigator.pop(ctx , true);
            } else if (state is CategoryValueState) {
              nameController.text = state.name;
              color = state.color;
              isCategoryIconListVisible = state.isIconListVisible;
              selectedIcon = state.icon;
            }

            return AlertDialog(
              title: const Text(
                'Choose Category',
                textAlign: TextAlign.center,
              ),
              backgroundColor: Theme.of(context).colorScheme.surface,
              content: SizedBox(
                width: MediaQuery.of(context).size.width,
                child: Column(
                  mainAxisSize: MainAxisSize.min,
                  children: [
                    CustomTextFormField(
                      onTap: () {
                        context
                            .read<CreateCategoryBloc>()
                            .add(const ChangeNameEvent(''));
                      },
                      onChange: (value) {
                        context
                            .read<CreateCategoryBloc>()
                            .add(ChangeNameEvent(value));
                      },
                      textController: nameController,
                      hintText: 'Name',
                      readOnly: false,
                    ),
                    CustomTextFormField(
                      onTap: () {
                        context
                            .read<CreateCategoryBloc>()
                            .add(ChangeIconEvent(selectedIcon));
                      },
                      prefixIcon:
                          selectedIcon != Icons.add ? selectedIcon : null,
                      bottomMargin: 0,
                      borderRadius: radius,
                      hintText: 'Icon',
                      suffixIcon: const IconButton(
                        highlightColor: Colors.transparent,
                        onPressed: null,
                        icon: Icon(FontAwesomeIcons.chevronDown),
                      ),
                      readOnly: true,
                    ),
                    Visibility(
                      visible: isCategoryIconListVisible,
                      child: Container(
                        width: MediaQuery.of(context).size.width,
                        height: MediaQuery.of(context).size.width / 2,
                        decoration: const BoxDecoration(
                          color: Colors.white,
                          borderRadius: BorderRadius.vertical(
                            bottom: Radius.circular(12),
                          ),
                        ),
                        child: Padding(
                          padding: const EdgeInsets.all(10),
                          child: GridView.builder(
                            gridDelegate:
                                const SliverGridDelegateWithFixedCrossAxisCount(
                              crossAxisCount: 3,
                            ),
                            itemCount: icons.length,
                            itemBuilder: (context, index) {
                              return GestureDetector(
                                onTap: () {
                                  context
                                      .read<CreateCategoryBloc>()
                                      .add(ChangeIconEvent(icons[index]));
                                },
                                child: Container(
                                  decoration: BoxDecoration(
                                    borderRadius: BorderRadius.circular(
                                      12,
                                    ),
                                    gradient: selectedIcon == icons[index]
                                        ? LinearGradient(
                                            colors: [
                                              Theme.of(context)
                                                  .colorScheme
                                                  .tertiary,
                                              Theme.of(context)
                                                  .colorScheme
                                                  .secondary,
                                              Theme.of(context)
                                                  .colorScheme
                                                  .primary,
                                            ],
                                            transform: const GradientRotation(
                                              pi / 4,
                                            ),
                                          )
                                        : null,
                                    color: selectedIcon == icons[index]
                                        ? Colors.black
                                        : Colors.white,
                                  ),
                                  child: Icon(
                                    icons[index],
                                    size: 40,
                                    color: selectedIcon == icons[index]
                                        ? Colors.white
                                        : Colors.grey,
                                  ),
                                ),
                              );
                            },
                          ),
                        ),
                      ),
                    ),
                    const SizedBox(height: 20),
                    CustomTextFormField(
                      selectedColor: color,
                      hintText: '',
                      readOnly: true,
                      onTap: () {
                        changeColor(context);
                      },
                    ),
                    SizedBox(
                      width: double.infinity,
                      child: TextButton(
                        style: TextButton.styleFrom(
                          shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(
                              12,
                            ),
                          ),
                          backgroundColor: Colors.black,
                          splashFactory: NoSplash.splashFactory,
                        ),
                        onPressed: () {
                          category.categoryId = const Uuid().v1();
                          category.name = nameController.text;
                          category.icon = selectedIcon.codePoint;
                          category.color = color.value;
                          context.read<CreateCategoryBloc>().add(
                                CreateCategory(
                                  category,
                                ),
                              );
                        },
                        child: state is AddCategoryLoading
                            ? const CircularProgressIndicator()
                            : const Text(
                                'Save',
                                style: TextStyle(
                                  color: Colors.white,
                                  fontSize: 22,
                                ),
                              ),
                      ),
                    ),
                  ],
                ),
              ),
            );
          },
        ),
      );
    },
  );
}
