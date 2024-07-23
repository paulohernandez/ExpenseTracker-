import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class IncomeExpenseDetails extends StatelessWidget {
  const IncomeExpenseDetails({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        _buildDetailRow(
          icon: CupertinoIcons.arrow_down,
          color:Colors.green,
          label: 'Income',
          amount: 250000,
        ),
        _buildDetailRow(
          icon: CupertinoIcons.arrow_up,
          color:Colors.red,
          label: 'Expenses',
          amount: 250000,
        ),
      ],
    );
  }

  Widget _buildDetailRow({
    required IconData icon,
    required Color color,
    required String label,
    required int amount,
  }) {
    return Row(
      children: [
        Container(
          width: 25,
          height: 25,
          decoration: const BoxDecoration(
            color: Colors.white38,
            shape: BoxShape.circle,
          ),
          child: Center(
            child: Icon(
              icon,
              size: 12,
              color: color,
            ),
          ),
        ),
        const SizedBox(
          width: 10,
        ),
        Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              label,
              style: const TextStyle(
                color: Colors.white,
                fontSize: 15,
                fontWeight: FontWeight.w300,
              ),
            ),
            Text(
              '$amount',
              style: const TextStyle(
                color: Colors.white,
                fontSize: 18,
                fontWeight: FontWeight.w500,
              ),
            ),
          ],
        ),
      ],
    );
  }
}
