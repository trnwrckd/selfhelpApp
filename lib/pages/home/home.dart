import 'package:provider/provider.dart';
import 'package:therapy_zone/models/user.dart';
import 'package:therapy_zone/pages/home/About.dart';
import 'package:flutter/material.dart';
import 'package:therapy_zone/models/post.dart';
import 'package:therapy_zone/pages/home/PostList.dart';
import 'package:therapy_zone/pages/home/chart.dart';
import 'package:therapy_zone/pages/home/doctor.dart';
import 'package:therapy_zone/pages/home/learn.dart';
import 'package:therapy_zone/pages/home/newpost.dart';
import 'package:therapy_zone/pages/home/quiz.dart';
import 'package:therapy_zone/services/DatabaseService.dart';
import 'package:therapy_zone/services/auth.dart';

class Home extends StatefulWidget {
  @override
  _HomeState createState() => _HomeState();
}

class _HomeState extends State<Home> {
  final AuthService _auth = AuthService();

  //declaring variables
  List<Post> posts = [
    Post(
        title: 'Why so sad',
        content:
            'ki likhbo aar.\nsharajibon khali dukkhei katlo shukher mukhti dekhlam na.\noh. jontrona',
        date: '28-07-12',
        tag: "\u{1F641}"),
  ];

  Map data = {};

  @override
  Widget build(BuildContext context) {
    //final user = Provider.of<User>(context);
    return StreamProvider<List<Post>>.value(
      value: DatabaseService().posts,
      child: Scaffold(
        appBar: AppBar(
          backgroundColor: Color.fromRGBO(99, 43, 108, 1),
          title: Center(
            child: Text(
              'Home',
              style: TextStyle(
                color: Color.fromRGBO(252, 195, 163, 1),
              ),
            ),
          ),
          actions: [
            PopupMenuButton(
              color: Color.fromRGBO(99, 43, 108, 1),
              itemBuilder: (_) => <PopupMenuItem<String>>[
                PopupMenuItem<String>(
                  child: FlatButton(
                    onPressed: () {
                      Navigator.push(context,
                          MaterialPageRoute(builder: (context) => About()));
                    },
                    child: Text(
                      'About us',
                      style: TextStyle(
                        color: Colors.white30,
                      ),
                    ),
                  ),
                ),
                PopupMenuItem<String>(
                  child: FlatButton.icon(
                    onPressed: () async {
                      await _auth.signOut();
                    },
                    icon: Icon(
                      Icons.logout,
                      color: Colors.white30,
                    ),
                    label: Text(
                      'Logout',
                      style: TextStyle(
                        color: Colors.white30,
                      ),
                    ),
                  ),
                ),
              ],
            )
          ],
        ),
        body: Container(
            color: Color.fromRGBO(39, 15, 54, 1),
            child: Center(
              child: Column(
                children: [
                  Expanded(child: Container(child: PostList())),
                  Padding(
                    padding: const EdgeInsets.fromLTRB(0.0, 0.0, 0.0, 0.0),
                    child: BottomAppBar(
                      color: Color.fromRGBO(99, 43, 108, 1),
                      child: IconTheme(
                        data: IconThemeData(
                          color: Color.fromRGBO(240, 159, 156, 1),
                        ),
                        child: Padding(
                          padding: const EdgeInsets.symmetric(
                              vertical: 0.0, horizontal: 40),
                          child: Row(
                            children: [
                              IconButton(
                                  icon: Icon(Icons.article_outlined),
                                  onPressed: () {
                                    Navigator.push(
                                      context,
                                      MaterialPageRoute(
                                          builder: (context) => Learn()),
                                    );
                                  }),
                              SizedBox(
                                width: 40,
                              ),
                              IconButton(
                                  icon: Icon(Icons.search_outlined),
                                  onPressed: () {
                                    Navigator.push(
                                      context,
                                      MaterialPageRoute(
                                          builder: (context) => Quiz()),
                                    );
                                  }),
                              SizedBox(
                                width: 40,
                              ),
                              IconButton(
                                  icon: Icon(
                                    Icons.bar_chart_outlined,
                                  ),
                                  onPressed: () {
                                    Navigator.push(
                                      context,
                                      MaterialPageRoute(
                                          builder: (context) => Chart()),
                                    );
                                  }),
                              SizedBox(
                                width: 40,
                              ),
                              IconButton(
                                  icon: Icon(Icons.local_hospital_outlined),
                                  onPressed: () {
                                    Navigator.push(
                                      context,
                                      MaterialPageRoute(
                                          builder: (context) => Doctor()),
                                    );
                                  }),
                            ],
                          ),
                        ),
                      ),
                    ),
                  ),
                ],
              ),
            )),
        floatingActionButton: Padding(
          padding: const EdgeInsets.fromLTRB(0, 0, 0, 40),
          child: FloatingActionButton(
            backgroundColor: Color.fromRGBO(240, 159, 156, 1),
            onPressed: () {
              Navigator.push(
                context,
                MaterialPageRoute(builder: (context) => NewPost()),
              );
            },
            child: Icon(
              Icons.create_outlined,
              color: Colors.deepPurple,
            ),
          ),
        ),
      ),
    );
  }
}

/* abstract class ListItem {
  Widget buildTitle(BuildContext context);
  Widget buildContent(BuildContext context);
}

class PostItem implements ListItem {
  final String title;
} */
