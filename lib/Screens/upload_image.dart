import 'dart:io';
import 'package:chatapp/Custome_widget/Utils.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:cross_file_image/cross_file_image.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:firebase_storage/firebase_storage.dart' as firebase_storage;
import 'package:image_picker/image_picker.dart';

import 'Image_Screen.dart';

class upload_Image extends StatefulWidget {
  upload_Image({Key? key}) : super(key: key);

  @override
  State<upload_Image> createState() => _upload_ImageState();
}

class _upload_ImageState extends State<upload_Image> {
  final dbref = FirebaseFirestore.instance.collection('User');

  XFile? image;
  File? file;
  firebase_storage.FirebaseStorage storage =
      firebase_storage.FirebaseStorage.instance;

  final picker = ImagePicker();

  Future getImageFromGellery() async {
    final pickedImage =
        await picker.pickImage(source: ImageSource.gallery, imageQuality: 70);
    setState(() {
      if (pickedImage != null) {
        image = XFile(pickedImage.path);
        file = File(image!.path);
      } else {
        utils().showtoast('No image Selected');
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    double height = MediaQuery.of(context).size.height - kToolbarHeight;
    double width = MediaQuery.of(context).size.width;
    return Scaffold(
      appBar: AppBar(
        title: Text('Upload Image'),
      ),
      body: Container(
        height: height,
        width: width,
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Padding(
              padding: EdgeInsets.all(12),
              child: InkWell(
                onTap: () {
                  getImageFromGellery();
                },
                child: Container(
                  height: height / 3,
                  width: width / 2,
                  decoration:
                      BoxDecoration(border: Border.all(color: Colors.black)),
                  child: image != null
                      ? Image(image: XFileImage(image!))
                      : Icon(Icons.image),
                ),
              ),
            ),
            ElevatedButton(
                onPressed: () async {
                  firebase_storage.Reference ref = firebase_storage
                      .FirebaseStorage.instance
                      .ref('/images/' + 'takken')
                      .child('User');
                  firebase_storage.UploadTask uploadtask =
                      ref.putFile(file!.absolute);

                  Future.value(uploadtask).then((value) async {
                    utils().showtoast('file has been uploaded');
                    var newUrl = await ref.getDownloadURL();
                    dbref.doc('11111').set({
                      'id': '22222',
                      'Image Url ': newUrl.toString(),
                    });


                  }).onError((error, stackTrace) =>
                      utils().showtoast(error.toString()));
                },
                child: Text('upload')),
            ElevatedButton(
                onPressed: () {
                  Navigator.of(context).push(MaterialPageRoute(
                    builder: (context) => Image_Screen(),
                  ));
                },
                child: Text('View Image')),
          ],
        ),
      ),
    );
  }
}
