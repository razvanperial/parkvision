// ignore_for_file: library_private_types_in_public_api, must_be_immutable

import 'package:flutter/material.dart';
import 'package:hack_tm/lists/peer2peerInfoList.dart';
import 'package:intl/intl.dart';

class Peer2PeerList extends StatefulWidget {
  int cameraID;
  Peer2PeerList({
    Key? key,
    required this.cameraID,
  }) : super(key: key);

  @override
  _Peer2PeerListState createState() => _Peer2PeerListState();
}

class _Peer2PeerListState extends State<Peer2PeerList> {
  late int itemCount;

  @override
  void initState() {
    if (!mounted) return;
    super.initState();
    setState(() {
      itemCount = InfoList[widget.cameraID].length;
      for (int i = 0; i < itemCount; i++) {
        if ((InfoList[widget.cameraID][i]).isBefore(DateTime.now())) {
          InfoList[widget.cameraID].remove((InfoList[widget.cameraID][i]));
          itemCount--;
        }
      }
      InfoList[widget.cameraID].sort((a, b) =>
          a.millisecondsSinceEpoch.compareTo(b.millisecondsSinceEpoch));
    });
  }

  @override
  Widget build(BuildContext context) {
    return ListView.builder(
        itemCount: itemCount,
        itemBuilder: (context, index) {
          DateTime info = InfoList[widget.cameraID][index];
          final String formattedTime = DateFormat.Hm().format(info);
          final DateFormat formatter = DateFormat('dd.MM');
          final String formattedDate = formatter.format(info);
          return Card(
            margin: const EdgeInsets.symmetric(vertical: 20, horizontal: 60),
            shape: RoundedRectangleBorder(
                side: const BorderSide(color: Colors.orange, width: 2.0),
                borderRadius: BorderRadius.circular(20.0)),
            color: Colors.white70,
            child: Center(
              child: Padding(
                padding: const EdgeInsets.all(30.0),
                child: Text(
                  "A spot will be open at $formattedTime ($formattedDate)",
                  style: const TextStyle(
                      fontSize: 18,
                      fontWeight: FontWeight.w500,
                      fontFamily: 'Satoshi'),
                ),
              ),
            ),
          );
        });
  }
}
