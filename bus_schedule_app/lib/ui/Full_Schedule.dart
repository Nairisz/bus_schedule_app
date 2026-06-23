import 'package:flutter/material.dart';

class FullSchedulePage extends StatefulWidget {
  @override
  _FullSchedulePageState createState() => _FullSchedulePageState();
}

class _FullSchedulePageState extends State<FullSchedulePage> {
  String _selectedLocation = 'KEMUMIN';

  final Map<String, List<String>> _schedules = {
    'KEMUMIN': [
      '08.00 AM',
      '08.40 AM',
      '09.40 AM',
      '11.00 AM',
      '11.40 AM',
      '12.20 PM',
      '13.00 AM',
      '14.20 PM',
      '15.00 PM',
      '15.40 PM',
      '17.00 PM',
      '17.40 PM',
      '18.20 PM',
      '19.00 PM',
      '22.20 PM',
      '23.00 PM',
    ],
    'KAMPUS KOTA': [
      '07.20 AM',
      '07.40 AM',
      '08.20 AM',
      '09.00 AM',
      '10.20 AM',
      '11.10 AM',
      '12.00 AM',
      '12.40 PM',
      '14.00 PM',
      '14.40 PM',
      '15.20 PM',
      '16.00 PM',
      '17.20 PM',
      '18.00 PM',
      '18.40 PM',
      '20.00 PM',
      '24.40 PM',
    ],
  };

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
                "FULL SCHEDULE",
                style: TextStyle(fontSize: 22, fontWeight: FontWeight.bold),
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
                'image/bust_stop_1.png', // Replace with your image asset
                fit: BoxFit.cover,
              ),
            ),
            Padding(
              padding: EdgeInsets.symmetric(vertical: 20.0, horizontal: 16.0),
              child: Container(
                decoration: BoxDecoration(
                  color: Colors.white,
                  borderRadius: BorderRadius.circular(8.0),
                  border: Border.all(color: Colors.orange),
                ),
                padding: EdgeInsets.symmetric(horizontal: 12.0),
                child: DropdownButtonHideUnderline(
                  child: DropdownButton<String>(
                    value: _selectedLocation,
                    isExpanded: true,
                    icon: Icon(Icons.arrow_drop_down, color: Colors.orange),
                    items: _schedules.keys.map((String location) {
                      return DropdownMenuItem<String>(
                        value: location,
                        child: Text(
                          location,
                          style: TextStyle(color: Colors.black),
                        ),
                      );
                    }).toList(),
                    onChanged: (newValue) {
                      setState(() {
                        _selectedLocation = newValue!;
                      });
                    },
                  ),
                ),
              ),
            ),
            Container(
              padding: EdgeInsets.all(16.0),
              decoration: BoxDecoration(
                color: Colors.white,
                borderRadius: BorderRadius.circular(8.0),
                border: Border.all(color: Colors.orange),
              ),
              margin: EdgeInsets.symmetric(horizontal: 16.0),
              child: Table(
                border: TableBorder.all(color: Colors.black),
                children: [
                  TableRow(children: [
                    TableCell(
                      child: Padding(
                        padding: EdgeInsets.all(8.0),
                        child: Text(
                          _selectedLocation == 'KAMPUS KOTA'
                              ? 'KEMUMIN TO KAMPUS KOTA '
                              : ' KAMPUS KOTA TO $_selectedLocation',
                          style: TextStyle(fontWeight: FontWeight.bold),
                        ),
                      ),
                    ),
                  ]),
                  ..._buildScheduleRows(_schedules[_selectedLocation]!),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }

  List<TableRow> _buildScheduleRows(List<String> times) {
    List<TableRow> rows = [];

    for (String time in times) {
      rows.add(
        TableRow(children: [
          TableCell(
            child: Padding(
              padding: EdgeInsets.all(8.0),
              child: Text(time),
            ),
          ),
        ]),
      );
    }

    return rows;
  }
}
