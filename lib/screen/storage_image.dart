import 'package:firebase_storage/firebase_storage.dart';
import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';

class StorageImages extends StatefulWidget {
  @override
  _StorageImagesState createState() => _StorageImagesState();
}

class _StorageImagesState extends State<StorageImages> {
  String imageUrl;
  var _image;

  uploadImage() async {
    _image = await ImagePicker.pickImage(source: ImageSource.gallery);
    FirebaseStorage firebaseStorage = FirebaseStorage.instance;
    Reference reference = firebaseStorage.ref();
    Reference folderRef = reference.child("Pictures").child("Image/${DateTime.now().millisecondsSinceEpoch}");
    print("folderReference---->$folderRef");
    folderRef.putFile(_image).then((storageTask) async {
      String link = await storageTask.ref.getDownloadURL();
      print("ImageLink --->$link");
      setState(() {
        imageUrl = link;
      });
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          imageUrl != null
              ? CircleAvatar(
                  radius:  250,
                  child: ClipOval(
                    child: Image.network(
                      imageUrl,
                      fit: BoxFit.cover,
                      height: 600,
                      width: 500,
                    ),
                  ),
                )
              : CircleAvatar(
                  child: ClipOval(child: Icon(Icons.person_add_alt_1)),
                  radius: 250,
                ),
          SizedBox(
            height: 20,
          ),
          FlatButton(
            onPressed: () async {
              print("tap");
              await uploadImage();
            },
            child: Text("change image"),
            color: Colors.blueGrey,
          )
        ],
      ),
    );
  }
}
