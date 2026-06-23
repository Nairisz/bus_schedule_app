import 'package:flutter/material.dart';
import 'package:bus_schedule_app/ui/SheduleRow.dart';
import 'package:intl/intl.dart';

class SearchResultPage extends StatefulWidget {
  final String query;

  SearchResultPage({required this.query});

  @override
  _SearchResultPageState createState() => _SearchResultPageState();
}

class _SearchResultPageState extends State<SearchResultPage> {
  DateTime selectedDate = DateTime.now();
  final dateFormat = DateFormat('yyyy-MM-dd');
  String query = '';
  final TextEditingController _controller = TextEditingController();
  final List<String> destinations = ['Kemumin', 'Kampus Kota'];

  final List<Widget> KampusKotaTokemuminSchedule = [
    ScheduleRow(time: '8.00 AM'),
    Divider(),
    ScheduleRow(time: '8.40 AM'),
    Divider(),
    ScheduleRow(time: '9.40 AM'),
    Divider(),
    ScheduleRow(time: '11.00 AM'),
    Divider(),
    ScheduleRow(time: '11.50 AM', color: Colors.yellow),
    Divider(),
    ScheduleRow(time: '12.20 AM', color: Colors.red),
    Divider(),
    ScheduleRow(time: '13.00 PM'),
    Divider(),
    ScheduleRow(time: '', color: Colors.grey),
    Divider(),
    ScheduleRow(time: '14.20 PM'),
    Divider(),
    ScheduleRow(time: '15.00 PM'),
    Divider(),
    ScheduleRow(time: '15.40 PM'),
    Divider(),
    ScheduleRow(time: '17.10 PM', color: Colors.yellow),
    Divider(),
    ScheduleRow(time: '17.40 PM'),
    Divider(),
    ScheduleRow(time: '18.25 PM', color: Colors.yellow),
    Divider(),
    ScheduleRow(time: '19.00 PM'),
    Divider(),
    ScheduleRow(time: '', color: Colors.grey),
    Divider(),
    ScheduleRow(time: '22.20 PM'),
    Divider(),
    ScheduleRow(time: '23.00 PM'),
  ];

  final List<Widget> KemuminTokampusKotaSchedule = [
    ScheduleRow(time: '7.20 AM'),
    Divider(),
    ScheduleRow(time: '7.40 AM'),
    Divider(),
    ScheduleRow(time: '8.20 AM'),
    Divider(),
    ScheduleRow(time: '', color: Colors.grey),
    Divider(),
    ScheduleRow(time: '9.00 AM'),
    Divider(),
    ScheduleRow(time: '10.40 AM', color: Colors.yellow),
    Divider(),
    ScheduleRow(time: '11.10 AM'),
    Divider(),
    ScheduleRow(time: '12.00 PM'),
    Divider(),
    ScheduleRow(time: '12.40 PM'),
    Divider(),
    ScheduleRow(time: '', color: Colors.grey),
    Divider(),
    ScheduleRow(time: '14.00 PM'),
    Divider(),
    ScheduleRow(time: '14.40 PM'),
    Divider(),
    ScheduleRow(time: '15.20 PM', color: Colors.yellow),
    Divider(),
    ScheduleRow(time: '16.00 PM'),
    Divider(),
    ScheduleRow(time: '17.20 PM', color: Colors.yellow),
    Divider(),
    ScheduleRow(time: '18.00 PM'),
    Divider(),
    ScheduleRow(time: '18.40 PM'),
    Divider(),
    ScheduleRow(time: '', color: Colors.grey),
    Divider(),
    ScheduleRow(time: '20.00 PM'),
    Divider(),
    ScheduleRow(time: '22.40 PM', color: Colors.red),
  ];

  // New schedules for tomorrow and future dates
  final List<Widget> KampusKotaTokemuminScheduleTomorrow = [
    ScheduleRow(time: '8.00 AM'),
    Divider(),
    ScheduleRow(time: '8.40 AM'),
    Divider(),
    ScheduleRow(time: '9.40 AM'),
    Divider(),
    ScheduleRow(time: '11.00 AM'),
    Divider(),
    ScheduleRow(time: '11.40 AM'),
    Divider(),
    ScheduleRow(time: '12.20 AM'),
    Divider(),
    ScheduleRow(time: '13.00 PM'),
    Divider(),
    ScheduleRow(time: '', color: Colors.grey),
    Divider(),
    ScheduleRow(time: '14.20 PM'),
    Divider(),
    ScheduleRow(time: '15.00 PM'),
    Divider(),
    ScheduleRow(time: '15.40 PM'),
    Divider(),
    ScheduleRow(time: '17.00 PM'),
    Divider(),
    ScheduleRow(time: '17.40 PM'),
    Divider(),
    ScheduleRow(time: '18.20 PM'),
    Divider(),
    ScheduleRow(time: '19.00 PM'),
    Divider(),
    ScheduleRow(time: '', color: Colors.grey),
    Divider(),
    ScheduleRow(time: '22.20 PM'),
    Divider(),
    ScheduleRow(
        time: '23.00 PM'), // Added new schedule for tomorrow and future dates
  ];

