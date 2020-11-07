import 'package:flutter/material.dart';
import 'package:therapy_zone/services/auth.dart';
import 'package:therapy_zone/shared/loading.dart';

class Login extends StatefulWidget {
  final Function toggleView;
  Login({this.toggleView});

  @override
  _LoginState createState() => _LoginState();
}

class _LoginState extends State<Login> {
  final AuthService _auth = AuthService();
  final _formKey = GlobalKey<FormState>();

  String email = '', password = '';
  bool isLoading = false;

  showError(String errormessage) {
    showDialog(
        context: context,
        builder: (BuildContext context) {
          return AlertDialog(
            title: Text('ERROR'),
            content: Text(errormessage),
            actions: [
              FlatButton(
                  onPressed: () {
                    Navigator.of(context).pop();
                  },
                  child: Text('OK'))
            ],
          );
        });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color.fromRGBO(39, 15, 54, 1),
      body: Stack(
        children: [
          SingleChildScrollView(
            child: Padding(
              padding: const EdgeInsets.only(left: 10.0, right: 10.0),
              child: Container(
                decoration: BoxDecoration(
                  image: DecorationImage(
                    image: AssetImage("assets/1.png"),
                    fit: BoxFit.cover,
                  ),
                ),
                child: Column(
                  children: [
                    Container(
                      height: 350,
                      child: Image(
                        image: AssetImage("assets/2.png"),
                        fit: BoxFit.contain,
                      ),
                    ),
                    RichText(
                        text: TextSpan(
                            text: 'Welcome to ',
                            style: TextStyle(
                                fontSize: 25.0,
                                fontWeight: FontWeight.bold,
                                color: Colors.white),
                            children: <TextSpan>[
                          TextSpan(
                              text: 'Self Help',
                              style: TextStyle(
                                  fontSize: 30.0,
                                  fontWeight: FontWeight.bold,
                                  color: Colors.lightBlueAccent[700]))
                        ])),
                    SizedBox(height: 15.0),
                    Text(
                      'Find Your Mental Peace',
                      style: TextStyle(
                          fontSize: 18.0,
                          color: Colors.white,
                          letterSpacing: 2.0),
                    ),
                    SizedBox(height: 30.0),
                    Container(
                      child: Form(
                        key: _formKey,
                        child: Column(
                          children: [
                            TextFormField(
                                style: TextStyle(color: Colors.white60),
                                validator: (val) =>
                                    val.isEmpty ? 'Enter Email' : null,
                                decoration: InputDecoration(
                                  labelText: 'Email',
                                  labelStyle:
                                      new TextStyle(color: Colors.white60),
                                  prefixIcon:
                                      Icon(Icons.email, color: Colors.white60),
                                  enabledBorder: UnderlineInputBorder(
                                    borderSide:
                                        BorderSide(color: Colors.white60),
                                  ),
                                  focusedBorder: UnderlineInputBorder(
                                    borderSide:
                                        BorderSide(color: Colors.white60),
                                  ),
                                ),
                                onChanged: (val) {
                                  setState(() => email = val);
                                }),
                            TextFormField(
                                style: TextStyle(color: Colors.white60),
                                validator: (val) => val.length < 6
                                    ? 'Enter Minimum 6 Characters'
                                    : null,
                                decoration: InputDecoration(
                                  labelText: 'Password',
                                  labelStyle:
                                      new TextStyle(color: Colors.white60),
                                  prefixIcon:
                                      Icon(Icons.lock, color: Colors.white60),
                                  enabledBorder: UnderlineInputBorder(
                                    borderSide:
                                        BorderSide(color: Colors.white60),
                                  ),
                                  focusedBorder: UnderlineInputBorder(
                                    borderSide:
                                        BorderSide(color: Colors.white60),
                                  ),
                                ),
                                obscureText: true,
                                onChanged: (val) {
                                  setState(() => password = val);
                                }),
                            SizedBox(height: 20.0),
                            RaisedButton(
                              onPressed: () async {
                                setState(() {
                                  isLoading = true;
                                });
                                if (_formKey.currentState.validate()) {
                                  dynamic result =
                                      await _auth.signInWithEmailAndPassword(
                                          email, password);
                                  showError(result);
                                }
                              },
                              padding: EdgeInsets.symmetric(
                                  vertical: 10, horizontal: 70),
                              child: Text(
                                'Login',
                                style: TextStyle(
                                    fontSize: 20.0,
                                    fontWeight: FontWeight.bold,
                                    color: Colors.white,
                                    letterSpacing: 1.0),
                              ),
                              shape: RoundedRectangleBorder(
                                borderRadius: BorderRadius.circular(10.0),
                              ),
                              color: Colors.lightBlueAccent[700],
                            )
                          ],
                        ),
                      ),
                    ),
                    SizedBox(height: 10.0),
                    GestureDetector(
                        onTap: widget.toggleView,
                        child: Text(
                          "Don't have an account?",
                          style: TextStyle(color: Colors.white),
                        ))
                  ],
                ),
              ),
            ),
          ),
          isLoading ? Loading() : Stack(),
        ],
      ),
    );
  }
}
