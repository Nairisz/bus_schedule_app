import 'package:flutter/material.dart';

class ScheduleRow extends StatelessWidget {
  final String time;
  final Color color;

  ScheduleRow({required this.time, this.color = Colors.white});

  @override
  Widget build(BuildContext context) {
    return Container(
      color: color,
      padding: EdgeInsets.symmetric(vertical: 4),
      child: Center(
        child: Text(
          time,
          style: TextStyle(fontSize: 12),
        ),
      ),
    );
  }
}
