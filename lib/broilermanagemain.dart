import 'package:broilermanage/pages/broilerbottombar/broilerbottombar.dart';
import 'package:broilermanage/pages/dailyreports/dailyreports.dart';
import 'package:broilermanage/pages/dashboard/dashboard.dart';
import 'package:broilermanage/pages/expenses/expenses.dart';
import 'package:broilermanage/pages/inventory/inventory.dart';
import 'package:broilermanage/pages/profilepage/profilepage.dart';
import 'package:broilermanage/pages/sales/sales.dart';
import 'package:broilermanage/pages/utilities/constants.dart';
import 'package:flutter/material.dart';

class BroilerManageMain extends StatelessWidget {
  const BroilerManageMain({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        children: [
          Expanded(
            child: Navigator(
              key: Nav.mainListNav,
              initialRoute: '/main',
              onGenerateRoute: (RouteSettings settings) {
                Widget page;
                switch (settings.name) {
                  case '/main':
                    page = Dashboard();
                    break;
                  case '/reports':
                    page = DailyReportsPage();
                    break;
                  case '/inventory':
                    page = Inventory();
                    break;
                  case '/expenses':
                    page = ExpensesPage();
                    break;
                  case '/sales':
                    page = SalesPage();
                    break;
                  case '/profile':
                    page = ProfilePage();
                    break;
                  default:
                    page = Dashboard();
                }
                return PageRouteBuilder(
                  pageBuilder: (_, __, ___) => page,
                  transitionDuration: const Duration(seconds: 0),
                );
              },
            ),
          ),
          BroilerBottomBar(),
        ],
      ),
    );
  }
}
