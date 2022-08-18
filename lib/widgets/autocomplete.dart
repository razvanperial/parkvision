import 'package:flutter/material.dart';
import 'package:hack_tm/lists/cameralists.dart';
import 'package:hack_tm/lists/cityzones.dart';
import 'package:hack_tm/views/optionsview/options_view.dart';
import 'package:hack_tm/widgets/call_to_action.dart';

import '../cameras/camera_class.dart';
import '../views/MakeAnnouncementView/make_ann_view.dart';

OptionsPage page = OptionsPage(
  cityZone: CityZone(lat: 1, lon: 1),
  cameras: [],
);

class AutocompleteBasicUserExample extends StatelessWidget {
  const AutocompleteBasicUserExample({Key? key}) : super(key: key);

  static final List<User> _userOptions = <User>[
    User(
        zoneName: 'Piata Victoriei',
        zoneAddress: 'piata victoriei',
        cityZone: zones[0],
        cameraList: piataVictoriei),
    User(
        zoneName: 'Parcul Rozelor',
        zoneAddress: 'parcul rozelor',
        cityZone: zones[1],
        cameraList: parculRozelor),
    User(
        zoneName: 'Piata Unirii',
        zoneAddress: 'piata unirii',
        cityZone: zones[2],
        cameraList: piataUnirii),
    User(
        zoneName: 'Parcul Botanic',
        zoneAddress: 'parcul botanic',
        cityZone: zones[3],
        cameraList: parculBotanic),
    User(
        zoneName: 'Dumbravita',
        zoneAddress: 'dumbravita',
        cityZone: zones[4],
        cameraList: dumbravita),
  ];

  String _displayStringForOption(User option) => option.zoneAddress;

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        MouseRegion(
          cursor: SystemMouseCursors.text,
          child: Container(
            color: Colors.white70,
            child: Autocomplete<User>(
              displayStringForOption: _displayStringForOption,
              optionsBuilder: (TextEditingValue textEditingValue) {
                if (textEditingValue.text == '') {
                  return const Iterable<User>.empty();
                }
                return _userOptions.where((User option) {
                  return option
                      .toString()
                      .contains(textEditingValue.text.toLowerCase());
                });
              },
              onSelected: (User selection) {
                page.cityZone = selection.cityZone;
                page.cameras = selection.cameraList;
                debugPrint(
                    'You just selected ${_displayStringForOption(selection)}');
              },
            ),
          ),
        ),
        const SizedBox(
          height: 50,
        ),
        Row(
          crossAxisAlignment: CrossAxisAlignment.center,
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            CallToAction(
              route: page,
              title: 'See parking spots',
            ),
            CallToAction(
              route: MakeAnnouncementView(),
              title: 'Announce Leave',
            ),
          ],
        ),
      ],
    );
  }
}
