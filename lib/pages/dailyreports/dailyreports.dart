import 'package:broilermanage/pages/profilepage/profilepage.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';

class DailyReportsPage extends StatefulWidget {
  const DailyReportsPage({super.key});

  @override
  State<DailyReportsPage> createState() => _DailyReportsPageState();
}

final List<String> feeds = ["Starter Feed", "Grower Feed", "Finisher Feed"];
final List<String> medicines = ["Antibiotic A", "Vaccine B", "Vitamin Mix"];

String? selectedFeed;
String? selectedMedicine;

class _DailyReportsPageState extends State<DailyReportsPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.green.shade50,
      appBar: AppBar(
        backgroundColor: Colors.green,
        title: const Text(
          "Daily Report",
          style: TextStyle(color: Colors.white,fontSize: 30),
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
                icon: Icon(Icons.person),
              ),
            ),
          ),
        ],
      ),
      body: SingleChildScrollView(
        child: Column(
          children: [
            Container(
              height: 540,
              margin: EdgeInsets.all(15),
              decoration: BoxDecoration(
                color: Colors.white,
                border: Border.all(color: Colors.transparent, width: 2),
                borderRadius: BorderRadius.circular(20),
              ),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Text("Today's Report",
                  style: TextStyle(
                    color: Colors.black,
                    fontSize: 20
                  ),
                  ),
                  SizedBox(height: 10),
                  Form(
                    child: Column(
                      children: [
                        Padding(
                          padding: const EdgeInsets.symmetric(horizontal: 20),
                          child: TextFormField(
                            keyboardType: TextInputType.number,
                            decoration: InputDecoration(
                              labelText: 'Mortality',
                              hintText: 'Enter mortality',
                              prefixIcon: Padding(
                                padding: const EdgeInsets.all(8.0),
                                child: SizedBox(
                                  width: 24,
                                  height: 24,
                                  child: SvgPicture.asset(
                                    "assets/icons/mortality.svg",
                                    color: const Color.fromARGB(255, 32, 30, 30),
                                    fit: BoxFit.contain,
                                  ),
                                ),
                              ),
                              border: OutlineInputBorder(
                                borderRadius: BorderRadius.circular(20),
                              ),
                            ),
                            onChanged: (String value) {},
                          ),
                        ),
                        SizedBox(height: 10),
                        Padding(
                          padding: const EdgeInsets.symmetric(horizontal: 20),
                          child: DropdownButtonFormField<String>(
                            value: selectedFeed,
                            decoration: InputDecoration(
                              labelText: "Select Feed",
                              border: OutlineInputBorder(
                                 borderRadius: BorderRadius.circular(20),
                              ),
                            ),
                            items: feeds.map((feed) {
                              return DropdownMenuItem(value: feed, child: Text(feed));
                            }).toList(),
                            onChanged: (val) {
                              setState(() {
                                selectedFeed = val;
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
                              labelText: 'Feed Used',
                              hintText: 'Enter feed used',
                              prefixIcon: Padding(
                                padding: const EdgeInsets.all(8.0),
                                child: SizedBox(
                                  width: 24,
                                  height: 24,
                                  child: SvgPicture.asset(
                                    "assets/icons/feeding_icon.svg",
                                    fit: BoxFit.contain,
                                  ),
                                ),
                              ),
                              border: OutlineInputBorder(
                                borderRadius: BorderRadius.circular(20),
                              ),
                            ),
                            onChanged: (String value) {},
                            validator: (value) {
                              return value!.isEmpty
                                  ? 'Please enter feed used'
                                  : null;
                            },
                          ),
                        ),
                        SizedBox(height: 10),
                        Padding(
                          padding: const EdgeInsets.symmetric(horizontal: 20),
                          child: DropdownButtonFormField<String>(
                            value: selectedMedicine,
                            decoration: InputDecoration(
                              labelText: "Select Medicine",
                              border: OutlineInputBorder(
                                 borderRadius: BorderRadius.circular(20),
                              ),
                            ),
                            items: medicines.map((med) {
                              return DropdownMenuItem(value: med, child: Text(med));
                            }).toList(),
                            onChanged: (val) {
                              setState(() {
                                selectedMedicine = val;
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
                              labelText: 'Medicine Used',
                              hintText: 'Enter medicine used',
                              prefixIcon: Padding(
                                padding: const EdgeInsets.all(8.0),
                                child: SizedBox(
                                  width: 24,
                                  height: 24,
                                  child: SvgPicture.asset(
                                    "assets/icons/medication.svg",
                                    color: const Color.fromARGB(255, 32, 30, 30),
                                    fit: BoxFit.contain,
                                  ),
                                ),
                              ),
                              border: OutlineInputBorder(
                                borderRadius: BorderRadius.circular(20),
                              ),
                            ),
                            onChanged: (String value) {},
                          ),
                        ),
                        SizedBox(height: 10),
                        Padding(
                          padding: const EdgeInsets.symmetric(horizontal: 20),
                          child: TextFormField(
                            keyboardType: TextInputType.number,
                            decoration: InputDecoration(
                              labelText: 'Average Weight',
                              hintText: 'Enter average weight',
                              prefixIcon: Padding(
                                padding: const EdgeInsets.all(8.0),
                                child: SizedBox(
                                  width: 24,
                                  height: 24,
                                  child: SvgPicture.asset(
                                    "assets/icons/weight.svg",
                                    color: const Color.fromARGB(255, 32, 30, 30) ,
                                    fit: BoxFit.contain,
                                  ),
                                ),
                              ),
                              border: OutlineInputBorder(
                                borderRadius: BorderRadius.circular(20),
                              ),
                            ),
                            onChanged: (String value) {},
                            validator: (value) {
                              return value!.isEmpty
                                  ? 'Please enter average weight'
                                  : null;
                            },
                          ),
                        ),
                        SizedBox(height: 10),
                        Padding(
                          padding: const EdgeInsets.all(8.0),
                          child: MaterialButton(
                            onPressed: () {},
                            shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(20),
                            ),
                            minWidth: 300,
                            height: 50,
                            color: Colors.green,
                            textColor: Colors.white,
                            child: Text(
                              'Submit Report',
                              style: TextStyle(fontSize: 20),
                            ),
                          ),
                        ),
                      ],
                    ),
                  ),
                ],
              ),
            ),
            Text('Reports History',
            style: TextStyle(
              color: Colors.black,
              fontSize: 20
            ),
            )
          ],
        ),
      ),
    );
  }
}
