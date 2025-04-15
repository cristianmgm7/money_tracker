import 'package:currency_text_input_formatter/currency_text_input_formatter.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:money_tracker/controller/transactions_provider.dart';
import 'package:money_tracker/model/transaction.dart';
import 'package:provider/provider.dart';

class AddTransactionsDialog extends StatefulWidget {
  const AddTransactionsDialog({super.key});

  @override
  State<AddTransactionsDialog> createState() => _AddTransactionsDialogState();
}

class _AddTransactionsDialogState extends State<AddTransactionsDialog> {
  int? selectedSegment = 0;
  TransactionType type = TransactionType.expense;

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 600,
      width: double.infinity,
      child: Column(
        children: [
          Container(
            height: 10,
            width: 50,
            margin: const EdgeInsets.only(top: 10),
            decoration: BoxDecoration(
              color: Colors.blueGrey,
              borderRadius: BorderRadius.circular(20),
            ),
          ),
          Padding(
            padding: const EdgeInsets.only(top: 20),
            child: const Text(
              'Add Transaction',
              style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
            ),
          ),
          const SizedBox(height: 20),
          CupertinoSlidingSegmentedControl(
            groupValue: selectedSegment,
            children: const {0: Text('Income'), 1: Text('Expense')},
            onValueChanged: (value) {
              setState(() {
                selectedSegment = value;
                type =
                    value == 0
                        ? TransactionType.income
                        : TransactionType.expense;
              });
            },
          ),
          Padding(
            padding: const EdgeInsets.all(12.0),
            child: TextField(
              inputFormatters: [CurrencyTextInputFormatter.currency()],
              keyboardType: TextInputType.number,
              decoration: const InputDecoration(
                labelText: 'Amount',
                border: OutlineInputBorder(),
              ),
              autofocus: true,
            ),
          ),
          const SizedBox(height: 20),
          Padding(
            padding: const EdgeInsets.all(12.0),
            child: TextField(
              maxLines: 1,
              decoration: const InputDecoration(
                labelText: 'Description',
                border: OutlineInputBorder(),
              ),
            ),
          ),
          ElevatedButton(
            onPressed: () {
              // Handle add transaction logic
              Provider.of<TransactionsProvider>(
                context,
                listen: false,
              ).addTransaction(
                Transaction(
                  amount: 0.0,
                  description: '',
                  type:
                      selectedSegment == 0
                          ? TransactionType.income
                          : TransactionType.expense,
                ),
              );
            },
            style: ElevatedButton.styleFrom(
              backgroundColor: Colors.teal,
              padding: const EdgeInsets.symmetric(horizontal: 50, vertical: 15),
            ),
            child: const Text(
              'Add Transaction',
              style: TextStyle(color: Colors.white),
            ),
          ),
        ],
      ),
    );
  }
}
