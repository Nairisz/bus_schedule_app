import 'package:flutter/material.dart';

class NotificationPage extends StatelessWidget {
  final List<String> notifications;

  NotificationPage({required this.notifications});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color.fromARGB(255, 255, 235, 224),
      appBar: AppBar(
        backgroundColor: Color.fromRGBO(241, 145, 86, 0.7),
        title: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Row(
              children: [
                Image.asset(
                  "image/UMK_logo.png",
                  height: 60,
                ),
                SizedBox(width: 10), // Add space between the logo and the text
                Text(
                  "NOTIFICATION",
                  style: TextStyle(fontSize: 25, fontWeight: FontWeight.bold),
                ),
              ],
            ),
          ],
        ),
        centerTitle: true,
      ),
      body: Padding(
        padding: const EdgeInsets.all(8.0),
        child: Column(
          children: [
            Container(
              padding: EdgeInsets.all(16),
              margin: EdgeInsets.symmetric(vertical: 10),
              decoration: BoxDecoration(
                color: Colors.white,
                borderRadius: BorderRadius.circular(10),
                boxShadow: [
                  BoxShadow(
                    color: Colors.orange,
                    blurRadius: 5,
                    spreadRadius: 2,
                  ),
                ],
              ),
              child: Text(
                "Reminder Your bus will arrive 5 minutes!",
                style: TextStyle(fontSize: 18),
              ),
            ),
            Container(
              padding: EdgeInsets.all(16),
              margin: EdgeInsets.symmetric(vertical: 10),
              decoration: BoxDecoration(
                color: Colors.white,
                borderRadius: BorderRadius.circular(10),
                boxShadow: [
                  BoxShadow(
                    color: Colors.orange,
                    blurRadius: 5,
                    spreadRadius: 2,
                  ),
                ],
              ),
              child: Text(
                "The bus schedule kemumin to kampus kota have UPDATED",
                style: TextStyle(fontSize: 18),
              ),
            ),
            Container(
              padding: EdgeInsets.all(16),
              margin: EdgeInsets.symmetric(vertical: 10),
              decoration: BoxDecoration(
                color: Colors.white,
                borderRadius: BorderRadius.circular(10),
                boxShadow: [
                  BoxShadow(
                    color: Colors.orange,
                    blurRadius: 5,
                    spreadRadius: 2,
                  ),
                ],
              ),
              child: Text(
                "Reminder Your bus will arrive 15 minutes!",
                style: TextStyle(fontSize: 18),
              ),
            ),
            Container(
              padding: EdgeInsets.all(16),
              margin: EdgeInsets.symmetric(vertical: 10),
              decoration: BoxDecoration(
                color: Colors.white,
                borderRadius: BorderRadius.circular(10),
                boxShadow: [
                  BoxShadow(
                    color: Colors.orange,
                    blurRadius: 5,
                    spreadRadius: 2,
                  ),
                ],
              ),
              child: Text(
                "The bus schedule Kampus Kota to Kemumin have UPDATED",
                style: TextStyle(fontSize: 18),
              ),
            ),
            Expanded(
              child: ListView.builder(
                itemCount: notifications.length,
                itemBuilder: (context, index) {
                  return Card(
                    child: ListTile(
                      title: Text(
                        notifications[index],
                        style: TextStyle(fontSize: 18),
                      ),
                    ),
                  );
                },
              ),
            ),
          ],
        ),
      ),
    );
  }
}
