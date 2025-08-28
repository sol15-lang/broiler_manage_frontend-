import 'package:broilermanage/pages/utilities/services.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class BroilerBottomBar extends StatelessWidget {
  const BroilerBottomBar({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.all(30),
      child: Consumer<BroilerBottomBarSelectionService>(
        builder: (context, broilerbottomBarSelectionService, child) {
          return Row(
            crossAxisAlignment: CrossAxisAlignment.end,
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              IconButton(
                icon: Icon(Icons.home),
                onPressed: () {
                  broilerbottomBarSelectionService.setTabSelection('main');
                },
              ),
              IconButton(
                icon: Icon(Icons.assignment),
                onPressed: () {
                  broilerbottomBarSelectionService.setTabSelection('reports');
                },
              ),
              IconButton(
                icon: Icon(Icons.inventory),
                onPressed: () {
                  broilerbottomBarSelectionService.setTabSelection('inventory');
                },
              ),
              IconButton(
                icon: Icon(Icons.attach_money),
                onPressed: () {
                  broilerbottomBarSelectionService.setTabSelection('expenses');
                },
              ),
              IconButton(
                icon: Icon(Icons.bar_chart),
                onPressed: () {
                  broilerbottomBarSelectionService.setTabSelection('sales');
                },
              ),
            ],
          );
        },
      ),
    );
  }
}
