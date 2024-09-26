import 'package:awesome_bottom_bar/awesome_bottom_bar.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:firebase_messaging/firebase_messaging.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:task_viewer_zeabix/view/pages/user_page.dart';

import 'firebase_options.dart';
import 'provider/calendar_provider.dart';
import 'provider/navbar_provider.dart';
import 'view/home_page.dart';
import 'view/pages/calendar_page.dart';
import 'view/pages/login_page.dart';

// Future<void> _firebaseMessagingBackgroundHandler(RemoteMessage message) async {
//   await Firebase.initializeApp();
//   // Handle background message here
// }

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp(options: DefaultFirebaseOptions.currentPlatform);

  // FirebaseMessaging.onBackgroundMessage(_firebaseMessagingBackgroundHandler);
  runApp(MultiProvider(providers: [
    ChangeNotifierProvider(
      create: (context) => NavbarRoutingProvider(),
    ),
    ChangeNotifierProvider(create: (context) => CalendarProvider()),
  ], child: const MyApp()));
}

class MyApp extends StatefulWidget {
  const MyApp({super.key});

  @override
  State<MyApp> createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  int visit = 0;
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

  @override
  Widget build(BuildContext context) {
    return Consumer<CalendarProvider>(builder: (context, themeNotifier, child) {
      return MaterialApp(
        title: 'Task Viewer App',
        theme: ThemeData.light(), // Light theme
        darkTheme: ThemeData.dark(), // Dark theme
        themeMode: themeNotifier.themeMode,

        home: LoginPage(),
        routes: {
          '/home': (context) => const MyHomePage(
                title: "testr",
              ),
          '/calendar': (context) => const CalendarPage(),
          '/user': (context) => userPage()
        },
      );
    });
  }
}
