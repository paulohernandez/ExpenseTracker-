import 'package:expense_tracker/features/home/data/transactions_dummy_data.dart';
import 'package:expense_tracker/features/home/presentation/widgets/components/transaction_details.dart';
import 'package:flutter/material.dart';

class TransactionsLists extends StatelessWidget {
  const TransactionsLists({super.key});

  @override
  Widget build(BuildContext context) {
    final transactions = getTransactions();
    return Column(
      children: [
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Text(
              'Transactions',
              style: TextStyle(
                color: Theme.of(context).colorScheme.onSurface,
                fontWeight: FontWeight.bold,
                fontSize: 18,
              ),
            ),
            GestureDetector(
              onTap: () {},
              child: Text(
                'View All',
                style: TextStyle(
                  color: Theme.of(context).colorScheme.outline,
                  fontWeight: FontWeight.w400,
                  fontSize: 16,
                ),
              ),
            ),
          ],
        ),
        SizedBox(
          height: MediaQuery.of(context).size.height / 2.5,
          child: ListView.builder(
            itemCount: transactions.length,
            itemBuilder: (context, index) {
              return TransactionDetails(
                items: transactions[index],
              );
            },
          ),
        ),
      ],
    );
  }
}
