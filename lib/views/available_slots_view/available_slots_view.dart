// ignore_for_file: must_be_immutable, library_private_types_in_public_api

import 'package:flutter/material.dart';

import '../../lists/peer2peer_info.dart';
import '../../widgets/available_slots_info.dart';

class AvailableSlotsPage extends StatefulWidget {
  int cameraID;
  String cameraLocation;
  AvailableSlotsPage(
      {Key? key, required this.cameraID, required this.cameraLocation})
      : super(key: key);

  @override
  _AvailableSlotsPageState createState() => _AvailableSlotsPageState();
}

class _AvailableSlotsPageState extends State<AvailableSlotsPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Center(
          child: Text(
            "Park Vision TM",
            style: TextStyle(color: Colors.white),
          ),
        ),
        backgroundColor: Colors.orange,
      ),
      body: Stack(
        children: [
          Container(
            decoration: const BoxDecoration(
              image: DecorationImage(
                image: AssetImage("assets/background.png"),
                fit: BoxFit.fill,
              ),
            ),
          ),
          Center(
            child: Column(children: [
              const SizedBox(height: 80),
              ParkingSlotsInfo(
                cameraLocation: widget.cameraLocation,
                cameraID: widget.cameraID,
              ),
              const SizedBox(height: 53),
              const Text(
                '*Notifications from Peer drivers',
                style: TextStyle(
                    fontWeight: FontWeight.w600,
                    fontSize: 20,
                    fontFamily: 'Satoshi',
                    color: Colors.white),
              ),
              const SizedBox(height: 15),
              Peer2PeerInfo(
                cameraID: widget.cameraID,
              ),
            ]),
          ),
        ],
      ),
    );
  }
}
