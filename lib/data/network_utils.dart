import 'dart:developer';

import 'package:firebase_auth/firebase_auth.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_storage/firebase_storage.dart';
import 'package:firebase_with_flutter_practice/data/auth_data.dart';
import 'package:get/get.dart';

class NetworkUtils {

  final authInstance = FirebaseAuth.instance;
  final database = FirebaseFirestore.instance.collection("photo_storage");
  final storageRef = FirebaseStorage.instance.ref("photo_storage");

  Future<bool> authCreation(email, firstName, lastName, password) async {
    try {
      final credential = await authInstance.createUserWithEmailAndPassword(email: email, password: password);
      if (credential.user != null) {
        var userData = {
          "uid" : credential.user!.uid.toString(),
          "email" : email,
          "first_name" : firstName,
          "last_name" : lastName,
          "image" : ""
        };
        await database
            .doc(credential.user!.uid)
            .set(userData)
            .onError((error, stackTrace) => log(error.toString()));

        return true;
      } else {
        return false;
      }
    } catch (e) {
      log(e.toString());
      return false;
    }
  }

  Future<bool> authValidation(email, password) async {
    try {
      final result = await authInstance.signInWithEmailAndPassword(email: email, password: password);
      if (result.user != null) {
        log(result.user!.uid);
        database.doc(result.user!.uid).get().then((value) => {
          AuthData().saveUserData(
              value.get("first_name"),
              value.get("last_name"),
              value.get("image"),
              value.get("email"),
              value.get("uid")
          )
        });
        return true;
      } else {
        return false;
      }

    } catch (e) {
      log(e.toString());
      return false;
    }
  }

  Future<List> getImageForUser() async {
    List items = [];
    await storageRef.child("store").child(AuthData.uID.toString()).listAll().then((value) => {
      items = value.items
    });
    List<String> imageRef = [];
    for (var element in items) {
      imageRef.add(await element.getDownloadURL());
    }
    return imageRef;
  }

  Future<void> authRemove() async {
    await authInstance.signOut();
    moveToLogin();
  }

  void moveToLogin() {
    AuthData().clearAuthData();
    Get.offAllNamed("/");
  }
}