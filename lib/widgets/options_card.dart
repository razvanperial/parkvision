// ignore_for_file: library_private_types_in_public_api, must_be_immutable

import 'package:flutter/material.dart';
import '../cameras/camera_class.dart';
import 'options_single_card.dart';

class OptionsCards extends StatefulWidget {
  List<Camera> cameras;
  OptionsCards({Key? key, required this.cameras}) : super(key: key);
  @override
  _OptionsCardsState createState() => _OptionsCardsState();
}

class _OptionsCardsState extends State<OptionsCards> {
  @override
  Widget build(BuildContext context) {
    return ListView.builder(
      itemCount: widget.cameras.length,
      itemBuilder: (context, index) {
        String locationName = widget.cameras[index].locationName;
        String locationAddress = widget.cameras[index].locationAddress;
        int cameraID = widget.cameras[index].cameraID;
        return OptionsSingleCard(
            locationName: locationName,
            locationAddress: locationAddress,
            cameraID: cameraID);
      },
    );
  }
}
