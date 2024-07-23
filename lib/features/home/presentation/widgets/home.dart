import 'package:expense_tracker/features/home/presentation/widgets/components/card_details.dart';
import 'package:expense_tracker/features/home/presentation/widgets/components/transactions_list.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

class HomePage extends StatelessWidget {
  const HomePage({super.key});

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 25),
        child: Column(
          children: [
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Row(
                  children: [
                    Stack(
                      alignment: Alignment.center,
                      children: [
                        Container(
                          width: 50,
                          height: 50,
                          decoration: BoxDecoration(
                            color: Colors.yellow[700],
                            shape: BoxShape.circle,
                          ),
                        ),
                        const FaIcon(
                          FontAwesomeIcons.solidUser,
                          color: Colors.yellow,
                        ),
                      ],
                    ),
                    const SizedBox(
                      width: 10,
                    ),
                    Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          'Welcome!',
                          style: TextStyle(
                            color: Theme.of(context).colorScheme.outline,
                            fontWeight: FontWeight.w600,
                            fontSize: 12,
                          ),
                        ),
                        Text(
                          'John Doe',
                          style: TextStyle(
                            color: Theme.of(context).colorScheme.onSurface,
                            fontWeight: FontWeight.bold,
                            fontSize: 18,
                          ),
                        ),
                      ],
                    ),
                  ],
                ),
                IconButton(
                  onPressed: () {},
                  icon: const FaIcon(
                    FontAwesomeIcons.gear,
                  ),
                ),
              ],
            ),
            const SizedBox(
              height: 20,
            ),
            const CardDetails(),
            const SizedBox(
              height: 20,
            ),
            const TransactionsLists(),
          ],
        ),
      ),
    );
  }
}
