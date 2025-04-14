import 'package:currency_text_input_formatter/currency_text_input_formatter.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class AddTransactionsDialog extends StatefulWidget {
  const AddTransactionsDialog({super.key});

  @override
  State<AddTransactionsDialog> createState() => _AddTransactionsDialogState();
}

class _AddTransactionsDialogState extends State<AddTransactionsDialog> {
  int? selectedSegment = 0;

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
          ElevatedButton(
            onPressed: () {
              // Handle add transaction logic
            },
            child: const Text('Add Transaction'),
          ),
        ],
      ),
    );
  }
}
