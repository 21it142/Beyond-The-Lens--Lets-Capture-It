import 'package:flutter/material.dart';
import 'package:place/models/expense.dart';
import 'package:place/widget/expense_item.dart';

class ExpenseList extends StatelessWidget {
  final List<Expense> expenses;
  const ExpenseList(
      {required this.expenses, required this.onRemoveExpense, super.key});

  final void Function(Expense expense) onRemoveExpense;

  @override
  Widget build(BuildContext context) {
    return ListView.builder(
      itemCount: expenses.length,
      itemBuilder: (ctx, index) => Dismissible(
          key: ValueKey(expenses[index]),
          background: Container(
            color: Theme.of(context).colorScheme.error.withOpacity(.75),
            // margin: EdgeInsets.symmetric(
            //   horizontal: Theme.of(context).cardTheme.margin!.horizontal,
            // ),
          ),
          onDismissed: (direction) {
            onRemoveExpense(expenses[index]);
          },
          child: ExpenseItem(expenses[index])),
    );
  }
}
