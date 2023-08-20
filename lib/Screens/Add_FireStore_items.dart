import 'package:chatapp/Custome_widget/Utils.dart';
import 'package:chatapp/Custome_widget/yellow_Container.dart';
import 'package:cloud_firestore/cloud_firestore.dart';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class FireStoreItems extends StatefulWidget {
  const FireStoreItems({Key? key}) : super(key: key);

  @override
  State<FireStoreItems> createState() => _FireStoreItemsState();
}

class _FireStoreItemsState extends State<FireStoreItems> {
  final postController = TextEditingController();
  final idController = TextEditingController();
  final ref = FirebaseFirestore.instance.collection('User');

  @override
  void dispose() {
    super.dispose();
    postController.dispose();
    idController.dispose();
  }

  @override
  Widget build(BuildContext context) {
    double height = MediaQuery.of(context).size.height - kToolbarHeight;
    double width = MediaQuery.of(context).size.width;

    return Scaffold(
      resizeToAvoidBottomInset: true,
      appBar: AppBar(
        title: Text('FireStore Add Item Screen'),
      ),
      body: Container(
        height: height,
        width: width,
        color: Colors.white24,
        child: Column(
          children: [
            Padding(
              padding: EdgeInsets.symmetric(vertical: 16, horizontal: 8),
              child: TextFormField(
                  keyboardType: TextInputType.numberWithOptions(),
                  controller: idController,
                  style: TextStyle(color: Colors.black, fontSize: 18),
                  decoration: InputDecoration(
                      labelText: 'Enter your Id',
                      border: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(10),
                          borderSide:
                              BorderSide(width: 3.0, color: Colors.black)))),
            ),
            Padding(
              padding: EdgeInsets.symmetric(vertical: 16, horizontal: 8),
              child: TextFormField(
                  controller: postController,
                  style: TextStyle(color: Colors.black, fontSize: 18),
                  maxLines: 5,
                  decoration: InputDecoration(
                      counterText: '25',
                      labelText: 'Enter your desired Data',
                      border: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(10),
                          borderSide:
                              BorderSide(width: 3.0, color: Colors.black)))),
            ),
            InkWell(
              onTap: () {
                var idnumber = idController.text.toString();
                ref.doc(idnumber).set({
                  'post': postController.text.toString(),
                  'id':idnumber.toString()
                }).then((value) {
                  utils().showtoast('User has been added in firestore');
                }).onError((error, stackTrace) {
                  utils().showtoast(error.toString());
                });
                FocusScope.of(context).unfocus();
                idController.clear();
                postController.clear();
              },
              child: yellowContainer(
                height: height * 0.06,
                width: width / 2,
                radius: BorderRadius.circular(16),
                data_for_Container: Center(
                    child: Text(
                  'Submitted',
                  style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold),
                )),
              ),
            )
          ],
        ),
      ),
    );
  }
}
