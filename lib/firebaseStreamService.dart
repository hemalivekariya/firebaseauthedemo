import 'dart:async';

import 'package:cloud_firestore/cloud_firestore.dart';

import 'models/user_model.dart';

class FireBaseStreamService {
  static FirebaseFirestore firestore = FirebaseFirestore.instance;

  static Future getUserData() async {
    QuerySnapshot querySnapshot = await firestore.collection("users").get();
    var model;
    querySnapshot.docs.forEach((result) {
      print("${result.data()}");
      model = UserModel.fromJson(result.data());
    });

    return model;
  }
}
