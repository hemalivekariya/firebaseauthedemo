import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebaseauthedemo/screen/signup.dart';
import 'package:flutter/material.dart';
import 'package:google_sign_in/google_sign_in.dart';

class FirebaseService {
  static FirebaseAuth firebaseAuth = FirebaseAuth.instance;
  static GoogleSignIn googleSignIn = GoogleSignIn();
  static User user=firebaseAuth.currentUser;

  static Future<bool> SignUp(String email, String password, String displayname,
      String phonenumber) async {
    try {
      UserCredential userCredential = await firebaseAuth
          .createUserWithEmailAndPassword(email: email, password: password);
      User user = userCredential.user;
      user.updateProfile(displayName: displayname,photoURL: phonenumber);
      print("user-->$user");
      return true;
    } catch (e) {
      print("signUp error--->$e");
      return false;
    }
  }

  static Future SignIn(String email, String password) async {
    try {
      UserCredential userCredential = await firebaseAuth
          .signInWithEmailAndPassword(email: email, password: password);
      User user = userCredential.user;
      print("Get user --->$user");
      return userCredential;
    } catch (e) {
      print("signIn error--->$e");
      return null;
    }
  }

  static Future signInWithGoogle() async {
    try{
      GoogleSignInAccount googleSignInAccount = await googleSignIn.signIn();
      GoogleSignInAuthentication googleSignInAuthentication =
      await googleSignInAccount.authentication;
      AuthCredential authCredential = GoogleAuthProvider.getCredential(
          accessToken: googleSignInAuthentication.accessToken,
          idToken: googleSignInAuthentication.idToken);
      UserCredential userCredential=await firebaseAuth.signInWithCredential(authCredential);
      print("usercaredentials------>$userCredential");
      FirebaseUser user=userCredential.user;
      print("SigninGoogle ====>$user");
      FirebaseUser currentUser =  firebaseAuth.currentUser;
      return true;
    }catch(e){
      print("signIn error--->$e");
      return false;
    }
  }
  static Future logOut()async{
    try{
      print("logOut");
      firebaseAuth.signOut();
    }catch(e){
      print(e);
    }
  }
  void signOutGoogle() async{
    await googleSignIn.signOut();
    print("User Sign Out");
  }

}
