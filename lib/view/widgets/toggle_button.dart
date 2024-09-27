import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:task_viewer_zeabix/provider/calendar_provider.dart';

class ThemeToggleButton extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final themeNotifier = Provider.of<CalendarProvider>(context);

    return IconButton(
      icon: Icon(
        themeNotifier.themeMode == ThemeMode.light
            ? Icons.dark_mode
            : Icons.light_mode,
      ),
      onPressed: () {
        themeNotifier.toggleTheme();
      },
      tooltip: 'Toggle Theme',
    );
  }
}
