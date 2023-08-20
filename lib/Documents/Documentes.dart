import 'package:chatapp/Firebase_Data/Firebase_Buckets.dart';
import 'package:chatapp/Firebase_Data/Firebase_Fields.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class DocumentScreen extends StatefulWidget {
  const DocumentScreen({Key? key}) : super(key: key);

  @override
  State<DocumentScreen> createState() => _DocumentScreenState();
}

class _DocumentScreenState extends State<DocumentScreen> {
  final dbref = FirebaseFirestore.instance
      .collection('Class')
      .where('id', isGreaterThan: 12)
      .snapshots();

  final document = FirebaseFirestore.instance.collection('Class').get();

  @override
  Widget build(BuildContext context) {

    return Scaffold(
      appBar: AppBar(
        title: Text('Document Screen'),
      ),
      body: Container(
        color: Colors.white,
        child: StreamBuilder(
          stream: dbref,
          builder: (context, AsyncSnapshot<QuerySnapshot> snapshot) {
            if (snapshot.hasData) {
              int lenght = snapshot.data!.docs.length;
              print(lenght.toString());
              return ListView.builder(
                itemCount: lenght,
                itemBuilder: (context, index) {
                  DocumentSnapshot doc = snapshot.data!.docs[index];
                  return ListTile(
                    title: Text(doc["dataone"]),
                    subtitle: Text(doc["datatwo"]),
                  );
                },
              );
            } else {
              return Center(
                child: Text('Snapshot has no Data'),
              );
            }
          },
        ),
      ),
      floatingActionButton:
          FloatingActionButton(onPressed: () {
            setState(() {

            });
          }, child: Text('Refresh')),
    );
  }
}
