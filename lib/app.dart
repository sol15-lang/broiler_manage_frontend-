import 'package:broilermanage/broilermanagemain.dart';
import 'package:broilermanage/pages/dailyreports/dailyreports.dart';
import 'package:broilermanage/pages/expenses/expenses.dart';
import 'package:broilermanage/pages/inventory/inventory.dart';
import 'package:broilermanage/pages/profilepage/profilepage.dart';
import 'package:broilermanage/pages/sales/sales.dart';
import 'package:broilermanage/pages/splashscreen/splashscreen.dart';
import 'package:broilermanage/pages/utilities/constants.dart';
import 'package:broilermanage/pages/utilities/services.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class MyApp extends StatelessWidget {
  const MyApp({super.key});
  @override
  Widget build(BuildContext context) {
    return MultiProvider(
      providers: [
        ChangeNotifierProvider(
          create: (context) => BroilerBottomBarSelectionService(),
        ),
      ],
      child: MaterialApp(
        debugShowCheckedModeBanner: false,
        initialRoute: '/main',
        navigatorKey: Nav.mainAppNav,
        routes: {
          '/': (context) => SplashPage(),
          '/main': (context) => BroilerManageMain(),//Dashboard(),
          '/reports': (context) => DailyReportsPage(),
          '/inventory':(context)=> Inventory(),
          '/expenses':(context)=>ExpensesPage(),
          '/sales':(context)=>SalesPage(),
          '/profile':(context)=>ProfilePage()
        },
        
      ),
    );
  }
}