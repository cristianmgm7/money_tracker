import 'package:flutter/material.dart';
import 'package:money_tracker/controller/transactions_provider.dart';
import 'package:money_tracker/model/transaction.dart';
import 'package:provider/provider.dart';

class TransactionsList extends StatelessWidget {
  const TransactionsList({super.key});

  @override
  Widget build(BuildContext context) {
    final provider = Provider.of<TransactionsProvider>(context);
    final transactions = provider.transactions;
    return Expanded(
      child: Container(
        height: 100,
        color: Colors.white,
        child: ListView.builder(
          itemCount: transactions.length,
          itemBuilder: (context, index) {
            final transaction = transactions[index];
            final type =
                transaction.type == TransactionType.income
                    ? 'Income'
                    : 'Expense';
            final value =
                transaction.type == TransactionType.income
                    ? '+ ${transaction.amount}'
                    : '- ${transaction.amount}';
            final color =
                transaction.type == TransactionType.income
                    ? Colors.green
                    : Colors.red;

            return ListTile(
              title: Text(transaction.description),
              subtitle: Text(type),
              trailing: Text(value, style: TextStyle(color: color)),
              leading: Icon(
                transaction.type == TransactionType.income
                    ? Icons.arrow_circle_up
                    : Icons.arrow_circle_down,
                color: color,
              ),
            );
          },
        ),
      ),
    );
  }
}
