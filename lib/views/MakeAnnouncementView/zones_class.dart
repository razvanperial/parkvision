import 'package:flutter/material.dart';

@immutable
class Zone {
  Zone({
    required this.zoneName,
    required this.zoneAddress,
    required this.cameraID,
  });

  final String zoneName;
  final String zoneAddress;
  final int cameraID;

  @override
  String toString() {
    return '$zoneAddress, $zoneName';
  }

  @override
  bool operator ==(Object other) {
    if (other.runtimeType != runtimeType) {
      return false;
    }
    return other is Zone &&
        other.zoneAddress == zoneAddress &&
        other.zoneName == zoneName;
  }

  @override
  int get hashCode => Object.hash(zoneName, zoneAddress);
}
