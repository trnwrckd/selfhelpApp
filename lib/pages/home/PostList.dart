import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:therapy_zone/models/post.dart';
import 'package:therapy_zone/models/user.dart';
import 'package:therapy_zone/pages/home/PostTile.dart';

class PostList extends StatefulWidget {
  @override
  _PostListState createState() => _PostListState();
}

class _PostListState extends State<PostList> {
  @override
  Widget build(BuildContext context) {
    final user = Provider.of<User>(context);
    final posts = Provider.of<List<Post>>(context) ?? [];
    return ListView.builder(
        itemCount: posts.length,
        itemBuilder: (context, index) {
          if (posts[index].uid == user.uid)
            return PostTile(post: posts[index]);
          else
            //return deya e lagbe? ashchorjo. na mille kijonno ditam?
            return SizedBox(
              height: 0,
            );
        });
  }
}
