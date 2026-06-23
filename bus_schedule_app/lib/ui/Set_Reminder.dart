import 'package:flutter/material.dart';
import 'package:bus_schedule_app/ui/ReminderTile.dart';

class SetReminderPage extends StatefulWidget {
  @override
  _SetReminderPageState createState() => _SetReminderPageState();
}

class _SetReminderPageState extends State<SetReminderPage> {
  List<Map<String, String>> reminders = [];

  void _navigateAndDisplaySelection(BuildContext context) async {
    final result = await Navigator.pushNamed(context, '/add_reminder');

    if (result != null && result is Map<String, String>) {
      setState(() {
        bool alreadyExists = false;
        int index = 0;

        for (int i = 0; i < reminders.length; i++) {
          if (reminders[i]['date'] == result['date'] &&
              reminders[i]['time'] == result['time']) {
            alreadyExists = true;
            index = i;
            break;
          }
        }

        if (alreadyExists) {
          // Show dialog to confirm replacing the reminder
          showDialog(
            context: context,
            builder: (BuildContext context) {
              return AlertDialog(
                title: Text('Replace Reminder?'),
                content: Text(
                    'This reminder already exists. Do you want to replace it?'),
                actions: <Widget>[
                  TextButton(
                    onPressed: () {
                      // Replace the reminder
                      setState(() {
                        reminders[index] = result;
                      });
                      Navigator.of(context).pop(); // Close the dialog
                    },
                    child: Text('Yes'),
                  ),
                  TextButton(
                    onPressed: () {
                      Navigator.of(context).pop(); // Close the dialog
                    },
                    child: Text('No'),
                  ),
                ],
              );
            },
          );
        } else {
          reminders.add(result);
        }
      });
    }
  }

  void _removeReminder(int index) {
    setState(() {
      reminders.removeAt(index);
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color.fromARGB(255, 255, 235, 224),
      appBar: AppBar(
        backgroundColor: Color.fromRGBO(241, 145, 86, 0.7),
        title: Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Image.asset(
              "image/UMK_logo.png",
              height: 60,
            ),
            SizedBox(width: 10),
            Expanded(
              child: Text(
                "REMINDER",
                style: TextStyle(fontSize: 22, fontWeight: FontWeight.bold),
              ),
            ),
            Opacity(
              opacity:
                  0, // Makes the invisible container to balance the logo on the left
              child: Image.asset(
                "image/UMK_logo.png",
                height: 60,
              ),
            ),
          ],
        ),
        centerTitle: true,
      ),
      body: SingleChildScrollView(
        child: Column(
          children: [
            Container(
              height: 200,
              width: double.infinity,
              child: Image.asset(
                'image/calendar.jpg',
                fit: BoxFit.cover,
              ),
            ),
            Padding(
              padding: const EdgeInsets.all(16.0),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  SizedBox(height: 20),
                  Text(
                    'Your Reminder:',
                    style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
                  ),
                  SizedBox(height: 10),
                  Container(
                    padding: EdgeInsets.all(16),
                    decoration: BoxDecoration(
                      color: Colors.white,
                      borderRadius: BorderRadius.circular(10),
                      border: Border.all(
                        color: Colors.orange,
                        width: 2,
                      ),
                    ),
                    child: reminders.isEmpty
                        ? Text(
                            'No reminders set',
                            style: TextStyle(
                              color: Colors.grey,
                              fontStyle: FontStyle.italic,
                            ),
                          )
                        : Column(
                            children: reminders
                                .asMap()
                                .entries
                                .map((entry) => Column(
                                      children: [
                                        ReminderTile(
                                          date: entry.value['date'] ?? '',
                                          time: entry.value['time'] ?? '',
                                          duration:
                                              entry.value['duration'] ?? '',
                                          onDelete: () =>
                                              _removeReminder(entry.key),
                                        ),
                                        SizedBox(
                                            height:
                                                10), // Add spacing between reminders
                                      ],
                                    ))
                                .toList(),
                          ),
                  ),
                  SizedBox(height: 20),
                  ElevatedButton(
                    onPressed: () {
                      _navigateAndDisplaySelection(context);
                    },
                    style: ElevatedButton.styleFrom(
                      backgroundColor: Colors.orange,
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(10),
                      ),
                    ),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Icon(Icons.add),
                        SizedBox(width: 10),
                        Text('Add Reminder'),
                      ],
                    ),
                  ),
                  SizedBox(height: 10),
                  TextButton(
                    onPressed: () {
                      setState(() {
                        reminders.clear();
                      });
                    },
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Icon(Icons.delete, color: Colors.red),
                        SizedBox(width: 10),
                        Text('Remove All Reminders',
                            style: TextStyle(color: Colors.red)),
                      ],
                    ),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
