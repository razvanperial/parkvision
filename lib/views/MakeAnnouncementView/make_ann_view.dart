// ignore_for_file: unnecessary_new, unused_local_variable, must_be_immutable

import 'package:flutter/material.dart';
import 'package:hack_tm/lists/peer2peerInfoList.dart';
import 'package:hack_tm/views/MakeAnnouncementView/zones_class.dart';
import 'package:hack_tm/views/homeview/home_view.dart';

String selectedValue = '';
int id = 0;
late DateTime date;

class DropdownHours extends StatefulWidget {
  const DropdownHours({Key? key}) : super(key: key);

  @override
  State<DropdownHours> createState() => _DropdownHoursState();
}

class _DropdownHoursState extends State<DropdownHours> {
  String dropdownValue = 'Select in how many hours you will leave';

  @override
  Widget build(BuildContext context) {
    return DecoratedBox(
      decoration: const BoxDecoration(
        color: Colors.white70,
      ),
      child: DropdownButton<String>(
        value: dropdownValue,
        isExpanded: true,
        elevation: 16,
        style: const TextStyle(color: Colors.black),
        focusColor: Colors.white,
        underline: Container(
          height: 2,
          color: Colors.orange,
        ),
        onChanged: (String? newValue) {
          selectedValue = newValue!;
          setState(() {
            dropdownValue = newValue;
          });
        },
        items: <String>[
          'Select in how many hours you will leave',
          'One Hour',
          'Two Hours',
          'Three Hours',
          'Four Hours',
          'Five Hours',
          'Six Hours',
          'Seven Hours',
          'Eight Hours'
        ].map<DropdownMenuItem<String>>((String value) {
          return DropdownMenuItem<String>(
            value: value,
            child: Center(
                child: Text(
              value,
              style: TextStyle(fontSize: 20),
            )),
          );
        }).toList(),
      ),
    );
  }
}

class MakeAnnouncementView extends StatelessWidget {
  const MakeAnnouncementView({Key? key}) : super(key: key);

  static final List<Zone> _zoneOptions = <Zone>[
    Zone(
      zoneName: 'Hotel Central',
      zoneAddress: 'hotel central',
      cameraID: 0,
    ),
    Zone(
      zoneName: 'Orange Shop',
      zoneAddress: 'orange shop',
      cameraID: 1,
    ),
    Zone(
        zoneName: 'Carturesti Operei',
        zoneAddress: 'carturesti operei',
        cameraID: 2),
    Zone(
        zoneName: 'Experimentarium TM',
        zoneAddress: 'experimentarium tm',
        cameraID: 3),
    Zone(
      zoneName: 'Neuronic Trade',
      zoneAddress: 'neuronic trade',
      cameraID: 4,
    ),
    Zone(
      zoneName: 'Garage Cafe',
      zoneAddress: 'garage cafe',
      cameraID: 5,
    ),
    Zone(
      zoneName: 'Yugoplenat',
      zoneAddress: 'yugoplenat',
      cameraID: 6,
    ),
    Zone(
      zoneName: 'Drunken Rat',
      zoneAddress: 'drunken rat',
      cameraID: 7,
    ),
    Zone(
      zoneName: 'Little Hanoi',
      zoneAddress: 'little hanoi',
      cameraID: 8,
    ),
    Zone(
      zoneName: 'Bistro 700',
      zoneAddress: 'bistro 700',
      cameraID: 9,
    ),
    Zone(
      zoneName: 'Parcul Central',
      zoneAddress: 'parcul central',
      cameraID: 10,
    ),
    Zone(
      zoneName: 'HackTM',
      zoneAddress: 'hacktm',
      cameraID: 11,
    ),
  ];

