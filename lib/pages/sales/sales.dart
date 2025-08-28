import 'package:broilermanage/pages/profilepage/profilepage.dart';
import 'package:broilermanage/pages/sales/addlocalsales.dart';
import 'package:broilermanage/pages/sales/addcommercialsale.dart';
import 'package:flutter/material.dart';

class SalesPage extends StatelessWidget {
  const SalesPage({super.key});

  @override
  Widget build(BuildContext context) {
    // Dummy sales data grouped into categories
    final Map<String, List<Map<String, dynamic>>> salesData = {
      "Local Sales": [
        {
          "date_of_sale": "2025-08-10",
          "number_of_birds_sold": 50,
          "total_weight": 90.5,
          "mean_weight": 1.81,
          "total_amount": 12500.00,
        },
        {
          "date_of_sale": "2025-08-15",
          "number_of_birds_sold": 40,
          "total_weight": 70.0,
          "mean_weight": 1.75,
          "total_amount": 9800.00,
        },
      ],
      "Commercial Sales": [
        {
          "date_of_sale": "2025-08-12",
          "number_of_birds_sold": 200,
          "total_weight": 350.5,
          "mean_weight": 1.75,
          "total_amount": 50000.00,
        },
        {
          "date_of_sale": "2025-08-18",
          "number_of_birds_sold": 150,
          "total_weight": 270.2,
          "mean_weight": 1.80,
          "total_amount": 38000.00,
        },
      ],
    };

    return Scaffold(
      backgroundColor: Colors.green.shade50,
      appBar: AppBar(
        backgroundColor: Colors.green,
        title: const Text("Sales", style: TextStyle(color: Colors.white, fontSize: 30)),
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
        children: salesData.entries.map((entry) {
          String categoryType = entry.key;
          List<Map<String, dynamic>> items = entry.value;

          return Card(
            margin: const EdgeInsets.all(10),
            color: Colors.white,
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
              children: items.map((sale) {
                return ListTile(
                  leading: const Icon(Icons.shopping_bag, color: Colors.green),
                  title: Text("Date: ${sale["date_of_sale"]}"),
                  subtitle: Text(
                    "Birds: ${sale["number_of_birds_sold"]}\n"
                    "Weight: ${sale["total_weight"]} kg\n"
                    "Mean: ${sale["mean_weight"]} kg\n"
                    "Total: KES ${sale["total_amount"]}",
                  ),
                );
              }).toList(),
            ),
          );
        }).toList(),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          showDialog(
            context: context,
            builder: (BuildContext context) {
              return AlertDialog(
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(20),
                ),
                title: const Text("Choose Sale Type", textAlign: TextAlign.center),
                content: Column(
                  mainAxisSize: MainAxisSize.min,
                  children: [
                    MaterialButton(
                      onPressed: () {
                        Navigator.pop(context);
                        Navigator.push(
                          context,
                          MaterialPageRoute(builder: (context) => AddLocalSale()),
                        );
                      },
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(30),
                      ),
                      minWidth: 50,
                      height: 50,
                      color: Colors.green,
                      child: const Text(
                        "Go to Add Local Sale",
                        style: TextStyle(color: Colors.white),
                      ),
                    ),
                    const SizedBox(height: 10),
                    MaterialButton(
                      onPressed: () {
                        Navigator.pop(context);
                        Navigator.push(
                          context,
                          MaterialPageRoute(builder: (context) => AddCommercialSale()),
                        );
                      },
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(30),
                      ),
                      minWidth: 50,
                      height: 50,
                      color: Colors.green,
                      child: const Text(
                        "Go to Add Commercial Sale",
                        style: TextStyle(color: Colors.white),
                      ),
                    ),
                  ],
                ),
              );
            },
          );
        },
        backgroundColor: Colors.white,
        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(50)),
        child: const Icon(Icons.add, color: Colors.black),
      ),
    );
  }
}
