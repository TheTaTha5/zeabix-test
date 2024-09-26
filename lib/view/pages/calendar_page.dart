import 'package:flutter/material.dart';
import 'package:flutter_speed_dial/flutter_speed_dial.dart';
import 'package:provider/provider.dart';
import 'package:syncfusion_flutter_calendar/calendar.dart';

import '../../model/appointment_model.dart';
import '../../provider/calendar_provider.dart';
import 'task_scaffold.dart';

class CalendarPage extends StatefulWidget {
  const CalendarPage({super.key});

  @override
  State<CalendarPage> createState() => _CalendarPageState();
}

class _CalendarPageState extends State<CalendarPage> {
  @override
  void initState() {
    super.initState();
    WidgetsBinding.instance.addPostFrameCallback((_) {
      context.read<CalendarProvider>().fetchEventsFromGeoPoints();
    });
  }

  Color? _headerColor, _viewHeaderColor, _calendarColor;
  void calendarTapped(CalendarTapDetails calendarTapDetails) {
    if (context.read<CalendarProvider>().controller.view ==
            CalendarView.month &&
        calendarTapDetails.targetElement == CalendarElement.calendarCell) {
      context.read<CalendarProvider>().controller.view = CalendarView.day;
    } else if ((context.read<CalendarProvider>().controller.view ==
                CalendarView.week ||
            context.read<CalendarProvider>().controller.view ==
                CalendarView.workWeek) &&
        calendarTapDetails.targetElement == CalendarElement.viewHeader) {
      context.read<CalendarProvider>().controller.view = CalendarView.day;
    }
  }

  @override
  Widget build(BuildContext context) {
    final appointments = context.watch<CalendarProvider>().appointments;

    return TaskScaffold(
      appBar: "Your Calendar",
      body: SafeArea(
        child: Column(
          children: [
            const Center(
              child: Text("Calendar menu"),
            ),
            Expanded(
              child: SizedBox(
                height: MediaQuery.of(context).size.height * 0.6,
                width: MediaQuery.of(context).size.width * 0.8,
                child: SfCalendar(
                  view: CalendarView.week,
                  allowedViews: const [
                    CalendarView.day,
                    CalendarView.week,
                    CalendarView.workWeek,
                    CalendarView.month,
                    CalendarView.timelineDay,
                    CalendarView.timelineWeek,
                    CalendarView.timelineWorkWeek
                  ],
                  viewHeaderStyle:
                      ViewHeaderStyle(backgroundColor: _viewHeaderColor),
                  backgroundColor: _calendarColor,
                  controller: context.read<CalendarProvider>().controller,
                  initialDisplayDate: DateTime.now(),
                  onTap: calendarTapped,
                  monthViewSettings: const MonthViewSettings(
                      navigationDirection: MonthNavigationDirection.vertical),
                  appointmentBuilder: (context, details) {
                    final Appointment appointment = details.appointments.first;
                    return Container(
                      color: appointment.color,
                      child: Center(child: Text(appointment.subject)),
                    );
                  },
                  // Bind appointments to the calendar
                  dataSource: AppointmentDataSource(appointments),
                ),
              ),
            )
          ],
        ),
      ),
      currentIndex: 1,
      floatingActionButtons: SpeedDial(
        animatedIcon: AnimatedIcons.menu_close,
        backgroundColor: Colors.blue,
        children: [
          SpeedDialChild(
            child: const Icon(Icons.accessibility),
            backgroundColor: Colors.red,
            label: 'Week',
            onTap: () => print('first Button Pressed'),
          ),
          SpeedDialChild(
            child: const Icon(Icons.brush),
            backgroundColor: Colors.green,
            label: 'Month',
            onTap: () => print('Second Button Pressed'),
          ),
          SpeedDialChild(
            child: const Icon(Icons.keyboard_voice),
            backgroundColor: Colors.orange,
            label: 'Day',
            onTap: () => print('Third Button Pressed'),
          ),
        ],
      ),
    );
  }
}
