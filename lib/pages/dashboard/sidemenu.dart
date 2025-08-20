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
        onPressed: (){
           Navigator.push(
                  context,
                  MaterialPageRoute(builder: (context) => BroilerPage()),
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