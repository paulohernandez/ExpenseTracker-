import 'package:expense_tracker/features/add_expense/presentation/bloc/add_expense_bloc.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_colorpicker/flutter_colorpicker.dart';

Future<void> changeColor(BuildContext context) {
  return showDialog<AlertDialog>(
    context: context,
    builder: (ctxChangeColor) {
      return BlocProvider.value(
        value: context.read<AddExpenseBloc>(),
        child: BlocBuilder<AddExpenseBloc, AddExpenseState>(
          builder: (context, state) {
            var color = Colors.white;
            if (state is CategoryValueState) {
              color = state.color;
            }
            return AlertDialog(
              content: Column(
                mainAxisSize: MainAxisSize.min,
                children: [
                  ColorPicker(
                    pickerColor: color,
                    onColorChanged: (color) {
                      context
                          .read<AddExpenseBloc>()
                          .add(ChangeColorEvent(color));
                    },
                  ),
                  Container(
                    margin: const EdgeInsets.only(
                      top: 15,
                    ),
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
                        Navigator.pop(
                          ctxChangeColor,
                        );
                      },
                      child: const Text(
                        'OKAY',
                        style: TextStyle(
                          color: Colors.white,
                          fontSize: 22,
                        ),
                      ),
                    ),
                  ),
                ],
              ),
            );
          },
        ),
      );
    },
  );
}
