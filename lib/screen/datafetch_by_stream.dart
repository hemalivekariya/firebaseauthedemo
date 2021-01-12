import 'package:firebaseauthedemo/models/user_model.dart';
import 'package:firebaseauthedemo/streams/user_data_stream.dart';
import 'package:flutter/material.dart';

class StreamDataFetchScreen extends StatefulWidget {
  @override
  _StreamDataFetchScreenState createState() => _StreamDataFetchScreenState();
}

class _StreamDataFetchScreenState extends State<StreamDataFetchScreen> {
  UserStream userStream;
  List<UserModel> user = new List<UserModel>();

  @override
  void initState() {
    userStream = UserStream();
    userStream.userStream.listen((event) {
      setState(() {
        user.add(event);
      });
      print("events---->$event");
    });

    userStream.getAllUser();
    // TODO: implement initState
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
          appBar: AppBar(
            title: Text("User Data"),
          ),
          body: Center(
            child: ListView.builder(
                itemCount: user?.length ?? 0,
                itemBuilder: (context, int index) {
                  return Container(
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Text("user uid ${user[index].uid}"),
                        Text("user email ${user[index].email}"),
                        Text("user address ${user[index].address}"),
                        Text("user age ${user[index].age}"),
                        Text(
                            "user characteristics ${user[index].characteristics}"),
                        Text("user languages ${user[index].languages}"),
                        Text("user name ${user[index].name}")
                      ],
                    ),
                  );
                }),
          )),
    );
  }
}
