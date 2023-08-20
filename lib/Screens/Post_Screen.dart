import 'package:chatapp/Custome_widget/yellow_Container.dart';
import 'package:firebase_database/firebase_database.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class PostScreen extends StatefulWidget {
  const PostScreen({Key? key}) : super(key: key);

  @override
  State<PostScreen> createState() => _PostScreenState();
}

class _PostScreenState extends State<PostScreen> {
  final postController = TextEditingController();
  final idController = TextEditingController();
  final dbref = FirebaseDatabase.instance.ref('Post');
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
        title: Text('Post Screen'),
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
                dbref.child(idnumber).set({
                 'post_of_User' :postController.text.toString(),
                  'id':idnumber,
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
