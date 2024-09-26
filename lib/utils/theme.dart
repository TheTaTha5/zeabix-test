import 'package:flutter/material.dart';

ThemeData defaultTheme = ThemeData(
  fontFamily: 'SukkhumvitSet',

  // GoogleFonts.kanit().fontFamily,
  colorScheme: ColorScheme.fromSeed(
      seedColor: const Color.fromARGB(255, 11, 59, 129),
      primary: Colors.blue.shade900),
);

class AppTheme {
  static BorderInts borderInts = BorderInts();
  static TextVariable textVariable = TextVariable();
  static StatusColor statusColor = StatusColor();
  static const Color irishGreen = Color.fromARGB(255, 6, 165, 0);
  static const Color lightBlue = Color.fromARGB(255, 127, 178, 194);
  static const Color yellow = Color.fromARGB(255, 255, 255, 0);
  static const Color thunder = Color.fromARGB(255, 48, 48, 48);
  static const Color red = Color.fromARGB(255, 255, 88, 88);
  static const Color grandis = Color.fromARGB(255, 255, 211, 140);
  static const Color deepBlue = Color.fromRGBO(13, 71, 161, 1);
  static const Color orange = Color.fromRGBO(255, 173, 0, 1);
  static const Color white = Colors.white;
  static const Color dimGray = Color.fromARGB(255, 175, 175, 175);
  static const Color lightGray = Color.fromARGB(255, 231, 226, 226);
  // static const Color teal = Color.fromRGBO(0, 50, 50, 100);
  static const Color purple = Color.fromRGBO(106, 27, 154, 1);
  static const Color cheese = Color.fromRGBO(254, 166, 2, 1);
  static const Color rosePink = Color.fromRGBO(242, 129, 111, 1);
  static const Color teal = Color.fromRGBO(90, 158, 154, 1);
  static const Color dimPurple = Color.fromRGBO(122, 81, 149, 1);
  static const Color black = Colors.black;
  static const Color opaGray = Color.fromRGBO(169, 169, 169, 50);
  static const Color green = Color.fromARGB(255, 6, 165, 0);
  static const Color transparent = Colors.transparent;
  static const Color crimson = Color.fromARGB(255, 220, 20, 60);
  static const Color deepOrange = Color.fromARGB(255, 242, 89, 32);
  static const Color kimGreen = Color.fromRGBO(6, 165, 0, 1);
}

class BorderInts {
  static const double _borderCircularSoft = 15;
  static const double _paddingAllSide = 10;
  static const double _borderCircularHard = 5;
  double get borderCircularSoft => _borderCircularSoft;
  double get borderCircularHard => _borderCircularHard;
  double get paddingAllSide => _paddingAllSide;
}

class TextVariable {
  static const double _headerSize = 25;
  static const double _normalSize = 15;
  static const double _header2Size = 20;
  double get header2Size => _header2Size;
  double get headerSize => _headerSize;
  double get normalSize => _normalSize;
}

class WidgetColor {}

class StatusColor {
  Color get lightBlue => const Color.fromRGBO(92, 204, 200, 1);
  Color get headerSize => const Color.fromRGBO(106, 27, 154, 1);
  Color get normalSize => const Color.fromRGBO(106, 27, 154, 1);
}
