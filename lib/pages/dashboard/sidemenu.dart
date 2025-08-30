import 'package:broilermanage/pages/broilerregistration/broilerregistration.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';

class SideMenu extends StatefulWidget {
  const SideMenu({super.key});

  @override
  State<SideMenu> createState() => _SideMenuState();
}

class _SideMenuState extends State<SideMenu> {
    final List<String> broilerBatches = [
    "Batch 1 - Jan 2025",
    "Batch 2 - Feb 2025",
    "Batch 3 - Mar 2025",
  ];

  String selectedBatch = "Batch A - Jan 2025";
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.green.shade50,
      appBar: AppBar(
        backgroundColor: Colors.green,
        leading: SvgPicture.asset('assets/icons/chicken.svg',
        height: 40,
        width: 40,
        ),
        title: Text('Your Batches',
        style:TextStyle(
          color: Colors.black
        ) ,
        ),
      ),
      body: Column(
        children: [
          Expanded(
              child: ListView.builder(
                itemCount: broilerBatches.length,
                itemBuilder: (context, index) {
                  return ListTile(
                    title: Text(broilerBatches[index]),
                    leading: SvgPicture.asset(
                      'assets/icons/chicken.svg',
                      height: 24,
                      width: 24,
                      color: Colors.green,
                    ),
                    onTap: () {
                      setState(() {
                        selectedBatch = broilerBatches[index];
                      });
                      Navigator.pop(context);
                    },
                  );
                },
              ),
            ),
        ],
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
                title: const Text("Add Batch", textAlign: TextAlign.center),
                content: Column(
                  mainAxisSize: MainAxisSize.min,
                  children: [
                    MaterialButton(
                      onPressed: () {
                        Navigator.pop(context);
                        Navigator.push(
                          context,
                          MaterialPageRoute(builder: (context) => BroilerPage()),
                        );
                      },
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(30),
                      ),
                      minWidth: 50,
                      height: 50,
                      color: Colors.green,
                      child: const Text(
                        "Go to Broiler registration",
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