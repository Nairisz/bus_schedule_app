import 'package:flutter/material.dart';

class ReminderTile extends StatelessWidget {
  final String date;
  final String time;
  final String duration;
  final VoidCallback onDelete;

  const ReminderTile({
    required this.date,
    required this.time,
    required this.duration,
    required this.onDelete,
  });

  @override
  Widget build(BuildContext context) {
    List<String> durationList =
        duration.split(' '); // Split the duration by space

    return Container(
      margin: EdgeInsets.symmetric(vertical: 4),
      padding: EdgeInsets.all(8),
      decoration: BoxDecoration(
        color: Colors.orange.shade100,
        borderRadius: BorderRadius.circular(5),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text(
                'Date: $date',
                style: TextStyle(fontSize: 16),
              ),
              IconButton(
                icon: Icon(
                  Icons.delete,
                  color: Colors.red,
                ),
                onPressed: onDelete,
              ),
            ],
          ),
          Text(
            'Time: $time',
            style: TextStyle(fontSize: 16),
          ),
          Text(
            'Duration:',
            style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold),
          ),
          SizedBox(height: 5),
          Container(
            height: 50, // Set a fixed height for the scrollable container
            child: ListView(
              scrollDirection:
                  Axis.horizontal, // Set scrolling direction to horizontal
              children: [
                for (String item in durationList)
                  Container(
                    padding: EdgeInsets.symmetric(horizontal: 8, vertical: 4),
                    margin: EdgeInsets.only(right: 8),
                    decoration: BoxDecoration(
                      color: Colors.white,
                      borderRadius: BorderRadius.circular(5),
                    ),
                    child: Text(
                      item,
                      style: TextStyle(fontSize: 16),
                    ),
                  ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
