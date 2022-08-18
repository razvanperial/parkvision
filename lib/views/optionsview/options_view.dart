// ignore_for_file: must_be_immutable, library_private_types_in_public_api

import 'package:flutter/material.dart';
import '../../cameras/camera_class.dart';
import '../../widgets/map_widget.dart';
import '../../widgets/options_widget.dart';

class OptionsPage extends StatefulWidget {
  CityZone cityZone;
  List<Camera> cameras;

  OptionsPage({Key? key, required this.cityZone, required this.cameras})
      : super(key: key);

  @override
  _OptionsPageState createState() => _OptionsPageState();
}

class _OptionsPageState extends State<OptionsPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
          title: const Padding(
            padding: EdgeInsets.all(20.0),
            child: Center(
              child: Text(
                "Park Vision - TM",
                style: TextStyle(
                  color: Colors.white,
                  fontSize: 20,
                  fontFamily: 'Satoshi',
                ),
              ),
            ),
          ),
          backgroundColor: Colors.orange),
      body: Container(
        decoration: const BoxDecoration(
          image: DecorationImage(
            image: AssetImage("background.png"),
            fit: BoxFit.fill,
          ),
        ),
        child: Center(
          child: Column(children: [
            const SizedBox(height: 40),
            MapWidget(lat: widget.cityZone.lat, lon: widget.cityZone.lon),
            const SizedBox(height: 20),
            const SizedBox(
              width: double.infinity,
              child: Padding(
                padding: EdgeInsets.symmetric(horizontal: 30, vertical: 10),
                child: Center(
                  child: Text(
                    "Nearby Parking Lots",
                    style: TextStyle(
                        color: Colors.white,
                        fontFamily: 'Satoshi',
                        fontSize: 25,
                        fontWeight: FontWeight.bold),
                  ),
                ),
              ),
            ),
            const SizedBox(height: 20),
            OptionsWidget(cameras: widget.cameras),
          ]),
        ),
      ),
    );
  }
}
