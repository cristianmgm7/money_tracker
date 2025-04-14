import 'package:flutter/material.dart';

class TransactionsList extends StatelessWidget {
  const TransactionsList({super.key});

  @override
  Widget build(BuildContext context) {
    return Expanded(
      child: Container(
        height: 100,
        color: Colors.white,
        child: ListView(
          children: [
            ListTile(
              leading: const Icon(Icons.arrow_circle_up),
              title: const Text('Salary'),
              subtitle: const Text('Salary for the month of October'),
              trailing: const Text(
                '\$5000',
                style: TextStyle(color: Colors.green, fontSize: 15),
              ),
            ),
            ListTile(
              leading: const Icon(Icons.arrow_circle_down),
              title: const Text('Groceries'),
              subtitle: const Text('Weekly groceries'),
              trailing: const Text(
                '\$ -200',
                style: TextStyle(color: Colors.red, fontSize: 15),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
