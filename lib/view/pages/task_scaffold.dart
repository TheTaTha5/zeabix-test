import 'package:awesome_bottom_bar/awesome_bottom_bar.dart';
import 'package:flutter/material.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';

import '../home_page.dart';
import 'calendar_page.dart';
import 'google_map_page.dart';

class TaskScaffold extends StatefulWidget {
  final Widget body;
  final String appBar;
  final int currentIndex;
  final Widget? floatingActionButtons;
  const TaskScaffold(
      {super.key,
      required this.body,
      required this.currentIndex,
      required this.appBar,
      this.floatingActionButtons});

  @override
  _TaskScaffoldState createState() => _TaskScaffoldState();
}

class _TaskScaffoldState extends State<TaskScaffold> {
  double height = 30;
  Color colorSelect = const Color(0XFF0686F8);
  Color color = const Color(0XFF7AC0FF);
  Color color2 = const Color(0XFF96B1FD);
  Color bgColor = const Color(0XFF1752FE);
  final List<TabItem> items = const [
    TabItem(
      icon: Icons.calendar_month,
      title: 'Home',
    ),
    TabItem(
      icon: Icons.notifications,
      title: 'Shop',
    ),
    TabItem(
      icon: Icons.map_outlined,
      title: 'Wishlist',
    ),
    TabItem(
      icon: Icons.settings,
      title: 'Cart',
    ),
  ];

  void _navigateWithoutAnimation(String routeName) {
    Navigator.pushReplacement(
      context,
      PageRouteBuilder(
        pageBuilder: (context, animation, secondaryAnimation) =>
            _getPageForRoute(routeName),
        transitionDuration: Duration.zero,
        reverseTransitionDuration: Duration.zero,
        transitionsBuilder: (context, animation, secondaryAnimation, child) {
          return child; // No transition
        },
      ),
    );
  }

  Widget _getPageForRoute(String routeName) {
    switch (routeName) {
      case '/home':
        return const MyHomePage(
          title: "test",
        );
      case '/profile':
        return const CalendarPage();
      case '/settings':
        return const MyHomePage(title: "test");
      case '/map':
        return MapPage(taskLocations: [const LatLng(0, 0)]);
      default:
        return const CalendarPage();
    }
  }

  void _onItemTapped(int index) {
    // Handle navigation logic based on index
    switch (index) {
      case 0:
        _navigateWithoutAnimation('/home');
        break;
      case 1:
        _navigateWithoutAnimation('/profile');
        break;
      case 2:
        _navigateWithoutAnimation('/map');
        break;
      case 3:
        _navigateWithoutAnimation('/home');
        break;
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(widget.appBar),
      ),
      body: SafeArea(child: widget.body),
      bottomNavigationBar: BottomBarDefault(
        indexSelected: widget.currentIndex,
        onTap: (index) {
          setState(() {
            // visit = index;
            _onItemTapped(index);
          });
        },
        items: items,
        backgroundColor: bgColor,
        color: color,
        colorSelected: color2,
      ),
      floatingActionButton: widget.floatingActionButtons,
    );
  }
}
