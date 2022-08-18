import 'package:flutter/material.dart';
import 'package:hack_tm/widgets/autocomplete.dart';
import 'package:hack_tm/widgets/maps_widget.dart';
import 'package:http/http.dart' as http;

class MyHomePage extends StatefulWidget {
  const MyHomePage({Key? key}) : super(key: key);

  @override
  _MyHomePageState createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        children: [
          MapsWidget(),
          Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            children: const [
              SizedBox(
                height: 200,
              ),
              AutocompleteBasicUserExample(),
            ],
          ),
        ],
      ),
    );
  }
}
