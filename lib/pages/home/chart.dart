import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:therapy_zone/models/tag.dart';
import 'package:therapy_zone/pages/home/ChartContainer.dart';
import 'package:therapy_zone/services/DatabaseService.dart';

class Chart extends StatefulWidget {
  final String lastFeeling;
  Chart({this.lastFeeling});
  @override
  _ChartState createState() => _ChartState();
}

class _ChartState extends State<Chart> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Color.fromRGBO(99, 43, 108, 1),
        title: Center(
            child: Padding(
          padding: const EdgeInsets.fromLTRB(0, 0, 55, 0),
          child: Text(
            'Your Statistics',
            style: TextStyle(
              color: Color.fromRGBO(252, 195, 163, 1),
            ),
          ),
        )),
      ),
      body: StreamProvider<List<Tag>>.value(
          value: DatabaseService().tags,
          child: Container(child: ChartContainer())),
    );
  }
}
