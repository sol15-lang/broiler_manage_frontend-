import 'package:broilermanage/pages/inventory/addinventory.dart';
import 'package:broilermanage/pages/profilepage/profilepage.dart';
import 'package:flutter/material.dart';

class Inventory extends StatelessWidget {
  const Inventory({super.key});

  @override
  Widget build(BuildContext context) {
    // Dummy inventory data (replace with backend response later)
    final Map<String, List<Map<String, String>>> inventoryData = {
      "Feed": [
        {"name": "C1 Starter Feed", "quantity": "120", "unit": "kg"},
        {"name": "C2 Grower Feed", "quantity": "80", "unit": "kg"},
        {"name": "C3 Finisher Feed", "quantity": "90", "unit": "kg"},
        {"name": "Supplements", "quantity": "15", "unit": "kg"},
      ],
      "Medicine": [
        {"name": "Vaccine", "quantity": "25", "unit": "doses"},
        {"name": "Vitamin", "quantity": "10", "unit": "bottles"},
        {"name": "Dewormer", "quantity": "5", "unit": "bottles"},
      ],
      "Equipment": [
        {"name": "Feeders", "quantity": "15", "unit": "pieces"},
        {"name": "Heater", "quantity": "2", "unit": "pieces"},
      ],
    };

    return Scaffold(
      backgroundColor: Colors.green.shade50,
      appBar: AppBar(
        backgroundColor: Colors.green,
        title: const Text("Inventory", style: TextStyle(color: Colors.white,fontSize: 30)),
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
                icon: Icon(Icons.person),
              ),
            ),
          ),
        ],
      ),
      body: ListView(
        children: inventoryData.entries.map((entry) {
          String categoryType = entry.key;
          List<Map<String, String>> items = entry.value;

          return Card(
            margin: EdgeInsets.all(10),
            color: Colors.green.shade100,
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
                  leading: const Icon(Icons.inventory, color: Colors.green),
                  title: Text(item["name"]!),
                  trailing: Text(
                    "${item["quantity"]} ${item["unit"]}",
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
                  MaterialPageRoute(builder: (context) => AddInventory()),
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
