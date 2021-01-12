import 'package:firebaseauthedemo/firebaseservice.dart';
import 'package:firebaseauthedemo/firestorservice.dart';
import 'package:firebaseauthedemo/screen/storage_image.dart';
import 'package:flutter/material.dart';

class FireStoreData extends StatefulWidget {
  @override
  _FireStoreDataState createState() => _FireStoreDataState();
}

class _FireStoreDataState extends State<FireStoreData> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        leading: GestureDetector(
          child: Icon(
            Icons.arrow_back_ios_outlined,
          ),
          onTap: () {
            Navigator.pop(context);
          },
        ),
        title: Text("FireStore CRUD operation"),
      ),
      body: Column(
        children: [
          button(
              text: "AddUser",
              colors: Colors.purple,
              callBack: () async {
                await FireStoreService.addUserData(
                    FirebaseService.user.uid,
                    FirebaseService.user.displayName,
                    FirebaseService.user.email);
                await FireStoreService.setOptiona(FirebaseService.user.uid);
              }),
          SizedBox(
            height: 20,
          ),
          button(
              text: "update data",
              colors: Colors.yellow,
              callBack: () async {
                await FireStoreService.updateUserData(FirebaseService.user.uid);
              }),
          SizedBox(
            height: 20,
          ),
          button(
              text: "AddFeild value",
              colors: Colors.blueGrey,
              callBack: () async {
                await FireStoreService.addFeildValueByUpdate(
                    FirebaseService.user.uid);
              }),
          SizedBox(
            height: 20,
          ),
          button(
              text: "delete value",
              colors: Colors.deepOrange,
              callBack: () async {
                await FireStoreService.deleteFieldValue(
                    FirebaseService.user.uid);
              }),
          SizedBox(
            height: 20,
          ),
          button(
              text: "get Data ",
              colors: Colors.deepOrange,
              callBack: () async {
                await FireStoreService.getData(FirebaseService.user.uid);
              }),
          SizedBox(
            height: 20,
          ),
          button(
              text: "getParticularUserData ",
              colors: Colors.green,
              callBack: () async {
                await FireStoreService.getParticularUserData(
                    FirebaseService.user.uid);
              }),
        ],
      ),
      floatingActionButton: FloatingActionButton(
        child: Text("go"),
        onPressed: () {
          Navigator.push(context,
              MaterialPageRoute(builder: (context) => StorageImages()));
        },
      ),
    );
  }
}

Widget button({String text, Function callBack, Color colors}) {
  return RaisedButton(
    color: colors,
    onPressed: callBack,
    child: Text(text),
  );
}
