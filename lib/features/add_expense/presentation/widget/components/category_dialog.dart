import 'dart:math';

import 'package:expense_tracker/features/add_expense/data/sources/add_expense_data_source.dart';
import 'package:expense_tracker/features/add_expense/presentation/widget/components/custom_text_form_field.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

class CategoryAlertDialog extends StatefulWidget {
  const CategoryAlertDialog({super.key});

  @override
  State<CategoryAlertDialog> createState() => _CategoryAlertDialogState();
}

class _CategoryAlertDialogState extends State<CategoryAlertDialog> {
  late bool isIconListVisible = false;
  late double radius = 10;
  late IconData selectedIcon = FontAwesomeIcons.f;
  @override
  Widget build(BuildContext context) {
    final icons = AddExpenseDataSource().icons;
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
            const CustomTextFormField(
              hintText: 'Name',
              readOnly: false,
            ),
            CustomTextFormField(
              onTap: () {
                setState(() {
                  isIconListVisible = !isIconListVisible;
                  radius = 0;
                });
              },
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
              visible: isIconListVisible,
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
                          setState(() {
                            selectedIcon = icons[index];
                          });
                        },
                        child: Container(
                          decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(12),
                            gradient: selectedIcon == icons[index]
                                ? LinearGradient(
                                    colors: [
                                      Theme.of(context).colorScheme.tertiary,
                                      Theme.of(context).colorScheme.secondary,
                                      Theme.of(context).colorScheme.primary,
                                    ],
                                    transform: const GradientRotation(pi / 4),
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
            const SizedBox(
              height: 20,
            ),
            const CustomTextFormField(
              hintText: 'Color',
              readOnly: true,
            ),
          ],
        ),
      ),
    );
  }
}

Future<dynamic> categoryDialog(BuildContext context) {
  return showDialog(
    context: context,
    builder: (ctx) {
      return const CategoryAlertDialog();
    },
  );
}
