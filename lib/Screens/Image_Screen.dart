import 'package:chatapp/Custome_widget/Utils.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class Image_Screen extends StatefulWidget {
  const Image_Screen({Key? key}) : super(key: key);

  @override
  State<Image_Screen> createState() => _Image_ScreenState();
}

class _Image_ScreenState extends State<Image_Screen> {
  final ref = FirebaseFirestore.instance.collection('User').snapshots();

  @override
  Widget build(BuildContext context) {
    double height = MediaQuery.of(context).size.height - kToolbarHeight;
    double width = MediaQuery.of(context).size.width;
    return Scaffold(
      appBar: AppBar(
        title: Text('Image Picker Screen'),
      ),
      body: Container(
        height: height,
        width: width,
        color: Colors.cyan,
        child: StreamBuilder(
          stream: ref,
          builder: (context, AsyncSnapshot<QuerySnapshot> snapshot) {
            if (snapshot.hasData) {
              return PageView.builder(
                scrollDirection: Axis.vertical,
                itemCount: snapshot.data!.docs.length,
                itemBuilder: (context, index) {
                  String imag =
                      snapshot.data!.docs[index]['Image Url '].toString();
                  return Container(

                    child: imag == null
                        ? CircularProgressIndicator()
                        : Image.network(imag),
                  );
                },
              );
            } else if (snapshot.hasError) {
              utils().showtoast('SnapShot jas am error');
            }
            return CircularProgressIndicator();
          },
        ),
      ),
    );
  }
}
