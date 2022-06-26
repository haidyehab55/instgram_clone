import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:uuid/uuid.dart';

class PostReview {
  final FirebaseFirestore _firestore = FirebaseFirestore.instance;

  Future<void> postReview(String postId, String text, String uid, double rating) async {
    try {
      if (text.isNotEmpty) {
        String commentId = const Uuid().v1();
        await _firestore
            .collection('posts')
            .doc(postId)
            .collection('reviews')
            .doc(commentId)
            .set({
          'uid': uid,
          'text': text,
          'commentId': commentId,
          'datePublished': DateTime.now(),
          'rating': rating,
          'likes': [],
          'postId': postId,
        });
      } else {
        print(
          'Text is empty',
        );
      }
    } catch (e) {
      print(
        e.toString(),
      );
    }
  }

  Future<void> likeReview(String postId, String reviewId,String uid, List likes) async {
    try {
      if (likes.contains(uid)) {
        await _firestore.collection('posts').doc(postId).collection('reviews').doc(reviewId).update(
          {
            'likes': FieldValue.arrayRemove([uid]),
          },
        );
      } else {
        await _firestore.collection('posts').doc(postId).collection('reviews').doc(reviewId).update(
          {
            'likes': FieldValue.arrayUnion([uid]),
          },
        );
      }
    } catch (e) {
      print(
        e.toString(),
      );
    }
  }
  Future<void> postReport(String postId, String text, String uid, double rating) async {
    try {
      if (text.isNotEmpty) {
        String reportId = const Uuid().v1();
        await _firestore
            .collection('posts')
            .doc(postId)
            .collection('reports')
            .doc(reportId)
            .set({
          'uid': uid,
          'text': text,
          'reportId': reportId,
          'datePublished': DateTime.now(),
          'rating': rating,
          'reports': [],
          'postId': postId,
        });
      } else {
        print(
          'Text is empty',
        );
      }
    } catch (e) {
      print(
        e.toString(),
      );
    }
  }
  Future<void> reportReview(String postId, String reportId,String uid, List reports) async {
    try {
      if (reports.contains(uid)) {
        await _firestore.collection('posts').doc(postId).collection('reports').doc(reportId).update(
          {
            'reports': FieldValue.arrayRemove([uid]),
          },
        );
      } else {
        await _firestore.collection('posts').doc(postId).collection('reports').doc(reportId).update(
          {
            'reports': FieldValue.arrayUnion([uid]),
          },
        );
      }
    } catch (e) {
      print(
        e.toString(),
      );
    }
  }
}