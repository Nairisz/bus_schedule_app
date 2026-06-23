import 'package:flutter/material.dart';

class AddReminderScreen extends StatefulWidget {
  @override
  _AddReminderScreenState createState() => _AddReminderScreenState();
}

class _AddReminderScreenState extends State<AddReminderScreen> {
  String selectedLocation = 'Kemumin';
  String selectedDate = 'Today';
  String selectedTime = '5 Minutes';
  List<String> selectedSlots = [];

  List<String> timeSlotsKemumin = [
    '07.20AM',
    '07.40AM',
    '08.20AM',
    '09.00AM',
    '10.20AM',
    '11.10AM',
    '12.00AM',
    '12.40PM',
    '14.00PM',
    '14.40PM',
    '15.20PM',
    '16.00PM',
    '17.20PM',
    '18.00PM',
    '18.40PM',
    '20.00PM',
    '24.40PM',
  ];

  List<String> timeSlotsKampusKota = [
    '07.20AM',
    '07.40AM',
    '08.20AM',
    '09.00AM',
    '10.20AM',
    '11.10AM',
    '12.00AM',
    '12.40PM',
    '14.00PM',
    '14.40PM',
    '15.20PM',
    '16.00PM',
    '17.20PM',
    '18.00PM',
    '18.40PM',
    '20.00PM',
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Add Reminder'),
        leading: IconButton(
          icon: Icon(Icons.arrow_back),
          onPressed: () {
            Navigator.pop(context);
          },
        ),
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            DropdownButtonFormField<String>(
              value: selectedLocation,
              items: ['Kemumin', 'Kampus Kota'].map((String value) {
                return DropdownMenuItem<String>(
                  value: value,
                  child: Text(value),
                );
              }).toList(),
              onChanged: (newValue) {
                setState(() {
                  selectedLocation = newValue!;
                });
              },
              decoration: InputDecoration(
                labelText: 'Location',
                filled: true,
                fillColor: Colors.orange[100],
              ),
            ),
            SizedBox(height: 16),
            DropdownButtonFormField<String>(
              value: selectedDate,
              items: ['Today', 'Tomorrow'].map((String value) {
                return DropdownMenuItem<String>(
                  value: value,
                  child: Text(value),
                );
              }).toList(),
              onChanged: (newValue) {
                setState(() {
                  selectedDate = newValue!;
                });
              },
              decoration: InputDecoration(
                labelText: 'Date',
                filled: true,
                fillColor: Colors.orange[100],
              ),
            ),
            SizedBox(height: 16),
            DropdownButtonFormField<String>(
              value: selectedTime,
              items:
                  ['5 Minutes', '10 Minutes', '15 Minutes'].map((String value) {
                return DropdownMenuItem<String>(
                  value: value,
                  child: Text(value),
                );
              }).toList(),
              onChanged: (newValue) {
                setState(() {
                  selectedTime = newValue!;
                });
              },
              decoration: InputDecoration(
                labelText: 'Reminder Time',
                filled: true,
                fillColor: Colors.orange[100],
              ),
            ),
            SizedBox(height: 32),
            Text(
              selectedLocation == 'Kemumin'
                  ? 'KEMUMIN TO KAMPUS KOTA'
                  : 'KAMPUS KOTA TO KEMUMIN',
              style: TextStyle(fontWeight: FontWeight.bold),
            ),
            Expanded(
              child: ListView.builder(
                itemCount: selectedLocation == 'Kemumin'
                    ? timeSlotsKemumin.length
                    : timeSlotsKampusKota.length,
                itemBuilder: (context, index) {
                  final slot = selectedLocation == 'Kemumin'
                      ? timeSlotsKemumin[index]
                      : timeSlotsKampusKota[index];
                  bool isSelected = selectedSlots.contains(slot);
                  return GestureDetector(
                    onTap: () {
                      setState(() {
                        if (isSelected) {
                          selectedSlots.remove(slot);
                        } else {
                          selectedSlots.add(slot);
                        }
                      });
                    },
                    child: Container(
                      margin: EdgeInsets.symmetric(vertical: 4.0),
                      padding: EdgeInsets.all(12.0),
                      decoration: BoxDecoration(
                        color:
                            isSelected ? Colors.lightBlueAccent : Colors.white,
                        border: Border.all(
                          color: Colors.orange,
                          width: 2.0,
                        ),
                        borderRadius: BorderRadius.circular(8.0),
                      ),
                      child: Text(
                        slot,
                        style: TextStyle(
                          color: isSelected ? Colors.white : Colors.black,
                        ),
                      ),
                    ),
                  );
                },
              ),
            ),
            SizedBox(height: 16),
            Text('${selectedSlots.length} Time Slot(s) Selected',
                style: TextStyle(color: Colors.orange)),
            SizedBox(height: 16),
            Center(
              child: ElevatedButton(
                onPressed: () {
                  Navigator.pop(context, {
                    'date': selectedDate,
                    'time': selectedTime,
                    'duration': selectedSlots.isNotEmpty
                        ? selectedSlots.join(', ')
                        : 'No time slot selected',
                  });
                },
                child: Text('Done'),
                style: ElevatedButton.styleFrom(
                  backgroundColor: Colors.orange,
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
