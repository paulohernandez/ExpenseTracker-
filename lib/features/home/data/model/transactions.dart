import 'package:flutter/material.dart';

class Transactions {
  const Transactions({
    required this.icon,
    required this.color,
    required this.name,
    required this.totalAmount,
    required this.date,
  });

  factory Transactions.fromJson(Map<String, dynamic> json) {
    return Transactions(
      icon: json['icon'] as IconData,
      color: json['color'] as Color,
      name: json['name'] as String,
      totalAmount: json['totalAmount'] as String,
      date: json['date'] as String,
    );
  }

  final IconData icon;
  final Color color;
  final String name;
  final String totalAmount;
  final String date;
}
