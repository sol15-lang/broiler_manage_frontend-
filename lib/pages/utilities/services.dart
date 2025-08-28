import 'package:broilermanage/pages/utilities/constants.dart';
import 'package:flutter/material.dart';

class BroilerBottomBarSelectionService extends ChangeNotifier {
  String? tabSelection = 'main';

  void setTabSelection(String selection) {
    Nav.mainListNav.currentState!.pushReplacementNamed('/$selection');
    tabSelection = selection;
    notifyListeners();
  }
}
