import 'package:chatapp/Screens/upload_image.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class CollectionClass extends StatefulWidget {
  const CollectionClass({Key? key}) : super(key: key);

  @override
  State<CollectionClass> createState() => _CollectionClassState();
}

class _CollectionClassState extends State<CollectionClass> {
  final messageController = TextEditingController();
  final idController = TextEditingController();
  final nameController = TextEditingController();
  final ref = FirebaseFirestore.instance.collection('Monster');

  @override
  void dispose() {
    super.dispose();
    messageController.dispose();
    idController.dispose();
    nameController.dispose();
  }

  @override
  Widget build(BuildContext context) {
    double height = MediaQuery.of(context).size.height - kToolbarHeight;
    double width = MediaQuery.of(context).size.width;
    return Scaffold(
      resizeToAvoidBottomInset: true,
      appBar: AppBar(
        title: Text('Collection'),
      ),
      body: Container(
        height: height,
        width: width,
        color: Colors.white,
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Padding(
              padding: EdgeInsets.all(10),
              child: TextFormField(
                controller: messageController,
                maxLines: 4,
                decoration:
                    InputDecoration(labelText: 'Enter the message here'),
              ),
            ),
            SizedBox(
              height: height * 0.02,
            ),
            Padding(
              padding: EdgeInsets.all(10),
              child: TextFormField(
                controller: idController,
                decoration: InputDecoration(labelText: 'Enter the id here'),
              ),
            ),
            SizedBox(
              height: height * 0.02,
            ),
            Padding(
              padding: EdgeInsets.all(10),
              child: TextFormField(
                controller: nameController,
                decoration: InputDecoration(
                    labelText: 'Enter the favorite person name here'),
              ),
            ),
            ElevatedButton(
                onPressed: () async {
                  ref.doc('22').set({
                    'id':'its over',
                    'description':'first i am here then you'
                  });

                },
                child: Text('Upload Collection')),
            ElevatedButton(
                onPressed: ()   {
                  ref.doc('22').collection('payout').doc('p1').collection('Khubaib Abbasi').doc('Number 1').set({
                    'id':'Get My Id',
                    'descrip':'I am setting the id of the Monster'
                  });
                },
                child: Text('Upload Again')),
          ],
        ),
      ),
    );
  }

}
///https://www.youtube.com/results?search_query=subcollection+inside+the+collection+in+flutter