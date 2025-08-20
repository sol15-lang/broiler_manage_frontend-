import 'package:broilermanage/pages/profilepage/profilepage.dart';
import 'package:broilermanage/pages/sales/addsale.dart';
import 'package:flutter/material.dart';

class SalesPage extends StatefulWidget {
  const SalesPage({super.key});

  @override
  State<SalesPage> createState() => _SalesPageState();
}

class _SalesPageState extends State<SalesPage> {
  // Mock sales data
  List<Map<String, dynamic>> sales = [
    {
      "date_of_sale": "2025-08-10",
      "number_of_birds_sold": 200,
      "total_weight": 350.5,
      "mean_weight": 1.75,
      "total_amount": 50000.00,
    },
    {
      "date_of_sale": "2025-08-12",
      "number_of_birds_sold": 150,
      "total_weight": 270.2,
      "mean_weight": 1.80,
      "total_amount": 38000.00,
    },
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.green,
        title: const Text(
          "Sales",
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
      body: ListView.builder(
        itemCount: sales.length,
        itemBuilder: (context, index) {
          final sale = sales[index];
          return Card(
            margin: const EdgeInsets.all(10),
            child: ListTile(
              title: Text("Date: ${sale["date_of_sale"]}"),
              subtitle: Text(
                "Birds: ${sale["number_of_birds_sold"]}\n"
                "Weight: ${sale["total_weight"]} kg\n"
                "Mean: ${sale["mean_weight"]} kg\n"
                "Total: KES ${sale["total_amount"]}",
              ),
              trailing: const Icon(Icons.arrow_forward_ios),
            ),
          );
        },
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          Navigator.push(
            context,
            MaterialPageRoute(builder: (context) => AddSale()),
          );
        },
        backgroundColor: Colors.white,
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadiusGeometry.circular(50),
        ),
        child: Icon(Icons.add, color: Colors.black),
      ),
    );
  }
}
