import 'package:therapy_zone/shared/loading.dart';
import 'package:flutter/material.dart';
import 'package:webview_flutter/webview_flutter.dart';

class Quiz extends StatefulWidget {
  @override
  _QuizState createState() => _QuizState();
}

class _QuizState extends State<Quiz> {
  bool isLoading = true;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Color.fromRGBO(99, 43, 108, 1),
        title: Center(
            child: Padding(
          padding: const EdgeInsets.fromLTRB(0, 0, 55, 0),
          child: Text(
            isLoading ? 'Please wait..' : 'Take a quiz',
            style: TextStyle(
              color: Color.fromRGBO(252, 195, 163, 1),
            ),
          ),
        )),
      ),
      body: Stack(
        children: <Widget>[
          WebView(
            initialUrl: 'https://www.16personalities.com/free-personality-test',
            javascriptMode: JavascriptMode.unrestricted,
            onPageFinished: (finish) {
              setState(() {
                isLoading = false;
              });
            },
          ),
          // isLoading ? Loading() : Stack(),
        ],
      ),
    );
  }
}
