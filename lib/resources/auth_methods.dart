import 'package:firebase_auth/firebase_auth.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'dart:typed_data';
import 'package:instgram_clone/resources/storage_methods.dart';
import 'package:instgram_clone/models/user.dart' as model;

class AuthMethods {
  final FirebaseFirestore _firestore = FirebaseFirestore.instance;
  final FirebaseAuth _auth = FirebaseAuth.instance;

  Future<model.User> getUserDetails()async {
    User currentUser = _auth.currentUser!;
    DocumentSnapshot snapshot = await FirebaseFirestore.instance.collection("users").doc(currentUser.uid).get();
    return model.User.fromSnap(snapshot);
  }

  Future<String> signUpUser(
      {required String name,
      required String email,
      required String password,
      required String bio,
      required Uint8List file}) async {
    String res = "Error occurred";
    try {
      if (name.isNotEmpty ||
          email.isNotEmpty ||
          password.isNotEmpty ||
          bio.isNotEmpty ||
          file != null) {
        UserCredential cred = await _auth.createUserWithEmailAndPassword(
          email: email,
          password: password,
        );

        print(cred.user!.uid);

        String photoUrl = await StorageMethods()
            .uploadImageToStorage('profilePics', file, false);

        model.User user = model.User(
          username: name,
          bio: bio,
          email: email,
          uid: cred.user!.uid,
          photoUrl: photoUrl,
          followers: [],
          following: [],
        );

        await _firestore.collection('users').doc(cred.user!.uid).set(user.toJson(),);
        res = "success";
      } else {
        res = "please enter all the fields";
      }
    } catch (err) {
      res = err.toString();
    }
    return res;
  }

  Future<String> loginUser(
      {required String email, required String password}) async {
    String res = "Error occurred";

    try {
      if (email.isNotEmpty || password.isNotEmpty) {
        await _auth.signInWithEmailAndPassword(
          email: email,
          password: password,
        );
        res = "success";
      } else {
        res = "please enter all the fields";
      }
    } catch (err) {
      res = err.toString();
    }
    return res;
  }

  Future <void> signOut() async{
    await _auth.signOut();
}
}
