// ignore_for_file: must_be_immutable, library_private_types_in_public_api, prefer_typing_uninitialized_variables, sized_box_for_whitespace

import 'package:flutter/material.dart';
import 'dart:convert';
import 'package:http/http.dart' as http;

class ParkingSlotsInfo extends StatefulWidget {
  late String cameraLocation;
  late int cameraID;

  ParkingSlotsInfo(
      {Key? key, required this.cameraLocation, required this.cameraID})
      : super(key: key);

  @override
  _ParkingSlotsInfoState createState() => _ParkingSlotsInfoState();
}

class _ParkingSlotsInfoState extends State<ParkingSlotsInfo> {
  String cameraInfo = "loading information...";
  Map? responseMap;
  late List cameraInfos;
  late var totalSlots;
  late var probability;
  late var availableSlots;

  @override
  void initState() {
    super.initState();
    cameraInfos = [];
    fetchCameraInfos();
    availableSlots = '';
    totalSlots = '';
    probability = '';
  }

  Future<void> fetchCameraInfos() async {
    var url = Uri.parse("http://10.10.10.175:8000/camera_data");
    String myString = 'dummy0';
    List cameraInfos = [];
    http.Response response = await http.get(url);
    responseMap = jsonDecode(response.body);
    setState(() {
      if (!mounted) return;
      for (int i = 0; i < 12; i++) {
        myString = myString.substring(0, 5);
        myString = myString + i.toString();
        cameraInfos.add(responseMap!['data'][myString]);
      }
      cameraInfo =
          cameraInfos[widget.cameraID]["percentage_occupation"].toString();
      availableSlots =
          cameraInfos[widget.cameraID]["available_spaces"].toString();
      totalSlots = cameraInfos[widget.cameraID]["num_of_places"].toString();
      probability = cameraInfos[widget.cameraID]["likelyhood"].toString();
    });
  }

  @override
  Widget build(BuildContext context) {
    String cameraLocation = widget.cameraLocation;
    return Container(
      height: 190,
      child: Row(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Container(
            width: 350,
            padding: EdgeInsets.symmetric(horizontal: 15.0, vertical: 25.0),
            decoration: const BoxDecoration(
              color: Colors.orange,
              borderRadius: BorderRadius.all(
                Radius.circular(20),
              ),
            ),
            child: Column(
              children: [
                const SizedBox(height: 10),
                Text(
                  textAlign: TextAlign.center,
                  "Camera on location: $cameraLocation\n",
                  style: const TextStyle(
                    fontFamily: "Satoshi",
                    fontWeight: FontWeight.w300,
                    fontSize: 22,
                    color: Colors.white,
                  ),
                ),
                const SizedBox(height: 10),
                Text(
                  "Available slots: $availableSlots out of $totalSlots",
                  style: const TextStyle(
                    fontFamily: "Satoshi",
                    fontWeight: FontWeight.w400,
                    fontSize: 20,
                    color: Colors.white,
                  ),
                ),
              ],
            ),
          ),
          const SizedBox(width: 300),
          Container(
            width: 350,
            padding: EdgeInsets.symmetric(horizontal: 15.0, vertical: 25.0),
            decoration: const BoxDecoration(
              color: Colors.orange,
              borderRadius: BorderRadius.all(
                Radius.circular(20),
              ),
            ),
            child: Column(
              children: [
                const SizedBox(
                  height: 10,
                ),
                const Center(
                  child: Text(
                    "Chances of parking lot getting\noccupied in the next 15 minutes:\n",
                    textAlign: TextAlign.center,
                    style: TextStyle(
                      fontFamily: "Satoshi",
                      fontWeight: FontWeight.w400,
                      fontSize: 22,
                      color: Colors.white,
                    ),
                  ),
                ),
                Text(
                  "$probability%",
                  style: const TextStyle(
                    fontFamily: "Satoshi",
                    fontWeight: FontWeight.w500,
                    fontSize: 20,
                    color: Colors.white,
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
