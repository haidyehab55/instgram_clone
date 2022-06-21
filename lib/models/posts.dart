import 'package:cloud_firestore/cloud_firestore.dart';

class Posts {
  final String description;
  final String username;
  final String postId;
  final String uid;
  final datePublished;
  final String postUrl;
  final String profImage;
  final likes;

  const Posts({
    required this.description,
    required this.username,
    required this.postId,
    required this.uid,
    required this.datePublished,
    required this.postUrl,
    required this.profImage,
    required this.likes,
  });

  static Posts fromSnap(DocumentSnapshot snap) {
    var snapshot = snap.data() as Map<String, dynamic>;
    return Posts(
      description: snapshot["description"],
      username: snapshot["username"],
      postId: snapshot["postId"],
      uid: snapshot["uid"],
      datePublished: snapshot["datePublished"],
      postUrl: snapshot["postUrl"],
      profImage: snapshot["profImage"],
      likes: snapshot["likes"],
    );
  }

  Map<String, dynamic> toJson() => {
    'description': description,
    'username': username,
    'postId': postId,
    'uid': uid,
    'postUrl': postUrl,
    'profImage': profImage,
    'datePublished': datePublished,
    'likes': likes,
  };
}
