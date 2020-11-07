import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:therapy_zone/models/user.dart';
import 'package:therapy_zone/pages/home/chart.dart';
import 'package:therapy_zone/services/DatabaseService.dart';
import 'package:intl/intl.dart';

class NewPost extends StatefulWidget {
  @override
  _NewPostState createState() => _NewPostState();
}

class _NewPostState extends State<NewPost> {
  //CODE FOR FEELINGS SLIDER
  String _pTitle;
  String _pContent;
  String _pTag;
  String _pUid;
  String _pDate;
  //getting date
  final time = DateTime.now();
  String timeNow = DateFormat.jm().add_yMd().format(DateTime.now());
  //slider value
  double _currentSliderValue = 60;
  String emoji = "\u{1F610}";
  //function to change emoji on slider
  void setEmoji(double value) {
    if (value == 0) {
      emoji = "\u{1F616}";
    }
    if (value == 20) {
      emoji = "\u{1F62A}";
    }
    if (value == 40) {
      emoji = "\u{1F641}";
    }
    if (value == 60) {
      emoji = "\u{1F610}";
    }
    if (value == 80) {
      emoji = "\u{1F600}";
    }
    if (value == 100) {
      emoji = "\u{1F604}";
    }
  }

  final _postForm = GlobalKey<FormState>();

  @override
  Widget build(BuildContext context) {
    final user = Provider.of<User>(context);
    _pUid = user.uid;

    return Scaffold(
      resizeToAvoidBottomPadding: false,
      appBar: AppBar(
        backgroundColor: Color.fromRGBO(99, 43, 108, 1),
        title: Center(
            child: Padding(
          padding: const EdgeInsets.fromLTRB(0, 0, 55, 0),
          child: Text(
            'Add new Journal entry',
            style: TextStyle(
              color: Color.fromRGBO(252, 195, 163, 1),
            ),
          ),
        )),
      ),
      body: Container(
        color: Color.fromRGBO(39, 15, 54, 1),
        child: Padding(
          padding: const EdgeInsets.fromLTRB(10, 20, 10, 0),
          child: Form(
            key: _postForm,
            child: Column(
              children: [
                TextFormField(
                  validator: (value) => value.isEmpty ? 'Enter Title' : null,
                  style: TextStyle(
                    color: Color.fromRGBO(240, 159, 156, 1),
                  ),
                  decoration: InputDecoration(
                    fillColor: Color.fromRGBO(99, 43, 108, .1),
                    filled: true,
                    contentPadding: EdgeInsets.symmetric(horizontal: 20),
                    enabledBorder: OutlineInputBorder(
                      borderSide: BorderSide(
                        color: Color.fromRGBO(252, 195, 163, 1),
                      ),
                    ),
                    border: OutlineInputBorder(),
                    hintText: 'Title',
                    hintStyle: TextStyle(
                      fontSize: 20,
                      color: Color.fromRGBO(252, 195, 163, 1),
                    ),
                  ),
                  onChanged: (val) {
                    if (_postForm.currentState.validate()) {
                      setState(() => _pTitle = val);
                    }
                  },
                ),
                SizedBox(
                  height: 20,
                ),
                TextFormField(
                  validator: (value) => value.isEmpty
                      ? 'There is something and we both know it!'
                      : null,
                  style: TextStyle(
                    color: Color.fromRGBO(252, 195, 163, 1),
                  ),
                  decoration: InputDecoration(
                    enabledBorder: OutlineInputBorder(
                      borderSide: BorderSide(
                        color: Color.fromRGBO(252, 195, 163, 1),
                      ),
                    ),
                    contentPadding:
                        EdgeInsets.symmetric(vertical: 40, horizontal: 20),
                    border: OutlineInputBorder(),
                    hintText: "What's on your mind?",
                    hintStyle: TextStyle(
                      fontSize: 20,
                      color: Color.fromRGBO(252, 195, 163, 1),
                    ),
                  ),
                  onChanged: (value) => setState(() => _pContent = value),
                ),
                SizedBox(
                  height: 30,
                ),
                Text(
                  'How Are you feeling right now?',
                  style: TextStyle(
                    color: Color.fromRGBO(252, 195, 163, 1),
                    fontSize: 20,
                  ),
                ),
                SizedBox(
                  height: 15,
                ),
                Text(
                  '$emoji',
                  style: TextStyle(
                    fontSize: 32.0,
                  ),
                ),
                SizedBox(
                  height: 30,
                ),
                Slider(
                  //active and inactive color ??
                  value: _currentSliderValue,
                  min: 0,
                  max: 100,
                  divisions: 5,
                  onChanged: (double value) {
                    setState(() {
                      _currentSliderValue = value ?? _currentSliderValue;
                      setEmoji(_currentSliderValue);
                    });
                  },
                ),
                RaisedButton(
                  child: Icon(
                    Icons.send_outlined,
                    color: Colors.deepPurple,
                  ),
                  color: Color.fromRGBO(240, 159, 156, 1),
                  onPressed: () {
                    if (_postForm.currentState.validate()) {
                      setState(() {
                        _pDate = timeNow;
                        _pTag = emoji;
                        //print(_pTag);
                      });

                      //print('$_pUid\n$_pTitle\n$_pContent\n$_pDate\n$_pTag');
                      // add function to store post in database. the provider to use that uid
                      DatabaseService(uid: user.uid)
                          .postNewContent(_pTitle, _pContent, _pDate, _pTag);

                      DatabaseService(uid: user.uid).updateCounter(_pTag);

                      Navigator.pop(context);
                    }
                  },
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
