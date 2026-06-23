import 'package:flutter/material.dart';
import 'package:bus_schedule_app/ui/Add_Reminder.dart';
import 'package:bus_schedule_app/ui/Set_Reminder.dart';
import 'package:bus_schedule_app/ui/home_page.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Bus Schedule App',
      theme: ThemeData(
        primarySwatch: Colors.orange,
      ),
      home: HomePage(),
      routes: {
        '/set_reminder': (context) => SetReminderPage(),
        '/add_reminder': (context) => AddReminderScreen(),
      },
    );
  }
}
