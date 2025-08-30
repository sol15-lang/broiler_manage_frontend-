import 'package:broilermanage/pages/dashboard/sidemenu.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';

class Dashboard extends StatefulWidget {
  const Dashboard({super.key});

  @override
  State<Dashboard> createState() => _DashboardState();
}

class _DashboardState extends State<Dashboard> {
  // Fake broiler batches (later connect to backend)
  final List<String> broilerBatches = [
    "Batch 1 - Jan 2025",
    "Batch 2 - Feb 2025",
    "Batch 3 - Mar 2025",
  ];

  String selectedBatch = "Batch A - Jan 2025";

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      drawer: Drawer(child: SideMenu()),
      backgroundColor: Colors.green.shade50,
      appBar: AppBar(
        backgroundColor: Colors.green,
        title: const Text(
          'Green Farm - Batch 1',
          style: TextStyle(color: Colors.white, fontSize: 25),
        ),
      ),

      body: SingleChildScrollView(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              'Broiler Status',
              style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
            ),
            // Stats Grid
            GridView.count(
              crossAxisCount: 2,
              shrinkWrap: true,
              physics: const NeverScrollableScrollPhysics(),
              crossAxisSpacing: 12,
              mainAxisSpacing: 12,
              children: const [
                StatCard(
                  svgPath: "assets/icons/chicken.svg",
                  title: "Birds Remaining",
                  value: "1,200",
                ),
                StatCard(
                  svgPath: "assets/icons/mortality.svg",
                  title: "Mortality Today",
                  value: "5",
                ),
              ],
            ),
            const SizedBox(height: 20),

            Text(
              'Inventory Overview',
              style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
            ),
            SizedBox(height: 10),
            ListView(
              shrinkWrap: true,
              physics: NeverScrollableScrollPhysics(),
              children: [
                Container(
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(12),
                    color: Colors.green.shade100,
                  ),
                  child: ExpansionTile(
                    backgroundColor: Colors.white,
                    title: const Text("Feed"),
                    children: [
                      ListTile(
                        leading: SvgPicture.asset(
                          'assets/icons/feeding_icon.svg',
                          height: 24,
                          width: 24,
                          color: Colors.black,
                        ),
                        title: Text("Starter Feed"),
                        subtitle: Text("Quantity: 100 kg"),
                      ),
                      ListTile(
                        leading: SvgPicture.asset(
                          'assets/icons/feeding_icon.svg',
                          height: 24,
                          width: 24,
                          color: Colors.black,
                        ),
                        title: Text("Grower Feed"),
                        subtitle: Text("Quantity: 200 kg"),
                      ),
                      ListTile(
                        leading: SvgPicture.asset(
                          'assets/icons/feeding_icon.svg',
                          height: 24,
                          width: 24,
                          color: Colors.black,
                        ),
                        title: Text("Finisher Feed"),
                        subtitle: Text("Quantity: 150 kg"),
                      ),
                    ],
                  ),
                ),
                SizedBox(height: 15),
                Container(
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(12),
                    color: Colors.green.shade100,
                  ),
                  child: ExpansionTile(
                    backgroundColor: Colors.white,
                    title: const Text("Medicine"),
                    children: [
                      ListTile(
                        leading: SvgPicture.asset(
                          'assets/icons/medication.svg',
                          height: 24,
                          width: 24,
                          color: Colors.black,
                        ),
                        title: const Text("Antibiotic A"),
                        subtitle: const Text("Stock: 50 bottles"),
                      ),
                      ListTile(
                        leading: SvgPicture.asset(
                          'assets/icons/medication.svg',
                          height: 24,
                          width: 24,
                          color: Colors.black,
                        ),
                        title: const Text("Vitamin B"),
                        subtitle: const Text("Stock: 30 bottles"),
                      ),
                      ListTile(
                        leading: SvgPicture.asset(
                          'assets/icons/medication.svg',
                          height: 24,
                          width: 24,
                          color: Colors.black,
                        ),
                        title: Text("Dewormer"),
                        subtitle: Text("Stock: 20 sachets"),
                      ),
                    ],
                  ),
                ),
              ],
            ),

            const SizedBox(height: 15),

            // Charts (Placeholder containers)
            const Text(
              "Weight Growth",
              style: TextStyle(fontWeight: FontWeight.bold, fontSize: 20),
            ),
            SizedBox(
              height: 150,
              child: Card(
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(12),
                ),
                color: Colors.green.shade100,
                child: const Center(child: Text("📊 Chart Placeholder")),
              ),
            ),

            const SizedBox(height: 20),

            const Text(
              "Expenses Trend",
              style: TextStyle(fontWeight: FontWeight.bold, fontSize: 20),
            ),
            SizedBox(
              height: 150,
              child: Card(
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(12),
                ),
                color: Colors.green.shade100,
                child: const Center(child: Text("📊 Chart Placeholder")),
              ),
            ),
          ],
        ),
      ),
    );
  }
}

class StatCard extends StatelessWidget {
  final String title;
  final String value;
  final String? svgPath;

  const StatCard({
    super.key,
    required this.title,
    required this.value,
    this.svgPath,
  });

  @override
  Widget build(BuildContext context) {
    return Card(
      color: Colors.green.shade100,
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(12)),
      child: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            SvgPicture.asset(
              svgPath!,
              width: 40,
              height: 40,
              color: Colors.black,
            ),
            const SizedBox(height: 8),
            Text(
              title,
              textAlign: TextAlign.center,
              style: const TextStyle(fontSize: 14),
            ),
            const SizedBox(height: 4),
            Text(
              value,
              style: const TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
            ),
          ],
        ),
      ),
    );
  }
}
