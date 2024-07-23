import 'package:expense_tracker/features/home/data/model/transactions.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

List<Transactions> getTransactions() {
  final transactionsDummyData = <Map<String, dynamic>>[
    {
      'icon': FontAwesomeIcons.burger,
      'color': Colors.yellow[700],
      'name': 'Food',
      'totalAmount': r'-$45.00',
      'date': 'Today',
    },
    {
      'icon': FontAwesomeIcons.car,
      'color': Colors.blue[700],
      'name': 'Transport',
      'totalAmount': r'-$30.00',
      'date': 'Yesterday',
    },
    {
      'icon': FontAwesomeIcons.bagShopping,
      'color': Colors.green[700],
      'name': 'Shopping',
      'totalAmount': r'-$120.00',
      'date': '2 days ago',
    },
    {
      'icon': FontAwesomeIcons.house,
      'color': Colors.orange[700],
      'name': 'Rent',
      'totalAmount': r'-$500.00',
      'date': '1 week ago',
    },
    {
      'icon': FontAwesomeIcons.lightbulb,
      'color': Colors.purple[700],
      'name': 'Utilities',
      'totalAmount': r'-$60.00',
      'date': '3 days ago',
    },
  ];
  return transactionsDummyData.map(Transactions.fromJson).toList();
}
