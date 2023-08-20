import 'package:chatapp/Firebase_Data/Firebase_Buckets.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class SubDocumentScreen extends StatefulWidget {
  const SubDocumentScreen({Key? key}) : super(key: key);

  @override
  State<SubDocumentScreen> createState() => _SubDocumentScreenState();
}

class _SubDocumentScreenState extends State<SubDocumentScreen> {
  final dbref = FirebaseFirestore.instance
      .collection(FirebaseBuckets.Monster).doc('22').collection('payout').snapshots();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Document Screen'),
      ),
      body: Container(
        color: Colors.white,
        child: StreamBuilder(
          builder: (context, snapshot) {
            return StreamBuilder(
              stream: dbref,
              builder: (context, AsyncSnapshot<QuerySnapshot> snapshot) {



                if (snapshot.hasData) {
                  return ListView.builder(
                    itemCount: snapshot.data!.docs.length,
                    itemBuilder: (context, index) {
                      final ref = snapshot.data!.docs[index];
                      return ListTile(
                        title: Text(ref['descrip']),
                        subtitle: Text('id'),
                      );
                    },
                  );
                } else if (snapshot.hasError) {
                  return Center(
                    child: Text('Error in Snapshot'),
                  );
                }
                return Center(
                  child: Text('Nothing Here Please Try Again Latter'),
                );
              },
            );
          },
        ),
      ),
    );
  }
}
