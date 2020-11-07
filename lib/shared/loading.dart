// LOADING WIDGET
import 'package:flutter/material.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';

class Loading extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SizedBox.expand(
        child: Container(
          color: Color.fromRGBO(39, 15, 54, 1),
          child: SpinKitChasingDots(
            color: Color.fromRGBO(252, 195, 163, 1),
            size: 40,
          ),
        ),
      ),
    );
  }
}
