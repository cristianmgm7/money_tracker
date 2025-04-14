import 'package:flutter/material.dart';
import 'package:money_tracker/view/widgets/header_card.dart';

class HomeHeader extends StatelessWidget {
  const HomeHeader({super.key});

  @override
  Widget build(BuildContext context) {
    final textTheme = Theme.of(context).textTheme;
    return Container(
      height: 250,
      width: double.infinity,
      decoration: const BoxDecoration(
        color: Colors.teal,
        borderRadius: BorderRadius.only(
          bottomLeft: Radius.circular(20),
          bottomRight: Radius.circular(20),
        ),
      ),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Text(
            'Money Tracker',
            style: textTheme.bodySmall?.copyWith(
              fontSize: 30,
              fontWeight: FontWeight.bold,
              color: Colors.white,
            ),
          ),
          Text(
            'Balnace',
            style: textTheme.bodySmall?.copyWith(
              fontSize: 20,
              fontWeight: FontWeight.bold,
              color: Colors.white,
            ),
          ),
          Text(
            '\$0.00',
            style: textTheme.headlineLarge?.copyWith(
              fontSize: 50,
              fontWeight: FontWeight.bold,
              color: Colors.white,
            ),
          ),
          const SizedBox(height: 20),
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 20),
            child: Row(
              children: [
                HeadCard(
                  title: 'Income',
                  amount: 0.00,
                  icon: const Icon(Icons.arrow_circle_up),
                ),
                SizedBox(width: 10),
                HeadCard(
                  title: 'Expense',
                  amount: -0.00,
                  icon: const Icon(Icons.arrow_circle_down),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
