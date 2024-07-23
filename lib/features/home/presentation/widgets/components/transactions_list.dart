import 'package:expense_tracker/features/home/data/model/transactions.dart';
import 'package:expense_tracker/features/home/data/transactions_dummy_data.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

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
          height: MediaQuery.of(context).size.height / 2.4,
          child: ListView.builder(
            itemCount: transactions.length,
            itemBuilder: (context, index) {
              return _TransactionDetails(
                items: transactions[index],
              );
            },
          ),
        ),
      ],
    );
  }
}

class _TransactionDetails extends StatelessWidget {
  const _TransactionDetails({
    required this.items,
  });

  final Transactions items;

  @override
  Widget build(BuildContext context) {
    return Container(
      height: MediaQuery.of(context).size.width / 4.5,
      margin: const EdgeInsets.only(top: 20),
      padding: const EdgeInsets.symmetric(horizontal: 15),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(15),
      ),
      child: Row(
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
                      color: items.color,
                      shape: BoxShape.circle,
                    ),
                  ),
                  FaIcon(
                    items.icon,
                    color: Colors.white,
                  ),
                ],
              ),
              const SizedBox(
                width: 10,
              ),
              Text(
                items.name,
                style: TextStyle(
                  color: Theme.of(context).colorScheme.onSurface,
                  fontWeight: FontWeight.w500,
                  fontSize: 17,
                ),
              ),
            ],
          ),
          Column(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.end,
            children: [
              Text(
                items.totalAmount,
                style: TextStyle(
                  color: Theme.of(context).colorScheme.onSurface,
                  fontWeight: FontWeight.w400,
                  fontSize: 16,
                ),
              ),
              Text(
                items.date,
                style: TextStyle(
                  color: Theme.of(context).colorScheme.outline,
                  fontWeight: FontWeight.w400,
                  fontSize: 15,
                ),
              ),
            ],
          ),
        ],
      ),
    );
  }
}
