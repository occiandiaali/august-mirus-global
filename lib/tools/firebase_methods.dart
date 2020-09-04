import 'dart:async';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:mirusglobal/tools/app_methods.dart';
import 'app_data.dart';

class FirebaseMethods implements AppMethods {
  Firestore firestore = Firestore.instance;
  FirebaseAuth auth = FirebaseAuth.instance;

  @override
  Future<bool> createUserAccount(
      {String name, String email, String password, String phone}) async {
    FirebaseUser user = (await auth.createUserWithEmailAndPassword(
        email: email, password: password)) as FirebaseUser;
    //throw UnimplementedError();
    if (user != null) {
      await firestore
          .collection(userData)
          .document(user.uid)
          .setData({
            userID: user.uid,
            userName: name,
            userEmail: email,
            userPassword: password,
            userPhoneNumber: phone
          })
          .whenComplete(() => complete())
          .catchError(() => notComplete());
    }
  }

  @override
  Future<bool> loginUser({String email, String password}) async {
    FirebaseUser user = (await auth.signInWithEmailAndPassword(
        email: email, password: password)) as FirebaseUser;
    return user == null ? notComplete() : complete();
    //throw UnimplementedError();
  }

  Future<bool> complete() async {
    return true;
  }

  Future<bool> notComplete() async {
    return false;
  }
} // class
