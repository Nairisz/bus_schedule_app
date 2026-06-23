import 'package:bus_schedule_app/ui/destination_dropdown.dart';
import 'package:bus_schedule_app/ui/navigation_tile.dart';
import 'package:flutter/material.dart';
import 'package:bus_schedule_app/ui/Current_Schedule.dart';
import 'package:bus_schedule_app/ui/Full_Schedule.dart';
import 'package:bus_schedule_app/ui/Notification_page.dart';
import 'package:bus_schedule_app/ui/Set_Reminder.dart';
import 'package:bus_schedule_app/ui/custom_app_bar.dart';

class HomePage extends StatefulWidget {
  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  String selectedDestination = "Select Destination";
  final List<String> suggestions = ["kemumin", "kampus kota"];

  void _onSearchSubmitted(BuildContext context, String query) {
    Navigator.push(
      context,
      MaterialPageRoute(builder: (context) => SearchResultPage(query: query)),
    );
  }

  void _selectDestination(String destination) {
    setState(() {
      selectedDestination = destination;
    });
    _onSearchSubmitted(context, destination);
  }

  void _showNotifications() {
    Navigator.push(
      context,
      MaterialPageRoute(
          builder: (context) => NotificationPage(notifications: [])),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color.fromARGB(255, 255, 235, 224),
      body: Column(
        children: <Widget>[
          CustomAppBar(),
          Expanded(
            child: ListView(
              padding: EdgeInsets.zero, // Ensures no padding around ListView
              children: <Widget>[
                Image.asset(
                    "image/tasik_02.jpg"), // Directly following the AppBar
                SizedBox(height: 20),
                Container(
                  alignment: Alignment(-0.8, 0),
                  child: Text("Destination:", style: TextStyle(fontSize: 24)),
                ),
                SizedBox(height: 10),
                Padding(
                  padding: EdgeInsets.symmetric(horizontal: 20),
                  child: Row(
                    children: [
                      Expanded(
                        child: DestinationDropdown(
                          suggestions: suggestions,
                          selectedDestination: selectedDestination,
                          onDestinationSelected: _selectDestination,
                        ),
                      ),
                      IconButton(
                        icon: Icon(Icons.notifications, color: Colors.orange),
                        onPressed: _showNotifications,
                      ),
                    ],
                  ),
                ),
                SizedBox(height: 20),
                NavigationTile(
                  imagePath: "image/bust_stop_1.png",
                  title: "Full Schedule",
                  onTap: () {
                    Navigator.push(
                      context,
                      MaterialPageRoute(
                          builder: (context) => FullSchedulePage()),
                    );
                  },
                ),
                SizedBox(height: 30),
                NavigationTile(
                  imagePath: "image/calendar.jpg",
                  title: "Set Reminder",
                  onTap: () {
                    Navigator.push(
                      context,
                      MaterialPageRoute(
                          builder: (context) => SetReminderPage()),
                    );
                  },
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
