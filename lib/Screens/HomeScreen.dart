import 'package:chatapp/Custome_widget/Utils.dart';
import 'package:chatapp/Screens/FireStore_Screen.dart';
import 'package:chatapp/Screens/Post_Screen.dart';
import 'package:chatapp/Screens/SignIn.dart';
import 'package:chatapp/Screens/upload_image.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_database/firebase_database.dart';
import 'package:firebase_database/ui/firebase_animated_list.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({Key? key}) : super(key: key);

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  final updateController = TextEditingController();
  final ref = FirebaseDatabase.instance.ref('Post');

  @override
  void dispose() {
    super.dispose();
    updateController.dispose();

  }
  @override
  Widget build(BuildContext context) {
    double height = MediaQuery.of(context).size.height - kToolbarHeight;
    double width = MediaQuery.of(context).size.width;

    return SafeArea(
        child: Scaffold(
      resizeToAvoidBottomInset: false,
      appBar: AppBar(
          title: Text('Home / Post Screes'),
          centerTitle: true,
          backgroundColor: Colors.black45,
          automaticallyImplyLeading: true,
          actions: [
            IconButton(
                onPressed: () {
                  Navigator.push(
                      context,
                      MaterialPageRoute(
                        builder: (context) => HomeScreen(),
                      ));
                },
                icon: Icon(Icons.logout_outlined))
          ]),
      body: Container(
          color: Colors.brown,
          height: height,
          width: width,
          child: Column(
            children: [
              Expanded(
                  child: StreamBuilder(
                stream: ref.onValue,
                builder: (context, AsyncSnapshot<DatabaseEvent> snapshot) {
                  if (!snapshot.hasData) {
                    return Center(child: CircularProgressIndicator());
                  } else {
                    Map<dynamic, dynamic> map =
                        snapshot.data!.snapshot.value as dynamic;
                    List<dynamic> list = [];
                    list = map.values.toList();

                    return Padding(
                      padding: EdgeInsets.all(8.0),
                      child: ListView.builder(
                        itemCount: snapshot.data!.snapshot.children.length,
                        itemBuilder: (context, index) {
                          String name = list[index]['post_of_User'].toString();
                          var id = list[index]['id'].toString();
                          return Padding(
                            padding: EdgeInsets.all(8.0),
                            child: ListTile(
                              title: Text(
                                list[index]['post_of_User'].toString(),
                                style: TextStyle(
                                  color: Colors.white,
                                  fontSize: 22,
                                ),
                              ),
                              trailing: PopupMenuButton(
                                icon: Icon(
                                  Icons.more_vert,
                                  color: Colors.white,
                                ),
                                itemBuilder: (BuildContext context) => [
                                  PopupMenuItem(
                                    value: 1,
                                    child: ListTile(
                                      onTap: () {
                                        showMyDiloug(name, id);
                                      },
                                      leading: Icon(
                                          Icons.tips_and_updates_outlined,
                                          color: Colors.black),
                                      title: Text('update'),
                                    ),
                                  ),
                                  PopupMenuItem(
                                    value: 2,
                                    child: ListTile(
                                      onTap: () {
                                        ref.child(id).remove();
                                        Navigator.pop(context);
                                      },
                                      leading: Icon(Icons.delete),
                                      title: Text('delete'),
                                    ),
                                  ),
                                ],
                              ),
                            ),
                          );
                        },
                      ),
                    );
                  }
                },
              ))
            ],
          )),
      floatingActionButton: Row(
        mainAxisAlignment: MainAxisAlignment.spaceAround,
        children: [FloatingActionButton(
          heroTag: 'khubab',
        backgroundColor: Colors.white,
        onPressed: () {
          Navigator.push(
              context,
              MaterialPageRoute(
                builder: (context) => upload_Image(),
              ));
        },
        child: Icon(
          Icons.add,
          color: Colors.black,
        ),
      ),
        FloatingActionButton(
          heroTag: 'zero',
          backgroundColor: Colors.white,
          onPressed: () {
            Navigator.push(
                context,
                MaterialPageRoute(
                  builder: (context) => FireStoreScreen(),
                ));
          },
          child: Icon(
            Icons.ac_unit_outlined,
            color: Colors.black,
          ),
        ),],)
    ));
  }

  Future showMyDiloug(String name, String id) async {
    updateController.text = name;
    return showDialog(
      context: context,
      builder: (context) {
        return AlertDialog(
          title: Text('Update'),
          content: TextFormField(
            controller: updateController,
            decoration: InputDecoration(
                enabledBorder: OutlineInputBorder(
                    borderSide: BorderSide(color: Colors.black))),
          ),
          actions: [
            TextButton(
                onPressed: () {
                  Navigator.of(context).pop();
                },
                child: Text('Cancel')),
            TextButton(
                onPressed: () {
                  ref
                      .child(id)
                      .update(
                          {'post_of_User': updateController.text.toString()})
                      .then(
                          (value) => utils().showtoast('Post has been Updated'))
                      .onError((error, stackTrace) =>
                          utils().showtoast(error.toString()));
                  Navigator.pop(context);
                },
                child: Text('Update')),
          ],
        );
      },
    );
  }

// FirebaseAnimatedList(
//                   query: ref,
//                   itemBuilder: (context, snapshot, animation, index) {
//                     return ListTile(
//                       leading: CircleAvatar(child: Text(index.toString())),
//                       title: Text(snapshot.child('post_of_User').value.toString()),
//                     );
//                   },
//                 ),
}
