import 'package:chatapp/Screens/Add_FireStore_items.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_database/firebase_database.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class FireStoreScreen extends StatefulWidget {
  const FireStoreScreen({Key? key}) : super(key: key);

  @override
  State<FireStoreScreen> createState() => _FireStoreScreenState();
}

class _FireStoreScreenState extends State<FireStoreScreen> {
  final ref = FirebaseFirestore.instance.collection('User').snapshots();
  final dbref = FirebaseFirestore.instance.collection('User');

  final editController = TextEditingController();

  @override
  void dispose() {
    super.dispose();
    editController.dispose();
  }

  @override
  Widget build(BuildContext context) {
    double height = MediaQuery.of(context).size.height - kToolbarHeight;
    double width = MediaQuery.of(context).size.height;
    return Scaffold(
      appBar: AppBar(
        title: Text('FireStore Screen'),
      ),
      body: Container(
          height: height,
          width: width,
          child: StreamBuilder<QuerySnapshot>(
            stream: ref,
            builder: (context, AsyncSnapshot<QuerySnapshot> snapshot) {
              if (snapshot.connectionState == ConnectionState.waiting) {
                return Center(
                  child: CircularProgressIndicator(),
                );
              } else if (snapshot.hasError) {
                return Center(
                  child: Text('You have fatel Error'),
                );
              } else {
                return ListView.builder(
                    itemCount: snapshot.data!.docs.length,
                    itemBuilder: (context, index) {
                      String id = snapshot.data!.docs[index]['id'].toString();
                      String name =
                          snapshot.data!.docs[index]['post'].toString();
                      return ListTile(
                          title: Text(
                              snapshot.data!.docs[index]['post'].toString()),
                          subtitle:
                              Text(snapshot.data!.docs[index]['id'].toString()),
                          trailing: IconButton(
                              onPressed: () {
                                showMyDiloug(name, id);
                              },
                              icon: Icon(Icons.more_vert)));
                    });
              }
            },
          )),
      floatingActionButton: FloatingActionButton(
        heroTag: '1',
        onPressed: () {
          Navigator.push(
              context,
              MaterialPageRoute(
                builder: (context) => FireStoreItems(),
              ));
        },
        child: Icon(Icons.add),
      ),
    );
  }

  Future showMyDiloug(String name, String id) async {
    editController.text = name;

    return showDialog(
      context: context,
      builder: (context) {
        return AlertDialog(
          title: Text('Update '),
          content: TextFormField(
            controller: editController,
            decoration: InputDecoration(
                focusedBorder: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(5),
                    borderSide: BorderSide(color: Colors.black))),
          ),
          actions: [
            TextButton(
                onPressed: () {
                  dbref.doc(id).delete();
                  Navigator.pop(context);
                },
                child: Text('Delete')),
            TextButton(
                onPressed: () {
                  dbref.doc(id).update({
                    'post': editController.text.toString(),
                  });
                  Navigator.pop(context);
                },
                child: Text('Update'))
          ],
        );
      },
    );
  }
}
