import 'package:flutter/material.dart';
import 'package:therapy_zone/models/post.dart';

class PostTile extends StatelessWidget {
  final Post post;

  PostTile({this.post});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.only(top: 8),
      child: Card(
        color: Color.fromRGBO(99, 43, 108, .5),
        margin: EdgeInsets.fromLTRB(20, 6, 20, 0),
        child: ListTile(
          onTap: null,
          leading: Text(
            '${post.tag}',
            style: TextStyle(fontSize: 30),
          ),
          title: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text(
                    ('${post.title}'),
                    style: TextStyle(fontSize: 20, color: Colors.yellow[100]),
                  ),
                  Text(
                    '${post.date}',
                    style: TextStyle(
                      fontSize: 12,
                      color: Color.fromRGBO(252, 195, 163, 1),
                    ),
                  ),
                ],
              ),
              Padding(
                padding: const EdgeInsets.fromLTRB(0, 4, 165, 4),
                child: Divider(
                  height: 2,
                  thickness: .5,
                  color: Colors.white,
                ),
              ),
              Text(
                '${post.content}',
                style: TextStyle(
                  fontSize: 16,
                  color: Colors.red[100],
                ),
                //Color.fromRGBO(252, 195, 163, 1)),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
