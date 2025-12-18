import 'package:flutter/material.dart';
import '../../models/expense.dart';

class ExpenseSummery extends StatelessWidget {
  final List<Expense> expenses;
  const ExpenseSummery({super.key, required this.expenses});

  // Show only one represent category
  Map<Category, double> _groupExpensesByCategory() {
    Map<Category, double> categoryTotals = {};

    for (var expense in expenses) {
      if (categoryTotals.containsKey(expense.category)) {
        categoryTotals[expense.category] =
            categoryTotals[expense.category]! + expense.amount;
      } else {
        categoryTotals[expense.category] = expense.amount;
      }
    }

    return categoryTotals;
  }

  @override
  Widget build(BuildContext context) {
    final categoryTotals = _groupExpensesByCategory();
    return Container(
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(20),
        color: Colors.white,
      ),
      height: 160,
      child: Center(
        child: Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: categoryTotals.entries.map((entry) {
            return Padding(
              padding: const EdgeInsets.symmetric(horizontal: 20.0),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Icon(
                    Expense.expenseIcon(entry.key),
                    size: 30,
                    color: Colors.black,
                  ),
                  SizedBox(height: 10),
                  Text(
                    '\$${entry.value.toStringAsFixed(2)}',
                    style: TextStyle(
                      color: Colors.black,
                      fontSize: 15,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                ],
              ),
            );
          }).toList(),
        ),
      ),
    );
  }
}
