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
  @override
  Widget build(BuildContext context) {
    return AlertDialog(
      title: const Text(
        'Choose Category',
        textAlign: TextAlign.center,
      ),
      backgroundColor: Theme.of(context).colorScheme.surface,
      content: Column(
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
              });
            },
            bottomMargin: 0,
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