  final List<Widget> KemuminTokampusKotaScheduleTomorrow = [
    ScheduleRow(time: '7.20 AM'),
    Divider(),
    ScheduleRow(time: '7.40 AM'),
    Divider(),
    ScheduleRow(time: '8.20 AM'),
    Divider(),
    ScheduleRow(time: '', color: Colors.grey),
    Divider(),
    ScheduleRow(time: '9.00 AM'),
    Divider(),
    ScheduleRow(time: '10.40 AM'),
    Divider(),
    ScheduleRow(time: '11.10 AM'),
    Divider(),
    ScheduleRow(time: '12.00 PM'),
    Divider(),
    ScheduleRow(time: '12.40 PM'),
    Divider(),
    ScheduleRow(time: '', color: Colors.grey),
    Divider(),
    ScheduleRow(time: '14.00 PM'),
    Divider(),
    ScheduleRow(time: '14.40 PM'),
    Divider(),
    ScheduleRow(time: '15.20 PM'),
    Divider(),
    ScheduleRow(time: '16.00 PM'),
    Divider(),
    ScheduleRow(time: '17.20 PM'),
    Divider(),
    ScheduleRow(time: '18.00 PM'),
    Divider(),
    ScheduleRow(time: '18.40 PM'),
    Divider(),
    ScheduleRow(time: '', color: Colors.grey),
    Divider(),
    ScheduleRow(time: '20.00 PM'),
    Divider(),
    ScheduleRow(time: '22.40 PM', color: Colors.red),
  ];

  Future<void> _selectDate(BuildContext context) async {
    final DateTime? pickedDate = await showDatePicker(
      context: context,
      initialDate: selectedDate,
      firstDate: DateTime(2000),
      lastDate: DateTime(2101),
    );
    if (pickedDate != null && pickedDate != selectedDate) {
      setState(() {
        selectedDate = pickedDate;
      });
    }
  }

  @override
  void initState() {
    super.initState();
    query = widget.query;
    _controller.text = query;
  }

  @override
  Widget build(BuildContext context) {
    List<Widget> scheduleRows = _getScheduleRows(query.toLowerCase());

    return Scaffold(
      backgroundColor: Color.fromARGB(255, 255, 235, 224),
      appBar: AppBar(
        backgroundColor: Color.fromRGBO(241, 145, 86, 0.7),
        leading: IconButton(
          icon: Icon(Icons.arrow_back, color: Colors.black),
          onPressed: () {
            Navigator.of(context).pop();
          },
        ),
        title: Row(
          children: [
            Image.asset(
              "image/UMK_logo.png",
              height: 60,
            ),
            SizedBox(width: 10),
            Text(
              "CURRENT SCHEDULE",
              style: TextStyle(fontSize: 22, fontWeight: FontWeight.bold),
            ),
          ],
        ),
      ),
      body: SingleChildScrollView(
        padding: const EdgeInsets.all(8.0),
        child: Column(
          children: [
            Row(
              children: [
                Expanded(
                  child: DropdownButtonFormField<String>(
                    value: destinations.contains(query) ? query : null,
                    decoration: InputDecoration(
                      labelText: 'Search Destination',
                      border: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(30),
                      ),
                      filled: true,
                      fillColor: Colors.white,
                    ),
                    items: destinations.map((String destination) {
                      return DropdownMenuItem<String>(
                        value: destination,
                        child: Text(destination),
                      );
                    }).toList(),
                    onChanged: (value) {
                      setState(() {
                        query = value ?? '';
                        scheduleRows = _getScheduleRows(query.toLowerCase());
                      });
                    },
                  ),
                ),
                SizedBox(width: 8),
                Expanded(
                  child: InkWell(
                    onTap: () => _selectDate(context),
                    child: InputDecorator(
                      decoration: InputDecoration(
                        labelText: 'Date',
                        border: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(30),
                        ),
                        filled: true,
                        fillColor: Colors.white,
                      ),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Text(dateFormat.format(selectedDate)),
                          Icon(Icons.calendar_today),
                        ],
                      ),
                    ),
                  ),
                ),
              ],
            ),
            SizedBox(height: 8),
            query.toLowerCase() == 'kemumin' ||
                    query.toLowerCase() == 'kampus kota'
                ? _buildScheduleBox(
                    query.toLowerCase() == 'kemumin'
                        ? 'KAMPUS KOTA TO KEMUMIN'
                        : 'KEMUMIN TO KAMPUS KOTA',
                    scheduleRows)
                : Container(),
            SizedBox(height: 8),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Container(
                  width: 12,
                  height: 12,
                  color: Colors.yellow,
                ),
                SizedBox(width: 4),
                Text(
                  'changes schedule',
                  style: TextStyle(fontSize: 12),
                ),
              ],
            ),
            SizedBox(height: 8),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Container(
                  width: 12,
                  height: 12,
                  color: Colors.red,
                ),
                SizedBox(width: 4),
                Text(
                  'No bus',
                  style: TextStyle(fontSize: 12),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }

  List<Widget> _getScheduleRows(String query) {
    if (query == 'kemumin') {
      if (selectedDate.isAfter(DateTime.now())) {
        return KampusKotaTokemuminScheduleTomorrow;
      }
      return KampusKotaTokemuminSchedule;
    } else if (query == 'kampus kota') {
      if (selectedDate.isAfter(DateTime.now())) {
        return KemuminTokampusKotaScheduleTomorrow;
      }
      return KemuminTokampusKotaSchedule;
    } else {
      return [];
    }
  }

  Widget _buildScheduleBox(String title, List<Widget> scheduleRows) {
    return Container(
      width: MediaQuery.of(context).size.width * 0.9,
      height: 400, // Increased the height
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(8),
        boxShadow: [
          BoxShadow(
            color: Colors.grey.withOpacity(0.5),
            spreadRadius: 2,
            blurRadius: 4,
            offset: Offset(0, 3),
          ),
        ],
      ),
      child: Column(
        children: [
          Container(
            padding: EdgeInsets.all(8),
            child: Text(
              title,
              style: TextStyle(fontWeight: FontWeight.bold),
            ),
          ),
          Divider(),
          Expanded(
            child: ListView(
              children: scheduleRows,
            ),
          ),
        ],
      ),
    );
  }
}
