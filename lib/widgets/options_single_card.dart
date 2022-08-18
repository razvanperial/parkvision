// ignore_for_file: library_private_types_in_public_api, sort_child_properties_last, must_be_immutable

import 'package:flutter/material.dart';
import 'dart:convert';
import 'package:http/http.dart' as http;
import '../views/available_slots_view/available_slots_view.dart';

class OptionsSingleCard extends StatefulWidget {
  late String locationName;
  late String locationAddress;
  late int cameraID;

  OptionsSingleCard(
      {Key? key,
      required this.locationName,
      required this.locationAddress,
      required this.cameraID})
      : super(key: key);

  @override
  _OptionsSingleCardState createState() => _OptionsSingleCardState();
}

class _OptionsSingleCardState extends State<OptionsSingleCard> {
  String cameraInfo = "loading information...";
  Map? responseMap;
  late List cameraInfos;

  @override
  void initState() {
    super.initState();
    cameraInfos = [];
    fetchCameraInfos();
  }

  Future<void> fetchCameraInfos() async {
    var url = Uri.parse("http://10.10.10.175:8000/camera_data");
    String myString = 'dummy0';
    List cameraInfos = [];
    http.Response response = await http.get(url);
    responseMap = jsonDecode(response.body);
    setState(() {
      if (!mounted) return;
      for (int i = 0; i < 13; i++) {
        myString = myString.substring(0, 5);
        myString = myString + i.toString();
        cameraInfos.add(responseMap!['data'][myString]);
        responseMap!['data'][myString];
      }
      cameraInfo =
          cameraInfos[widget.cameraID]["percentage_occupation"].toString();
    });
  }

  @override
  Widget build(BuildContext context) {
    String locationName = widget.locationName;
    String locationAddress = widget.locationAddress;
    int cameraID = widget.cameraID;
    cameraInfo = cameraInfo;
    return MouseRegion(
      cursor: SystemMouseCursors.click,
      child: GestureDetector(
        onTap: () {
          Navigator.of(context).push(
            MaterialPageRoute(
              builder: (context) => AvailableSlotsPage(
                cameraID: cameraID,
                cameraLocation: locationName,
              ),
            ),
          );
        },
        child: Card(
          color: Colors.orange,
          elevation: 5,
          semanticContainer: true,
          clipBehavior: Clip.antiAliasWithSaveLayer,
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(20.0),
          ),
          child: SizedBox(
            height: 166,
            child: Container(
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(15.0),
              ),
              child: Center(
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceAround,
                  children: [
                    Padding(
                      padding: const EdgeInsets.symmetric(vertical: 50.0),
                      child: Column(
                        children: [
                          Text(
                            '$locationName camera',
                            textAlign: TextAlign.center,
                            style: const TextStyle(
                                color: Colors.white,
                                fontWeight: FontWeight.w500,
                                fontSize: 20,
                                fontFamily: 'Satoshi'),
                          ),
                          const SizedBox(height: 20),
                          Text(
                            'located at: $locationAddress',
                            textAlign: TextAlign.center,
                            style: const TextStyle(
                                color: Colors.white,
                                fontWeight: FontWeight.w300,
                                fontSize: 16,
                                fontFamily: 'Satoshi'),
                          ),
                        ],
                      ),
                    ),
                    Padding(
                      padding: const EdgeInsets.symmetric(vertical: 50.0),
                      child: Column(children: [
                        const Text(
                          'Current overall situation:',
                          textAlign: TextAlign.center,
                          style: TextStyle(
                              color: Colors.white,
                              fontWeight: FontWeight.w400,
                              fontSize: 20,
                              fontFamily: 'Satoshi'),
                        ),
                        const SizedBox(height: 5),
                        Text(
                          '$cameraInfo% of the parking lot \nis occupied.',
                          textAlign: TextAlign.center,
                          style: const TextStyle(
                              color: Colors.white,
                              fontWeight: FontWeight.w400,
                              fontSize: 16,
                              fontFamily: 'Satoshi'),
                        ),
                      ]),
                    ),
                  ],
                ),
              ),
            ),
          ),
          margin: const EdgeInsets.only(left: 45.0, right: 45.0, bottom: 30.0),
        ),
      ),
    );
  }
}