  String _displayStringForOption(Zone option) => option.zoneAddress;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Center(
          child: Text(
            'Make an Announcement',
            style: TextStyle(color: Colors.white),
          ),
        ),
      ),
      body: Container(
        decoration: const BoxDecoration(
          image: DecorationImage(
            image: AssetImage("background.png"),
            fit: BoxFit.fill,
          ),
        ),
        child: Center(
          child: Column(
            children: [
              const SizedBox(height: 50),
              Card(
                shape: RoundedRectangleBorder(
                    side: const BorderSide(color: Colors.orange, width: 2.0),
                    borderRadius: BorderRadius.circular(4.0)),
                color: Colors.white60,
                child: const Padding(
                  padding: EdgeInsets.all(20.0),
                  child: Text(
                    'Help a Peer Out!\n Select the zone you are parked in and the time of departure.',
                    textAlign: TextAlign.center,
                    style: TextStyle(
                      color: Colors.black,
                      fontWeight: FontWeight.w200,
                      fontSize: 20,
                    ),
                  ),
                ),
              ),
              SizedBox(height: 50),
              MouseRegion(
                cursor: SystemMouseCursors.text,
                child: Container(
                  color: Colors.white38,
                  child: Autocomplete<Zone>(
                    displayStringForOption: _displayStringForOption,
                    initialValue: const TextEditingValue(
                        text: 'Enter the place your car is parked in'),
                    optionsBuilder: (TextEditingValue textEditingValue) {
                      if (textEditingValue.text == '') {
                        return const Iterable<Zone>.empty();
                      }
                      return _zoneOptions.where((Zone option) {
                        return option
                            .toString()
                            .contains(textEditingValue.text.toLowerCase());
                      });
                    },
                    onSelected: (Zone selection) {
                      id = selection.cameraID;
                      debugPrint(
                          'You just selected ${_displayStringForOption(selection)}');
                    },
                  ),
                ),
              ),
              const SizedBox(
                height: 50,
              ),
              const DropdownHours(),
              const SizedBox(
                height: 50,
              ),
              submitHour(
                route: const MyHomePage(),
                title: 'Submit',
              ),
            ],
          ),
        ),
      ),
    );
  }
}

class submitHour extends StatelessWidget {
  String title;
  Widget route;
  submitHour({Key? key, this.title = '', required this.route})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: MouseRegion(
        cursor: SystemMouseCursors.click,
        child: GestureDetector(
          onTap: () {
            switch (selectedValue) {
              case 'One Hour':
                Duration duration = new Duration(hours: 1);
                date = DateTime.now().add(duration);
                InfoList[id].add(date);
                break;
              case 'Two Hours':
                Duration duration = new Duration(hours: 2);
                date = DateTime.now().add(duration);
                InfoList[id].add(date);
                break;
              case 'Three Hours':
                Duration duration = new Duration(hours: 3);
                date = DateTime.now().add(duration);
                InfoList[id].add(date);
                break;
              case 'Four Hours':
                Duration duration = new Duration(hours: 4);
                date = DateTime.now().add(duration);
                InfoList[id].add(date);
                break;
              case 'Five Hours':
                Duration duration = new Duration(hours: 5);
                date = DateTime.now().add(duration);
                InfoList[id].add(date);
                break;
              case 'Six Hours':
                Duration duration = new Duration(hours: 6);
                date = DateTime.now().add(duration);
                InfoList[id].add(date);
                break;
              case 'Seven Hours':
                Duration duration = new Duration(hours: 7);
                date = DateTime.now().add(duration);
                InfoList[id].add(date);
                break;
              case 'Eight Hours':
                Duration duration = new Duration(hours: 8);
                date = DateTime.now().add(duration);
                InfoList[id].add(date);
                break;
              default:
            }
            if (selectedValue == '')
              return;
            else {
              Navigator.of(context).push(
                MaterialPageRoute(builder: (context) => route),
              );
            }
          },
          child: Container(
            height: 50,
            width: 200,
            decoration: BoxDecoration(
              color: Colors.orange,
              borderRadius: BorderRadius.circular(20),
            ),
            child: Center(
              child: Text(
                textAlign: TextAlign.center,
                title,
                style: const TextStyle(
                  fontSize: 18,
                  color: Colors.white,
                ),
              ),
            ),
          ),
        ),
      ),
    );
  }
}
