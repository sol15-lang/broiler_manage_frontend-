import 'package:broilermanage/pages/expenses/addexpense.dart';
import 'package:broilermanage/pages/profilepage/profilepage.dart';
import 'package:flutter/material.dart';

class ExpensesPage extends StatelessWidget {
  const ExpensesPage({super.key});

   final List<Map<String, dynamic>> expensesData = const [
    {
      "category": "Feed",
      "name": "C1 Starter Feed",
      "quantity": 20,
      "unit": "bags",
      "amount": 4500,
      "date": "2025-08-18",
      "notes": "Bought starter feed for chicks"
    },
    {
      "category": "Feed",
      "name": "C2 Grower Feed",
      "quantity": 15,
      "unit": "bags",
      "amount": 3500,
      "date": "2025-08-16",
      "notes": "Feed for week 2"
    },
    {
      "category": "Medicine",
      "name": "Antibiotic",
      "quantity": 5,
      "unit": "bottles",
      "amount": 2000,
      "date": "2025-08-17",
      "notes": "Treatment for sick birds"
    },
    {
      "category": "Medicine",
      "name": "Vitamin",
      "quantity": 10,
      "unit": "bottles",
      "amount": 1500,
      "date": "2025-08-15",
      "notes": "Boost immunity"
    },
    {
      "category": "General",
      "name": "Transport",
      "quantity": 1,
      "unit": "trip",
      "amount": 1200,
      "date": "2025-08-14",
      "notes": "Feed delivery"
    },
  ];



  @override
   Widget build(BuildContext context) {
    // Group expenses by category dynamically
    Map<String, List<Map<String, dynamic>>> groupedExpenses = {};
    for (var expense in expensesData) {
      String category = expense["category"];
      if (groupedExpenses[category] == null) {
        groupedExpenses[category] = [];
      }
      groupedExpenses[category]!.add(expense);
    }

    return Scaffold(
      backgroundColor: Colors.green.shade100,
      appBar: AppBar(
        backgroundColor: Colors.green,
        title: const Text(
          "Expenses",
          style: TextStyle(color: Colors.white, fontSize: 30),
        ),
        actions: [
          Padding(
            padding: const EdgeInsets.only(right: 16.0),
            child: CircleAvatar(
              backgroundColor: Colors.white,
              child: IconButton(
                color: Colors.black,
                onPressed: () {
                   Navigator.push(
                  context,
                  MaterialPageRoute(builder: (context) => ProfilePage()),
                );
                },
                icon: const Icon(Icons.person),
              ),
            ),
          ),
        ],
      ),
      body: ListView(
        children: groupedExpenses.entries.map((entry) {
          String categoryType = entry.key;
          List<Map<String, dynamic>> items = entry.value;

          return Card(
            margin: const EdgeInsets.all(10),
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(12),
            ),
            child: ExpansionTile(
              title: Text(
                categoryType,
                style: const TextStyle(
                  fontSize: 18,
                  color: Colors.black,
                ),
              ),
              children: items.map((item) {
                return ListTile(
                  leading: const Icon(Icons.attach_money, color: Colors.green),
                  title: Text(item["name"]),
                  subtitle: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text("Quantity: ${item["quantity"]} ${item["unit"]}"),
                      Text("Date: ${item["date"]}"),
                      Text("Notes: ${item["notes"]}"),
                    ],
                  ),
                  trailing: Text(
                    "Ksh ${item["amount"]}",
                    style: const TextStyle(
                      fontWeight: FontWeight.bold,
                      color: Colors.black87,
                    ),
                  ),
                );
              }).toList(),
            ),
          );
        }).toList(),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: (){
           Navigator.push(
                  context,
                  MaterialPageRoute(builder: (context) => AddExpense()),
                );
        },
        backgroundColor: Colors.white,
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadiusGeometry.circular(50)
        ),
        child: Icon(Icons.add,
        color: Colors.black,
        ),
      ),
    );
  }
}