import 'package:firebaseauthedemo/firebaseservice.dart';
import 'package:firebaseauthedemo/screen/signup.dart';
import 'package:flutter/material.dart';

import 'datafetch_by_stream.dart';
import 'fireStoreData.dart';

class HomePage extends StatefulWidget {
  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.purple,
        title: Text("HomeScreen"),
        actions: [
          GestureDetector(
            onTap: () {
              FirebaseService.logOut().then((value) {
                Navigator.pop(context);
              });
            },
            child: Icon(
              Icons.logout,
              size: 25,
            ),
          ),
          SizedBox(
            width: 20,
          )
        ],
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Container(child: _signInButton(callBack: () async {
              bool istrue = await FirebaseService.signInWithGoogle();
              if (istrue) {
                Navigator.push(
                    context, MaterialPageRoute(builder: (context) => SignUp()));
              } else {
                print("Not true....");
              }
            })),
            SizedBox(
              height: 50,
            ),
            
            GestureDetector(
              child: RaisedButton(
                onPressed: () {

                  Navigator.push(context, MaterialPageRoute(builder: (context) {
                    return StreamDataFetchScreen();
                  }));
                },
                color: Colors.amberAccent,
                child: Text("FirebaseStream Demo"),
              ),
            )
          ],
        ),
      ),
      floatingActionButton: FloatingActionButton(
        child: Icon(Icons.skip_next),
        onPressed: () {
          Navigator.push(context, MaterialPageRoute(builder: (context) {
            return FireStoreData();
          }));
        },
      ),
    );
  }

  Widget _signInButton({Function callBack}) {
    return OutlineButton(
      splashColor: Colors.grey,
      onPressed: callBack,
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(40)),
      highlightElevation: 0,
      borderSide: BorderSide(color: Colors.grey),
      child: Padding(
        padding: const EdgeInsets.fromLTRB(0, 10, 0, 10),
        child: Row(
          mainAxisSize: MainAxisSize.min,
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            // Image(image: AssetImage("assets/images/google.png"), height: 35.0),
            Padding(
              padding: const EdgeInsets.only(left: 10),
              child: Text(
                'Sign in with Google',
                style: TextStyle(
                  fontSize: 20,
                  color: Colors.grey,
                ),
              ),
            )
          ],
        ),
      ),
    );
  }
}
