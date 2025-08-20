import 'package:broilermanage/pages/expenses/expenses.dart';
import 'package:flutter/material.dart';

class AddExpense extends StatefulWidget {
  const AddExpense({super.key});


  @override
  State<AddExpense> createState() => _AddExpenseState();
}

class _AddExpenseState extends State<AddExpense> {
  String? selectedBroiler;
  String? selectedCategory;
  String? selectedItem;
  final TextEditingController quantityController = TextEditingController();
  final TextEditingController unitController = TextEditingController();

  // Example mock data – later this should come from API
  final List<String> broilerBatches = [
    "Batch 1 - Jan 2025",
    "Batch 2 - Feb 2025",
  ];

  final Map<String, List<String>> categories = {
    'Feed': [
      'C1 Starter Feed',
      'C2 Grower Feed',
      'C3 Finisher Feed',
      'Supplements',
    ],
    'Medicine': ['Antibiotic', 'Vaccine', 'Vitamin', 'Dewormer'],
    'Equipment': ['Feeders', 'Drinkers', 'Heater', 'Weighing Scale'],
    'General': ['Transport', 'Electricity', 'Labor', 'Chicks'],
  };
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.green.shade50,
      appBar: AppBar(
        backgroundColor: Colors.green,
        title: const Text(
          "Expense Form",
          style: TextStyle(color: Colors.white, fontSize: 30),
        ),
      ),
      body: Center(
        child: SingleChildScrollView(
          child: Column(
            children: [
              Container(
                height: 700,
                margin: EdgeInsets.all(15),
                decoration: BoxDecoration(
                  color: Colors.white,
                  border: Border.all(color: Colors.transparent, width: 2),
                  borderRadius: BorderRadius.circular(20),
                ),
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Text(
                      "Expense",
                      style: TextStyle(color: Colors.black, fontSize: 20),
                    ),
                    SizedBox(height: 10),
                    Form(
                      child: Column(
                        children: [
                          const SizedBox(height: 10),
                          Padding(
                            padding: const EdgeInsets.symmetric(horizontal: 20),
                            child: DropdownButtonFormField<String>(
                              decoration: InputDecoration(
                                labelText: "Select Batch",
                                border: OutlineInputBorder(
                                  borderRadius: BorderRadius.circular(20),
                                ),
                              ),
                              value: selectedBroiler,
                              items: broilerBatches.map((b) {
                                return DropdownMenuItem(value: b, child: Text(b));
                              }).toList(),
                              onChanged: (val) {
                                setState(() {
                                  selectedBroiler = val;
                                });
                              },
                            ),
                          ),
                          const SizedBox(height: 10),
                          Padding(
                            padding: const EdgeInsets.symmetric(horizontal: 20),
                            child: DropdownButtonFormField<String>(
                              decoration: InputDecoration(
                                labelText: "Category Type",
                                border: OutlineInputBorder(
                                  borderRadius: BorderRadius.circular(20),
                                ),
                              ),
                              value: selectedCategory,
                              items: categories.keys.map((cat) {
                                return DropdownMenuItem(
                                  value: cat,
                                  child: Text(cat),
                                );
                              }).toList(),
                              onChanged: (val) {
                                setState(() {
                                  selectedCategory = val;
                                  selectedItem = null;
                                });
                              },
                            ),
                          ),
                          const SizedBox(height: 10),
                          if (selectedCategory != null)
                            Padding(
                              padding: const EdgeInsets.symmetric(horizontal: 20),
                              child: DropdownButtonFormField<String>(
                                decoration: InputDecoration(
                                  labelText: "Select Item",
                                  border: OutlineInputBorder(
                                    borderRadius: BorderRadius.circular(20),
                                  ),
                                ),
                                value: selectedItem,
                                items: categories[selectedCategory]!.map((item) {
                                  return DropdownMenuItem(
                                    value: item,
                                    child: Text(item),
                                  );
                                }).toList(),
                                onChanged: (val) {
                                  setState(() {
                                    selectedItem = val;
                                  });
                                },
                              ),
                            ),
                          SizedBox(height: 10),
                           Padding(
                            padding: const EdgeInsets.symmetric(horizontal: 20),
                            child: TextFormField(
                              keyboardType: TextInputType.number,
                              decoration: InputDecoration(
                                labelText: 'Unit Amount',
                                hintText: 'Enter unit amount',
                                border: OutlineInputBorder(
                                  borderRadius: BorderRadius.circular(20),
                                ),
                              ),
                              onChanged: (String value) {},
                              validator: (value) {
                                return value!.isEmpty
                                    ? 'Please enter amount'
                                    : null;
                              },
                            ),
                          ),
                          SizedBox(height: 10),
                          Padding(
                            padding: const EdgeInsets.symmetric(horizontal: 20),
                            child: TextFormField(
                              keyboardType: TextInputType.number,
                              decoration: InputDecoration(
                                labelText: 'Quantity',
                                hintText: 'Enter quantity',
                                border: OutlineInputBorder(
                                  borderRadius: BorderRadius.circular(20),
                                ),
                              ),
                              onChanged: (String value) {},
                              validator: (value) {
                                return value!.isEmpty
                                    ? 'Please enter quantity'
                                    : null;
                              },
                            ),
                          ),
                          SizedBox(height: 10),
                          Padding(
                            padding: const EdgeInsets.symmetric(horizontal: 20),
                            child: TextFormField(
                              keyboardType: TextInputType.number,
                              decoration: InputDecoration(
                                labelText: 'Unit',
                                hintText: 'Enter Unit',
                                border: OutlineInputBorder(
                                  borderRadius: BorderRadius.circular(20),
                                ),
                              ),
                              onChanged: (String value) {},
                              validator: (value) {
                                return value!.isEmpty
                                    ? 'Please enter unit'
                                    : null;
                              },
                            ),
                          ),
                          SizedBox(height: 10),
                          Padding(
                            padding: const EdgeInsets.symmetric(horizontal: 20),
                            child: TextFormField(
                              keyboardType: TextInputType.datetime,
                              decoration: InputDecoration(
                                labelText: 'Expense Date',
                                hintText: 'Enter date',
                                border: OutlineInputBorder(
                                  borderRadius: BorderRadius.circular(20),
                                ),
                              ),
                              onChanged: (String value) {},
                              validator: (value) {
                                return value!.isEmpty
                                    ? 'Please enter date'
                                    : null;
                              },
                            ),
                          ),
                          SizedBox(height: 10),
                          Padding(
                            padding: const EdgeInsets.symmetric(horizontal: 20),
                            child: TextFormField(
                              keyboardType: TextInputType.number,
                              decoration: InputDecoration(
                                labelText: 'Notes',
                                hintText: 'Enter note',
                                border: OutlineInputBorder(
                                  borderRadius: BorderRadius.circular(20),
                                ),
                              ),
                              onChanged: (String value) {},
                            ),
                          ),
                          SizedBox(height: 10),
                          Padding(
                            padding: const EdgeInsets.all(8.0),
                            child: MaterialButton(
                              onPressed: () {
                                Navigator.push(
                                  context,
                                  MaterialPageRoute(
                                    builder: (context) => ExpensesPage(),
                                  ),
                                );
                              },
                              shape: RoundedRectangleBorder(
                                borderRadius: BorderRadius.circular(20),
                              ),
                              minWidth: 300,
                              height: 50,
                              color: Colors.green,
                              textColor: Colors.white,
                              child: Text('Save', style: TextStyle(fontSize: 20)),
                            ),
                          ),
                        ],
                      ),
                    ),
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}