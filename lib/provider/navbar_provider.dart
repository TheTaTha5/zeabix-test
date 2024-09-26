import 'dart:developer';

import 'package:flutter/material.dart';

import '../view/pages/calendar_page.dart';
import '../view/pages/second_page.dart';

class NavbarRoutingProvider extends ChangeNotifier {
  int selectedIndex = 0;
  final List navbarPageRoutingList = [
    const CalendarPage(),
    const SecondPage(),
    //  QRCodeScanner(),
    //    ParcelManagement(),
    //    AccountPage(),
  ];

  void onItemTapped(int index) {
    selectedIndex = index;

    MaterialPageRoute(builder: (context) => navbarPageRoutingList[index]);
    log("routing ${navbarPageRoutingList[index]}");
    notifyListeners();
  }

  Future termAndConditionModal(context) {
    return showModalBottomSheet(
        context: (context),
        builder: (context) => FractionallySizedBox(
              heightFactor: 0.8,
              child: SizedBox(
                height: 700,
                child: Column(
                  mainAxisSize: MainAxisSize.min,
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    // BoldHeaderSizedText(text: "Terms And Conditions"),
                    ListView.builder(
                        scrollDirection: Axis.vertical,
                        itemCount: 10,
                        itemBuilder: ((context, index) => const SizedBox(
                              width: 300,
                              child: Text("Terms and Condiitons"),
                            )))
                  ],
                ),
              ),
            ));
  }
}
