import 'package:flutter/material.dart';

class DestinationDropdown extends StatelessWidget {
  final List<String> suggestions;
  final String selectedDestination;
  final Function(String) onDestinationSelected;

  DestinationDropdown({
    required this.suggestions,
    required this.selectedDestination,
    required this.onDestinationSelected,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.symmetric(vertical: 0, horizontal: 15.0),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(8.0),
        border: Border.all(color: Colors.orange),
      ),
      child: DropdownButtonHideUnderline(
        child: DropdownButton<String>(
          value: selectedDestination == "Select Destination"
              ? null
              : selectedDestination,
          hint: Row(
            children: [
              Icon(Icons.search, color: Colors.orange),
              SizedBox(width: 10),
              Text(
                selectedDestination,
                style: TextStyle(color: Colors.black54, fontSize: 16),
              ),
            ],
          ),
          isExpanded: true,
          icon: Icon(Icons.arrow_drop_down, color: Colors.orange),
          items: suggestions.map((String value) {
            return DropdownMenuItem<String>(
              value: value,
              child: Text(value),
            );
          }).toList(),
          onChanged: (String? newValue) {
            if (newValue != null) {
              onDestinationSelected(newValue);
            }
          },
        ),
      ),
    );
  }
}
