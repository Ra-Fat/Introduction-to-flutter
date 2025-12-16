import 'package:flutter/material.dart';
import '../../models/expense.dart';

class ExpenseForm extends StatefulWidget {
  const ExpenseForm({super.key});

  @override
  State<ExpenseForm> createState() => _ExpenseFormState();
}

class _ExpenseFormState extends State<ExpenseForm> {
  final _titleController = TextEditingController();
  final _priceController = TextEditingController();
  Category _selectCategory = Category.food;

  @override
  void dispose() {
    super.dispose();
    _priceController.dispose();
    _titleController.dispose();
  }

  void _showErrorDialog(String message){
    showDialog(
      context: context, 
      builder: (ctx) => AlertDialog(
        title: Text("Invalid Input"),
        
      ) 
    );
  }


  void onCreate() {
    //  1 Build an expense
    String title = _titleController.text;
    double? amount = double.tryParse(_priceController.text);
    Category category = Category.food;
    DateTime date = DateTime.now();




    if(title.isEmpty){
      
    }

    Expense newExpense = Expense(
      title: title,
      amount: amount ?? 0.0,
      date: date,
      category: category,
    );

    Navigator.pop(context, newExpense);
  }

  void onCancel() {
    Navigator.pop(context);
  }

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(20.0),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: [
          TextField(
            controller: _titleController,
            decoration: InputDecoration(label: Text("Title")),
            maxLength: 50,
          ),
          Row(
            children: [
              Expanded(
                child: TextField(
                  controller: _priceController,
                  decoration: InputDecoration(label: Text("Price")),
                ),
              ),
            ],
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              DropdownButton(
                value: _selectCategory,
                items: Category.values.map((c) {
                  return DropdownMenuItem(
                    value: c,
                    child: Text(c.name.toUpperCase()),
                  );
                }).toList(),
                onChanged: (value) {
                  setState(() {
                    _selectCategory = value!;
                  });
                },
              ),
              Expanded(
                flex: 2,
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.end,
                  children: [
                    // ElevatedButton(
                    //   onPressed: onCancel,
                      
                    //   style: ButtonStyle(
                    //     backgroundColor: WidgetStatePropertyAll(Colors.white)
                    //   ),
                    //   child: Text("Cancel"),
                    // ),
                    GestureDetector(
                      onTap: onCancel,
                      child: Text("Cancel"),
                    ),
                    SizedBox(width: 10,),
                    ElevatedButton(
                      onPressed: onCreate,
                      style: ButtonStyle(
                        backgroundColor: WidgetStatePropertyAll(Colors.blue),
                      ),
                      child: Text("Save Expense",
                      style: TextStyle(
                        color: Colors.white,
                        fontWeight: FontWeight.bold
                      ),),
                    ),
                  ],
                ),
              ),
            ],
          ),
        ],
      ),
    );
  }
}
