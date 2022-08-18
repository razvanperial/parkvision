// ignore_for_file: must_be_immutable, library_private_types_in_public_api

import 'package:flutter/material.dart';
import 'package:hack_tm/lists/peer2peerlist.dart';

class Peer2PeerInfo extends StatefulWidget {
  int cameraID;

  Peer2PeerInfo({Key? key, required this.cameraID}) : super(key: key);

  @override
  _Peer2PeerInfoState createState() => _Peer2PeerInfoState();
}

class _Peer2PeerInfoState extends State<Peer2PeerInfo> {
  final enteredtext = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Expanded(
      child: Peer2PeerList(
        cameraID: widget.cameraID,
      ),
    );
  }
}
