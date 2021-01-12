import 'package:firebaseauthedemo/firebaseservice.dart';
import 'package:firebaseauthedemo/screen/homepage.dart';
import 'package:flutter/material.dart';

class SignIn extends StatefulWidget {
  @override
  _SignInState createState() => _SignInState();
}

class _SignInState extends State<SignIn> {
  TextEditingController nameController = TextEditingController();
  TextEditingController passwordController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: Padding(
            padding: EdgeInsets.all(10),
            child: ListView(
              children: <Widget>[
                Container(
                    alignment: Alignment.center,
                    padding: EdgeInsets.all(10),
                    child: Text(
                      'SignIn',
                      style: TextStyle(
                          color: Colors.blue,
                          fontWeight: FontWeight.w500,
                          fontSize: 30),
                    )),
                Container(
                  padding: EdgeInsets.all(10),
                  child: TextField(
                    controller: nameController,
                    decoration: InputDecoration(
                      border: OutlineInputBorder(),
                      labelText: 'EmailId',
                    ),
                  ),
                ),
                Container(
                  padding: EdgeInsets.fromLTRB(10, 10, 10, 0),
                  child: TextField(
                    obscureText: true,
                    controller: passwordController,
                    decoration: InputDecoration(
                      border: OutlineInputBorder(),
                      labelText: 'Password',
                    ),
                  ),
                ),
                FlatButton(
                  onPressed: () async {

                    //forgot password screen
                  },
                  textColor: Colors.blue,
                  child: Text('Forgot Password?'),
                ),
                Container(
                    height: 50,
                    padding: EdgeInsets.fromLTRB(10, 0, 10, 0),
                    child: RaisedButton(
                      textColor: Colors.white,
                      color: Colors.blue,
                      child: Text('Login'),
                      onPressed: () async{
                        dynamic results = await FirebaseService.SignIn(
                            nameController.text, passwordController.text);
                        if (results!=null) {
                          print("jdigjgdfihdrhihjdfrigdfjkh");
                          Navigator.push(context,
                              MaterialPageRoute(builder: (context) => HomePage()));
                        }else {
                          showDialog(context: context, builder: (context) {
                            return AlertDialog(content: Text("Email and password not valid"),);
                          });
                          print("result false ");
                        }
                        print(nameController.text);
                        print(passwordController.text);
                      },
                    )),
              ],
            )));
  }
}
