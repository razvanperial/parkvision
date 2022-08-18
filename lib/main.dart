import 'package:flutter/material.dart';
import 'package:hack_tm/lists/cameralists.dart';
import 'package:hack_tm/lists/cityzones.dart';
import 'package:hack_tm/views/homeview/home_view.dart';
import 'package:hack_tm/views/optionsview/options_view.dart';
import 'package:hack_tm/widgets/test.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Park Vision TM',
      theme: ThemeData(
        primarySwatch: Colors.orange,
      ),
      home: const MyHomePage(),
      debugShowCheckedModeBanner: false,
    );
  }
}
