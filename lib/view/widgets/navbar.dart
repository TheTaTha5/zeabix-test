import 'dart:developer';

import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../../provider/navbar_provider.dart';
import '../../utils/theme.dart';

class Navbar extends StatelessWidget {
  const Navbar({super.key});

  @override
  Widget build(BuildContext context) {
    return ConstrainedBox(
      constraints: const BoxConstraints(
        minHeight: 60,
      ),
      child: Consumer<NavbarRoutingProvider>(
        builder: (context, index, child) {
          return BottomNavigationBar(
            type: BottomNavigationBarType.fixed,
            items: <BottomNavigationBarItem>[
              BottomNavigationBarItem(
                icon: Icon(Icons.calendar_month,
                    color: index.selectedIndex == 0
                        ? Colors.amber[800]
                        : AppTheme.thunder),
                label: 'ปฎิทิน',
              ),
              BottomNavigationBarItem(
                icon: Icon(Icons.task,
                    color: index.selectedIndex == 1
                        ? Colors.amber[800]
                        : AppTheme.thunder),
                label: 'งาน',
              ),
              BottomNavigationBarItem(
                  icon: Icon(Icons.map_outlined,
                      color: index.selectedIndex == 2
                          ? Colors.amber[800]
                          : AppTheme.thunder),
                  label: "แผนที่"),
              BottomNavigationBarItem(
                icon: Icon(Icons.settings,
                    color: index.selectedIndex == 3
                        ? Colors.amber[800]
                        : AppTheme.thunder),
                label: 'ตั้งค่า',
              ),
            ],
            currentIndex: index.selectedIndex,
            unselectedItemColor: const Color.fromARGB(255, 80, 71, 71),
            selectedItemColor: Colors.amber[800],
            onTap: (tappedIndex) async {
              // Provider.of<ParcelController>(context, listen: false)
              //     .setValidateOff();
              log("$tappedIndex");
              index.onItemTapped(tappedIndex);
              // final currentRoute = ModalRoute.of(context)?.settings.name;
              // log("currentRoute == $currentRoute");
              // if ((currentRoute == '/show_booking_page' ||
              //         currentRoute == '/searched_parcel_page') &&
              //     (tappedIndex == 0)) {
              //   await showDialog(
              //     context: context,
              //     builder: (context) => Center(
              //       child: SizedBox(
              //         height: 200,
              //         width: 360,
              //         child: Material(
              //           borderRadius: BorderRadius.circular(
              //               AppTheme.borderInts.borderCircularSoft),
              //           child: Padding(
              //             padding: const EdgeInsets.all(8.0),
              //             child: Column(
              //               mainAxisAlignment: MainAxisAlignment.spaceAround,
              //               crossAxisAlignment: CrossAxisAlignment.center,
              //               children: [
              //                 BoldHeaderSizedText(
              //                     text: "ยืนยันต้องการกลับไปที่หน้ารับพัสดุ"),
              //                 NormalSized(
              //                     color: Colors.black,
              //                     text:
              //                         "คุณต้องการกลับไปที่หน้ารับพัสดุใช่หรือไม่"),
              //                 Row(
              //                   mainAxisAlignment: MainAxisAlignment.center,
              //                   children: [
              //                     SizedBox(
              //                       width: 120,
              //                       height: 45,
              //                       child: SpeedyButton(
              //                           color: Colors.white,
              //                           text: "ปิด",
              //                           textColor: Colors.black,
              //                           onPressed: () {
              //                             Navigator.of(context).pop();
              //                           }),
              //                     ),
              //                     const SizedBox(
              //                       width: 6,
              //                     ),
              //                     SizedBox(
              //                       width: 120,
              //                       height: 45,
              //                       child: SpeedyButton(
              //                           color: const Color(0xFFF25920),
              //                           text: "ยืนยัน",
              //                           onPressed: () {
              //                             Navigator.pop(context);
              //                             Navigator.pushReplacementNamed(
              //                                 context, '/homePage');
              //                           }),
              //                     ),
              //                   ],
              //                 ),
              //               ],
              //             ),
              //           ),
              //         ),
              //       ),
              //     ),
              //   );
              // } else {
              //   index.onItemTapped(tappedIndex);
              //   Navigator.push(context,
              //       PageRouteBuilder(pageBuilder: (context, _, __) {
              //     return index.navbarPageRoutingList[tappedIndex];
              //   }));
              // }
            },
          );
        },
      ),
    );
  }
}
