import 'package:flutter/material.dart';

@immutable
class User {
  User({
    required this.zoneName,
    required this.zoneAddress,
    required this.cityZone,
    required this.cameraList,
  });

  final String zoneName;
  final String zoneAddress;
  CityZone cityZone;
  List<Camera> cameraList = [];

  @override
  String toString() {
    return '$zoneAddress, $zoneName';
  }

  @override
  bool operator ==(Object other) {
    if (other.runtimeType != runtimeType) {
      return false;
    }
    return other is User &&
        other.zoneAddress == zoneAddress &&
        other.zoneName == zoneName;
  }

  @override
  int get hashCode => Object.hash(zoneName, zoneAddress);
}

class Camera {
  final String locationName;
  final String locationAddress;
  final int cameraID;

  Camera({
    required this.locationName,
    required this.locationAddress,
    required this.cameraID,
  });
}

class CityZone {
  final double lat;
  final double lon;

  CityZone({
    required this.lat,
    required this.lon,
  });
}
