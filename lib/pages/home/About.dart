import 'package:flutter/material.dart';

class About extends StatelessWidget {
  final List<Dev> devs = [
    Dev(name: "Manzurul Kabir Ayon", id: "17701056"),
    Dev(name: "Ishmamur Rahman", id: "17701063"),
    Dev(name: "Fairooz Azim", id: "17701083"),
    Dev(name: "Tajbi-ul Hossain", id: "17701090"),
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Color.fromRGBO(99, 43, 108, 1),
        title: Center(
            child: Padding(
          padding: const EdgeInsets.fromLTRB(0, 0, 55, 0),
          child: Text(
            'About Us',
            style: TextStyle(
              color: Color.fromRGBO(252, 195, 163, 1),
            ),
          ),
        )),
      ),
      body: SizedBox.expand(
        child: Container(
          color: Color.fromRGBO(39, 15, 54, 1),
          child: ListView.builder(
            itemCount: devs.length,
            itemBuilder: (context, index) {
              return Padding(
                padding: EdgeInsets.symmetric(vertical: 5, horizontal: 10),
                child: Column(
                  children: [
                    Text(
                      devs[index].name,
                      style: nameStyle,
                    ),
                    SizedBox(
                      height: 15,
                    ),
                    Text(
                      ('ID: ${devs[index].id}'),
                      style: idStyle,
                    ),
                    SizedBox(
                      height: 15,
                      child: Divider(
                        height: 1,
                        color: Colors.white,
                      ),
                    ),
                  ],
                ),
              );
            },
          ),
        ),
      ),
    );
  }
}

class Dev {
  String name;
  String id;

  Dev({this.name, this.id});
}

const nameStyle = TextStyle(
  color: Colors.white70,
  fontSize: 22,
);
const idStyle = TextStyle(
  color: Colors.blueGrey,
  fontSize: 18,
);
