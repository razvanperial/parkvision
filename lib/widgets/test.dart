import 'dart:convert';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;

String myString = 'dummy0';

class ForecastPage extends StatefulWidget {
  final String date;

  const ForecastPage({Key? key, required this.date}) : super(key: key);

  @override
  State<ForecastPage> createState() => _ForecastPageState();
}

class _ForecastPageState extends State<ForecastPage> {
  Map? responseMap;
  int lat = 5;
  int lon = 5;
  String date = '';

  @override
  void initState() {
    super.initState();
    fetchForecast();
  }

  Future<void> fetchForecast() async {
    List mylist = [];
    http.Response response =
        await http.get(Uri.parse('http://10.10.10.175:8000/camera_data'));
    var responseMap = jsonDecode(response.body);
    for (int i = 0; i < 12; i++) {
      myString = myString.substring(0, 5);
      myString = myString + i.toString();
      mylist.add(responseMap!['data'][myString]);
    }
    print(mylist[0]['num_of_places']);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold();
  }
}
