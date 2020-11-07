import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:therapy_zone/models/user.dart';
import 'package:therapy_zone/pages/wrapper.dart';
import 'package:therapy_zone/services/auth.dart';

void main() => runApp(Therapy());

class Therapy extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return StreamProvider<User>.value(
      value: AuthService().user,
      child: MaterialApp(
        theme: ThemeData(primaryColor: Colors.white),
        debugShowCheckedModeBanner: false,
        home: Wrapper(),
      ),
    );
  }
}
