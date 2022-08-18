import 'package:flutter/material.dart';

class DropdownHours extends StatefulWidget {
  const DropdownHours({Key? key}) : super(key: key);

  @override
  State<DropdownHours> createState() => _DropdownHoursState();
}

class _DropdownHoursState extends State<DropdownHours> {
  String dropdownValue = 'One Hour';

  @override
  Widget build(BuildContext context) {
    return DropdownButton<String>(
      value: dropdownValue,
      icon: const Icon(Icons.arrow_downward),
      elevation: 16,
      style: const TextStyle(color: Colors.deepPurple),
      underline: Container(
        height: 2,
        color: Colors.deepPurpleAccent,
      ),
      onChanged: (String? newValue) {
        print(newValue);
        setState(() {
          dropdownValue = newValue!;
        });
      },
      items: <String>[
        'One Hour',
        'Two Hours',
        'Three Hours',
        'Four Hours',
        'Five Hour',
        'Six Hours',
        'Seven Hours',
        'Eight Hours'
      ].map<DropdownMenuItem<String>>((String value) {
        return DropdownMenuItem<String>(
          value: value,
          child: Text(value),
        );
      }).toList(),
    );
  }
}
