import 'package:firebase_core/firebase_core.dart';
import 'package:firebaseauthedemo/screen/homepage.dart';
import 'package:firebaseauthedemo/screen/signup.dart';
import 'package:flutter/material.dart';

void main()async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp();
  runApp(MyApp());
}

class MyApp extends StatefulWidget {
  @override
  _MyAppState createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(home:
    SignUp()
    // HomePage()
      ,);
  }
}
