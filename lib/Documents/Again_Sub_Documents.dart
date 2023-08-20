import 'package:chatapp/Firebase_Data/Firebase_Buckets.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class AgainSubDocumentScreen extends StatefulWidget {
  const AgainSubDocumentScreen({Key? key}) : super(key: key);

  @override
  State<AgainSubDocumentScreen> createState() => _AgainSubDocumentScreenState();
}

class _AgainSubDocumentScreenState extends State<AgainSubDocumentScreen> {
  final ref = FirebaseFirestore.instance
      .collection(FirebaseBuckets.Monster)
      .doc('22')
      .collection('payout')
      .doc('p1')
      .collection('Khubaib Abbasi')
      .snapshots();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Document Screen'),
      ),
      body: Container(
        color: Colors.white,
        child: StreamBuilder(
          stream: ref,
          builder: (context, AsyncSnapshot<QuerySnapshot> snapshot) {
            return ListView.builder(
              itemCount: snapshot.data!.docs.length,
              itemBuilder: (context, index) {
                final dbref = snapshot.data!.docs[index];

                return ListTile(
                  title: Text(dbref['descrip']),
                  subtitle: Text(dbref['id']),
                );
              },
            );
          },
        ),
      ),
    );
  }
}
