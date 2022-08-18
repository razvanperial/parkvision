// ignore_for_file: sort_child_properties_last, must_be_immutable, library_private_types_in_public_api

import 'package:flutter/material.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';

class MapWidget extends StatefulWidget {
  late double lat;
  late double lon;
  MapWidget({Key? key, required this.lat, required this.lon}) : super(key: key);
  @override
  _MapWidgetState createState() => _MapWidgetState();
}

class _MapWidgetState extends State<MapWidget> {
  late GoogleMapController mapController;
  late double lat;
  late double lon;
  LatLng _center = const LatLng(0, 0);
  @override
  void initState() {
    super.initState();
    _center = LatLng(widget.lat, widget.lon);
  }

  void _onMapCreated(GoogleMapController controller) {
    mapController = controller;
  }

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 160,
      child: Card(
        elevation: 10,
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(20.0),
        ),
        semanticContainer: true,
        child: ClipRRect(
          borderRadius: BorderRadius.circular(20),
          child: GoogleMap(
            onMapCreated: _onMapCreated,
            initialCameraPosition: CameraPosition(
              target: _center,
              zoom: 13.0,
            ),
          ),
        ),
        margin: const EdgeInsets.only(left: 40, right: 40),
      ),
    );
  }
}
