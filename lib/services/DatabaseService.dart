import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:therapy_zone/models/post.dart';
import 'package:therapy_zone/models/tag.dart';

class DatabaseService {
  final String uid;
  DatabaseService({this.uid});

  final CollectionReference postCollection =
      Firestore.instance.collection('posts');

  Future postNewContent(
      String title, String content, String date, String tag) async {
    //  print('$uid');
    return await postCollection.add({
      'uid': uid,
      'title': title,
      'content': content,
      'date': date,
      'tag': tag
    });
  }

  // idk turning snapshot into list of post obj
  List<Post> _postListfromSnapshot(QuerySnapshot snapshot) {
    return snapshot.documents.map((doc) {
      return Post(
        uid: doc.data['uid'] ?? '',
        title: doc.data['title'] ?? '',
        content: doc.data['content'] ?? '',
        date: doc.data['date'] ?? '',
        tag: doc.data['tag'] ?? '',
      );
    }).toList();
  }

  Stream<List<Post>> get posts {
    return postCollection.snapshots().map(_postListfromSnapshot);
  }

// creating collection for tags

  final CollectionReference tagCollection =
      Firestore.instance.collection('tags');

  Future updateChartData(String tag, String uid) async {
    //print('$tag $uid');
    return await tagCollection.document(uid).setData({
      'lastFeeling': tag,
      'uid': uid,
    });
  }

  Future createUserTagInfo(String tag, String uid, int tag1, int tag2, int tag3,
      int tag4, int tag5, int tag6) async {
    print('done both');
    return await tagCollection.document(uid).setData({
      'lastFeeling': tag,
      'uid': uid,
      'tag1': tag1,
      'tag2': tag2,
      'tag3': tag3,
      'tag4': tag4,
      'tag5': tag5,
      'tag6': tag6,
    });
  }

  //ki je korlam ei jaygatay :| dukkhojonok

  Future actuallyUpdatehere(String tagnum, String lastFeeling) async {
    final DocumentReference thisRef = tagCollection.document(uid);
    print("actually update here");
    return await thisRef.updateData(
        {'$tagnum': FieldValue.increment(1), 'lastFeeling': lastFeeling});
  }

  Future updateCounter(String feels) async {
    if (feels == "\u{1F616}") {
      print(feels);
      await actuallyUpdatehere('tag1', feels);
    } else if (feels == "\u{1F62A}") {
      print(feels);
      await actuallyUpdatehere('tag2', feels);
    } else if (feels == "\u{1F641}") {
      print(feels);
      await actuallyUpdatehere('tag3', feels);
    } else if (feels == "\u{1F610}") {
      print(feels);
      await actuallyUpdatehere('tag4', feels);
    } else if (feels == "\u{1F600}") {
      print(feels);
      await actuallyUpdatehere('tag5', feels);
    } else if (feels == "\u{1F604}") {
      print(feels);
      await actuallyUpdatehere('tag6', feels);
    }
  }

  List<Tag> _tagListFromSnapshot(QuerySnapshot snapshot) {
    return snapshot.documents.map((doc) {
      return Tag(
          lastFeeling: doc.data['lastFeeling'] ?? '',
          tag1: doc.data['tag1'] ?? 0,
          tag2: doc.data['tag2'] ?? 0,
          tag3: doc.data['tag3'] ?? 0,
          tag4: doc.data['tag4'] ?? 0,
          tag5: doc.data['tag5'] ?? 0,
          tag6: doc.data['tag6'] ?? 0,
          uid: doc.data['uid'] ?? '');
    }).toList();
  }

  Stream<List<Tag>> get tags {
    return tagCollection.snapshots().map(_tagListFromSnapshot);
  }
}
