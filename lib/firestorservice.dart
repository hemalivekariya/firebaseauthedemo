import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';

class FireStoreService {
  static FirebaseAuth firebaseAuth = FirebaseAuth.instance;
  static FirebaseFirestore firestore = FirebaseFirestore.instance;

  ///store data
  static Future addUserData(docId, name, emailid) async {
    print("addUserData Function");
    firestore.collection("users").doc(docId).set({
      "name": name,
      "age": 21,
      "email": emailid,
      "address": {"street": "street 24", "city": "new york"},
      'uid': docId
    }).then((_) {
      print("success!");
    });
  }

  static Future setOptiona(docId) async {
    firestore
        .collection("users")
        .doc(docId)
        .set({'hobies': 'bike'}, SetOptions(merge: true)).then((_) {
      print("add new data!");
    });
  }

  ///update data
  static Future updateUserData(docId) async {
    firestore.collection("users").doc(docId).update({
      'age': 22,
      'languages': ['c', 'c++', 'dart'],
      'address.city': 'surat'
    });
  }

  static Future addFeildValueByUpdate(docId) async {
    firestore.collection("users").doc(docId).update({
      "characteristics": FieldValue.arrayUnion(["generous", "loving", "loyal"])
    }).then((_) {
      print("success!");
    });
  }

  ///delete data
  static Future deleteFieldValue(docId) async {
    firestore
        .collection("users")
        .doc(docId)
        .update({'hobies': FieldValue.delete()});
  }

  ///get data
  static Future getData(docId) async {
    firestore.collection("users").get().then((querySnapshot) {
      querySnapshot.docs.forEach((result) {
        print(result.data());
      });
    });
  }

  ///get particular user data
  static Future getParticularUserData(uid) async {
    firestore.collection("users").doc(uid).get().then((value) {
      print("particular user data--->${value.data()} ");
    });
  }

  ///
}
