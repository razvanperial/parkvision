// ignore_for_file: must_be_immutable, library_private_types_in_public_api

import 'package:flutter/material.dart';

import '../cameras/camera_class.dart';
import 'options_card.dart';

class OptionsWidget extends StatefulWidget {
  List<Camera> cameras;
  OptionsWidget({Key? key, required this.cameras}) : super(key: key);
  @override
  _OptionsWidgetState createState() => _OptionsWidgetState();
}

class _OptionsWidgetState extends State<OptionsWidget> {
  @override
  Widget build(BuildContext context) {
    return Expanded(child: OptionsCards(cameras: widget.cameras));
  }
}
